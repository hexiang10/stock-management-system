package com.qywms.controller.admin;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.qywms.entity.GoodsType;
import com.qywms.entity.Log;
import com.qywms.service.GoodsService;
import com.qywms.service.GoodsTypeService;
import com.qywms.service.LogService;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品类别管理Controller
 */
@RestController
@RequestMapping("/admin/goodsType")
public class GoodsTypeAdminController {

    @Resource
    private GoodsTypeService goodsTypeService;

    @Resource
    private LogService logService;

    @Resource
    private GoodsService goodsService;

    /**
     * 添加商品类别
     *
     * @param name
     * @param parentId
     * @return
     */
    @RequestMapping("/save")
    @RequiresPermissions(value = {"商品管理", "进货入库","退货出库"}, logical = Logical.OR)
    public Map<String, Object> save(String name, Integer parentId) {
        Map<String, Object> resultMap = new HashMap<>(16);
        GoodsType goodsType = new GoodsType();
        goodsType.setName(name);
        goodsType.setState(0);
        goodsType.setpId(parentId);
        goodsType.setIcon("icon-folder");
        goodsTypeService.save(goodsType);
        //添加的节点的父节点
        GoodsType parentGoodsType = goodsTypeService.findById(parentId);
        parentGoodsType.setState(1);
        goodsTypeService.save(parentGoodsType);

        logService.save(new Log(Log.ADD_ACTION, "添加商品类别信息"));
        resultMap.put("success", true);
        return resultMap;
    }

    /**
     * 商品类别删除
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @RequiresPermissions(value = {"商品管理", "进货入库","退货出库"}, logical = Logical.OR)
    public Map<String, Object> delete(Integer id) {
        Map<String, Object> resultMap = new HashMap<>(16);
        //要删除的商品类别下没有商品时,可以删除该商品类别
        if (goodsService.findByTypeId(id).size() == 0) {
            GoodsType goodsType = goodsTypeService.findById(id);
            //当要删除的商品类别的父节点下只有一个子节点时,要修改其父节点的状态为0,变成子节点
            if (goodsTypeService.findByParentId(goodsType.getpId()).size() == 1) {
                GoodsType parentGoodsType = goodsTypeService.findById(goodsType.getpId());
                parentGoodsType.setState(0);
                goodsTypeService.save(parentGoodsType);
            }
            logService.save(new Log(Log.DELETE_ACTION, "删除商品类别信息" + goodsType));
            goodsTypeService.delete(id);
            resultMap.put("success", true);
        } else {
            resultMap.put("success", false);
            resultMap.put("errorInfo", "该类别下有商品,不能删除!");
        }
        return resultMap;
    }

    /**
     * 根据父节点获取所有商品类别菜单
     *
     * @return
     */
    @RequestMapping("/loadTreeInfo")
    @RequiresPermissions(value = {"商品管理", "进货入库","退货出库"}, logical = Logical.OR)
    public String loadTreeInfo() {
        logService.save(new Log(Log.SEARCH_ACTION, "查询所有商品类别信息"));
        return getAllByParentId(-1).toString();
    }

    /**
     * 根据父节点id和商品类别菜单id集合获取所有复选框菜单集合
     *
     * @param parentId
     * @return
     */
    public JsonArray getAllByParentId(Integer parentId) {
        JsonArray jsonArray = this.getByParentId(parentId);
        for (int i = 0; i < jsonArray.size(); i++) {
            JsonObject jsonObject = (JsonObject) jsonArray.get(i);
            if ("open".equals(jsonObject.get("state").getAsString())) {
                continue;
            } else {
                jsonObject.add("children", getAllByParentId(jsonObject.get("id").getAsInt()));
            }
        }
        return jsonArray;
    }

    /**
     * 根据父节点查询所有子节点
     *
     * @param parentId
     * @return
     */
    public JsonArray getByParentId(Integer parentId) {
        List<GoodsType> goodsTypeList = goodsTypeService.findByParentId(parentId);
        JsonArray jsonArray = new JsonArray();
        for (GoodsType goodsType : goodsTypeList) {
            JsonObject jsonObject = new JsonObject();
            //节点id
            jsonObject.addProperty("id", goodsType.getId());
            //节点名称
            jsonObject.addProperty("text", goodsType.getName());
            if (goodsType.getState() == 1) {
                //根节点
                jsonObject.addProperty("state", "closed");
            } else {
                //叶子节点
                jsonObject.addProperty("state", "open");
            }
            //节点图标
            jsonObject.addProperty("iconCls", goodsType.getIcon());
            //扩展属性
            JsonObject attributeObject = new JsonObject();
            //节点状态
            attributeObject.addProperty("state", goodsType.getState());
            jsonObject.add("attributes", attributeObject);
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }
}

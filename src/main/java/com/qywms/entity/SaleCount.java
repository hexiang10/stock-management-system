package com.qywms.entity;

/**
 * 销售统计
 */

public class SaleCount {

    /**
     * 成本总金额
     */
    private float amountCost;
    /**
     * 销售总金额
     */
    private float amountSale;
    /**
     * 销售利润
     */
    private float amountProfit;
    /**
     * 日期
     */
    private String date;

    public float getAmountCost() {
        return amountCost;
    }

    public void setAmountCost(float amountCost) {
        this.amountCost = amountCost;
    }

    public float getAmountSale() {
        return amountSale;
    }

    public void setAmountSale(float amountSale) {
        this.amountSale = amountSale;
    }

    public float getAmountProfit() {
        return amountProfit;
    }

    public void setAmountProfit(float amountProfit) {
        this.amountProfit = amountProfit;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}

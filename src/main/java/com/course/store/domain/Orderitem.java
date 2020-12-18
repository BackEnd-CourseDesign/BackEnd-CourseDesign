package com.course.store.domain;
public class Orderitem {
    private int count;
    private double subtotal;
    private Product product;
    private String oid;
    public Orderitem(){

    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Orderitem(int count, double subtotal, Product product, String oid) {
        this.count = count;
        this.subtotal = subtotal;
        this.product = product;
        this.oid = oid;
    }

    public int getCount() {
        return count;
    }
    public String getPid() {
        return product.getPid();
    }
    public void setCount(int count) {
        this.count = count;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    @Override
    public String toString() {
        return "Orderitem{" +
                "count=" + count +
                ", subtotal=" + subtotal +
                ", product=" + product.getPid() +
                ", oid='" + oid + '\'' +
                '}';
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }


}

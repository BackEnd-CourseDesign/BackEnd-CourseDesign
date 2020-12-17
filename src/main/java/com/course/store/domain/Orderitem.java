package com.course.store.domain;
public class Orderitem {
    private int count;
    private double subtotal;
    private String pid;
    private String oid;
    public Orderitem(){

    }

    public int getCount() {
        return count;
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

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public Orderitem(int count, double subtotal, String pid, String oid) {
        this.count = count;
        this.subtotal = subtotal;
        this.pid = pid;
        this.oid = oid;
    }
}

package com.course.store.domain;

public class Activecode {
    private String uid;
    private String activecode;

    public Activecode() {
    }

    public Activecode(String uid, String activecode) {
        this.uid = uid;
        this.activecode = activecode;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getActivecode() {
        return activecode;
    }

    public void setActivecode(String activecode) {
        this.activecode = activecode;
    }
}

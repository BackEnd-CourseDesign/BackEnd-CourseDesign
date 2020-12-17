package com.course.store.domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class User {
    private String uid;//用户id
    private String username;
    private String password;
    private String name;
    private String email;
    private Date birthday;
    private String gender;
    private int state;
    private String code;
    private String remark;
    private Timestamp updatetime;//upatetime

    public User() {
    }

    public User(String uid, String username, String password, String name, String email, Date birthday, String gender, int state, String code, String remark, Timestamp updatetime) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.birthday = birthday;
        this.gender = gender;
        this.state = state;
        this.code = code;
        this.remark = remark;
        this.updatetime = updatetime;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid='" + uid + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", birthday=" + birthday +
                ", gender='" + gender + '\'' +
                ", state=" + state +
                ", code='" + code + '\'' +
                ", remark='" + remark + '\'' +
                ", updatetime=" + updatetime +
                '}';
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public long getUpdatetime() {
        return updatetime.getTime();
    }

    public void setUpdatetime(Timestamp updatetime) {
        this.updatetime = updatetime;
    }

    public Map<String, String> validation() {
        Map<String, String> map = new HashMap<String, String>();
        if (username == null || username.trim().length() == 0) {
            map.put("regist.username.error", "用户名不能为空");
        }
        if (password == null || password.trim().length() == 0) {
            map.put("regist.password.error", "密码不能为空");
        }
        return map;
    }
}

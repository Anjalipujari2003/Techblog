/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.entities;
import java.sql.*;

public class Post {
    private int pid;
    private String ptitle;
    private String pcontent;
    private String pcode;
    private String ppic;
    private Timestamp pdate;
    private int cid;
    private int userId;
    public Post(){
        
    }

    public Post(int pid, String ptitle, String pcontent, String pcode, String ppic, Timestamp  pdate, int cid,int userId ) {
        this.pid = pid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcode = pcode;
        this.ppic = ppic;
        this.pdate = pdate;
        this.cid = cid;
        this.userId=userId;
    }

    public Post(String ptitle, String pcontent, String pcode, String ppic, Timestamp  pdate, int cid, int userId) {
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcode = pcode;
        this.ppic = ppic;
        this.pdate = pdate;
        this.cid = cid;
        this.userId=userId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public String getPcode() {
        return pcode;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic;
    }

    public Timestamp  getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp  pdate) {
        this.pdate = pdate;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    

    
    
}

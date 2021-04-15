package cn.edu.seu.cose.docmanage.entity;

import lombok.Data;

import java.util.Date;

@Data
public class User {

    private String id;
    private String username;
    private String password;
    private Boolean deleted;
    private Date createTime;
    private Date modifyTime;

}

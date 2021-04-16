package cn.edu.seu.cose.docmanage.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Role {

    private String id;
    private String name;
    private String description;
    private Date createTime;
    private Date modifyTime;

}

package cn.edu.seu.cose.docmanage.entity;

import lombok.Data;
import lombok.NonNull;

import java.util.Date;

@Data

public class User {

    @NonNull
    private String id;
    @NonNull
    private String username;
    @NonNull
    private String password;

    private Date createTime;
    private Date modifyTime;

}

package cn.edu.seu.cose.docmanage.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

@Data
public class Role implements Serializable {

    private static final long serialVersionUID = 154621842836086052L;

    private UUID id;
    private String name;
    private String description;

}

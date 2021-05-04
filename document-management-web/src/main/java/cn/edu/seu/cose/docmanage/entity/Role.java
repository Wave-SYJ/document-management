package cn.edu.seu.cose.docmanage.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.UUID;

@Data
@NoArgsConstructor
public class Role implements Serializable {

    private static final long serialVersionUID = 154621842836086052L;

    private UUID id;
    private String name;
    private String description;

    public Role(String name) {
        this.name = name;
    }
}

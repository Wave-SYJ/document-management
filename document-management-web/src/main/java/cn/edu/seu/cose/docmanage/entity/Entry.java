package cn.edu.seu.cose.docmanage.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Entry {

    private UUID id;
    private String name;
    private String description;

}

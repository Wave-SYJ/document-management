package cn.edu.seu.cose.docmanage.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Announcement {
    private UUID id;
    private String content;
    private UUID publisherId;
    private Date publishTime;
}

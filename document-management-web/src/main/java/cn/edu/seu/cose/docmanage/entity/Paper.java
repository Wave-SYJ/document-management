package cn.edu.seu.cose.docmanage.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.util.Date;
import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Paper {
    private UUID id;
    private String title;
    private String author;
    private String paperAbstract;
    private Date publishTime;
    private String authorOffice;
    private String keyword;
    private UUID journalId;
    private String url;


}

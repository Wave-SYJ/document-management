package cn.edu.seu.cose.docmanage.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Announcement {
    private UUID id;
    private String content;
    private UUID publisherId;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date publishTime;
}

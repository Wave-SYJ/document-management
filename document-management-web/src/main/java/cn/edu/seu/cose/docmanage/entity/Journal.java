package cn.edu.seu.cose.docmanage.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Journal {

    private UUID id;
    private String title;
    private String organizerOffice;
    private byte[] image;
    private String language;
    private String issn;
}

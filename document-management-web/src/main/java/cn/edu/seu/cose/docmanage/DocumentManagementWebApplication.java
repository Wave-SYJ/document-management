package cn.edu.seu.cose.docmanage;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("cn.edu.seu.cose.docmanage.mapper")
public class DocumentManagementWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(DocumentManagementWebApplication.class, args);
    }

}

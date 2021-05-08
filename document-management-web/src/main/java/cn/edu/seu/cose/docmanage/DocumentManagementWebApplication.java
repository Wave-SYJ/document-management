package cn.edu.seu.cose.docmanage;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;

@SpringBootApplication
@MapperScan("cn.edu.seu.cose.docmanage.mapper")
@Slf4j
public class DocumentManagementWebApplication {

    public static void main(String[] args) {
        ConfigurableApplicationContext context = SpringApplication.run(DocumentManagementWebApplication.class, args);
        Environment environment = context.getBean(Environment.class);
        log.info("监听端口：" + environment.getProperty("server.port"));
    }

}

package cn.edu.seu.cose.docmanage.TzTest;

import cn.edu.seu.cose.docmanage.UserTester;
import cn.edu.seu.cose.docmanage.entity.Entry;
import cn.edu.seu.cose.docmanage.service.EntryService;
import com.github.pagehelper.Page;
import org.apache.ibatis.jdbc.Null;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.stream.Collectors;

@SpringBootTest
public class EntryTester {
    @Autowired
    private EntryService entryService;

    private final Random random = new Random();


    @Test
    public void insertEntryTest(){
        for (int i = 0; i < 100; i++) {
            entryService.insertEntry(new Entry(null,"标题"+i,"内容"+i));
        }
    }

//    @Test
//    public List<Entry> findEntryTest(){
//
//        return entryService.findEntry(1, 10, "已经修改的");
//    }
//    @Test
//    public void deleteEntryTest(){
//        List<Entry> entryList = findEntryTest();
//        List<UUID> collect = entryList.stream().map(Entry::getId).collect(Collectors.toList());
//        System.out.println(collect);
//        entryService.deleteEntry(collect);
//    }
//
//    @Test
//    public void updateEntryTest(){
//        List<Entry> entryList = findEntryTest();
//        List<Entry> collect = entryList.stream().peek(entry -> entry.setName("已经修改的"+entry.getName())).collect(Collectors.toList());
//        for (Entry e:collect) {
//            entryService.updateEntry(e);
//        }
//    }
}

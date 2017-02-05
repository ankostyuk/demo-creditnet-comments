package ru.nullpointer.nkbcomment.utils;

import com.mongodb.DBObject;
import com.mongodb.util.JSON;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Collection;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.util.FileCopyUtils;

/**
 *
 * @author Alexander Yastrebov
 */
public class MongoUtils {

    private Logger logger = LoggerFactory.getLogger(MongoUtils.class);
    //
    @Resource
    private MongoTemplate mongoTemplate;
    //
    @Resource
    private ApplicationContext applicationContext;

    @SuppressWarnings("unchecked")
    public void loadFromResource(String resourceName, Class<?> clazz) {
        try {
            InputStream is = applicationContext.getResource(resourceName).getInputStream();
            String s = FileCopyUtils.copyToString(new InputStreamReader(is));
            is.close();

            Collection<DBObject> o = (Collection<DBObject>) JSON.parse(s);
            mongoTemplate.insert(o, clazz);
        } catch (IOException ex) {
            throw new RuntimeException(ex);
        }
    }
}

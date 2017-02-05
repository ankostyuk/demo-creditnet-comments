package ru.nullpointer.nkbcomment.filestorage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.util.Assert;
import ru.nullpointer.nkbcomment.domain.StoredFile;

/**
 *
 * @author Alexander Yastrebov
 */
public class SimpleFileStorage implements FileStorage, InitializingBean {

    private Logger logger = LoggerFactory.getLogger(SimpleFileStorage.class);
    //
    private File storageRoot;

    @Override
    public StoredFile store(StoredFile file) {
        String id = UUID.randomUUID().toString();

        File f = new File(storageRoot, id);

        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(f);
            file.getDataHandler().writeTo(fos);
        } catch (IOException ex) {
            return null;
        } finally {
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException ex) {
                    logger.error("Error closing stream", ex);
                }
            }
        }

        file.setId(id);

        return file;
    }

    @Override
    public StoredFile load(String id) {
        Assert.hasText(id);

        File f = new File(storageRoot, id);
        if (!f.canRead()) {
            return null;
        }

        StoredFile result = new StoredFile();
        result.setId(id);
        result.setDataHandler(new DataHandler(new FileDataSource(f)));

        return result;
    }

    @Override
    public void delete(String id) {
        Assert.hasText(id);

        File f = new File(storageRoot, id);
        f.delete();
    }

    public void setStorageRoot(String path) {
        File f = new File(path);

        Assert.isTrue(f.exists(), "Storage path '" + path + "' does not exist");
        Assert.isTrue(f.isDirectory(), "Storage path '" + path + "' is not a directory");

        storageRoot = f;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        Assert.notNull(storageRoot, "Storage root must be set");
    }
}

package ru.nullpointer.nkbcomment.filestorage;

import creditnet.cnas.common.NcbUUID;
import creditnet.cnas.service.ClientFile;
import creditnet.cnas.service.FileContentServiceEndpoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.util.Assert;
import ru.nullpointer.nkbcomment.domain.StoredFile;
import ru.nullpointer.nkbcomment.service.SecurityService;

/**
 *
 * @author Alexander Yastrebov
 */
public class CnasFileStorage implements FileStorage, InitializingBean {

    private Logger logger = LoggerFactory.getLogger(CnasFileStorage.class);
    //
    private FileContentServiceEndpoint fileContentServiceEndpoint;
    private SecurityService securityService;

    @Override
    public StoredFile store(StoredFile file) {

        ClientFile clientFile = new ClientFile(
                file.getFilename(),
                file.getDataHandler().getContentType(),
                file.getDataHandler(),
                securityService.getAuthenticatedUserId());

        NcbUUID uuid = fileContentServiceEndpoint.uploadFile(clientFile);
        file.setId(uuid.toString());

        return file;
    }

    @Override
    public StoredFile load(String id) {
        Assert.hasText(id);

        NcbUUID uuid;
        try {
            uuid = new NcbUUID(id);
        } catch (NumberFormatException ex) {
            logger.warn("Illegal file id: {}", id);
            return null;
        }
        ClientFile clientFile = fileContentServiceEndpoint.downloadFile(uuid);

        if (clientFile == null) {
            return null;
        }

        Assert.isTrue(id.equals(clientFile.getId().toString()));

        StoredFile result = new StoredFile();
        result.setId(id);
        result.setDataHandler(clientFile.getContent());

        return result;
    }

    @Override
    public void delete(String id) {
        logger.warn("File deletion is not supported yet.");
    }

    public void setFileContentServiceEndpoint(FileContentServiceEndpoint fileContentServiceEndpoint) {
        this.fileContentServiceEndpoint = fileContentServiceEndpoint;
    }

    public void setSecurityService(SecurityService securityService) {
        this.securityService = securityService;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        Assert.notNull(fileContentServiceEndpoint, "'fileContentServiceEndpoint' must be set");
        Assert.notNull(securityService, "'securityService' must be set");
    }
}

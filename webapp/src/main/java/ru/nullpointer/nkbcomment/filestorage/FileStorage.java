package ru.nullpointer.nkbcomment.filestorage;

import ru.nullpointer.nkbcomment.domain.StoredFile;

/**
 *
 * @author Alexander Yastrebov
 */
public interface FileStorage {

    StoredFile store(StoredFile file);

    StoredFile load(String id);
    
    void delete(String id);
}

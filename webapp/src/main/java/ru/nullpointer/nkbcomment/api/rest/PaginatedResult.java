/**
 * 
 */
package ru.nullpointer.nkbcomment.api.rest;

import java.util.Collection;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSeeAlso;

import ru.nullpointer.nkbcomment.domain.Comment;

/**
 * @author ankostyuk
 *
 */
@XmlRootElement
@XmlSeeAlso({Comment.class})
public class PaginatedResult<T> {
    
    private Collection<T> entries;
    private long total;
    private long pageNumber;
    private long pageSize;
    private long pageCount;
    private long firstNumber;
    private long lastNumber;

    public Collection<T> getEntries() {
        return entries;
    }

    public void setEntries(Collection<T> entries) {
        this.entries = entries;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public long getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(long pageNumber) {
        this.pageNumber = pageNumber;
    }

    public long getPageSize() {
        return pageSize;
    }

    public void setPageSize(long pageSize) {
        this.pageSize = pageSize;
    }

    public long getPageCount() {
        return pageCount;
    }

    public void setPageCount(long pageCount) {
        this.pageCount = pageCount;
    }

    public long getFirstNumber() {
        return firstNumber;
    }

    public void setFirstNumber(long firstNumber) {
        this.firstNumber = firstNumber;
    }

    public long getLastNumber() {
        return lastNumber;
    }

    public void setLastNumber(long lastNumber) {
        this.lastNumber = lastNumber;
    }
}

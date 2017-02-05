package ru.nullpointer.nkbcomment.support;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.util.Assert;

/**
 * @author Alexander Yastrebov
 * @author ankostyuk
 */
public class PageConfig {

    private int pageNumber;
    private int pageSize;

    /**
     * Настройка постраничной выборки. Нумерация страниц с ЕДИНИЦЫ.
     * @param pageNumber Номер страницы.
     * Если номер страницы равен <code>null</code> или меньше единицы,
     * то принимается значение равное единице.
     * @param pageSize Размер страницы. Может иметь любое положительное значение
     */
    public PageConfig(Integer pageNumber, int pageSize) {
        Assert.isTrue(pageSize > 0);
        
        this.pageNumber = (pageNumber == null || pageNumber < 1) ? 1 : pageNumber;
        this.pageSize = pageSize;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}

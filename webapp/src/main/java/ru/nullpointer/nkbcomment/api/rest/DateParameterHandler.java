package ru.nullpointer.nkbcomment.api.rest;

import java.util.Date;
import javax.xml.bind.DatatypeConverter;
import org.apache.cxf.jaxrs.ext.ParameterHandler;
import ru.nullpointer.nkbcomment.service.BadArgumentException;

/**
 *
 * @author Alexander Yastrebov
 */
public class DateParameterHandler implements ParameterHandler<Date> {

    @Override
    public Date fromString(String string) {
        try {
            return DatatypeConverter.parseDateTime(string).getTime();
        } catch (Exception ex) {
            throw new BadArgumentException("Unable to parse date: '" + ex.getMessage() + "'");
        }
    }
}

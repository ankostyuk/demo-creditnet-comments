package ru.nullpointer.nkbcomment.api.rest;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;
import org.apache.cxf.jaxrs.ext.ResponseHandler;
import org.apache.cxf.jaxrs.model.OperationResourceInfo;
import org.apache.cxf.message.Message;

/**
 * Обработчик для поддержки скачивания файлов веб-браузером. Для корректной
 * обработки ответа веб-браузером изменяет Content-type и HTTP статус ответа 
 * для HTTP статусов отличных от 2XX.
 *
 * Для всех REST-методов, помеченных аннотацией @FileDownload, 
 * в случае HTTP статуса отличного от 2XX, 
 * выставляет заголовок ответа Content-type: text/plain и выставляет HTTP статус 200
 *
 * @author ankostyuk
 */
public class FileDownloadSupportHandler implements ResponseHandler {

    @Override
    public Response handleResponse(Message msg, OperationResourceInfo ori, Response resp) {
        if (isApplicable(ori)) {
            return modifyResponse(msg, resp);
        }
        return resp;
    }

    private boolean isApplicable(OperationResourceInfo ori) {
        if (ori == null) {
            return false;
        }

        Method method = ori.getMethodToInvoke();
        FileDownload marker = method.getAnnotation(FileDownload.class);

        return (marker != null);
    }

    @SuppressWarnings("unchecked")
    private Response modifyResponse(Message msg, Response resp) {
        int status = resp.getStatus();
        
        if (status < 200 || status >= 300) {
            status = 200;
            
            Map<String, List<String>> headers = (Map<String, List<String>>) msg.get(Message.PROTOCOL_HEADERS);
            if (headers == null) {
                headers = new TreeMap<String, List<String>>(String.CASE_INSENSITIVE_ORDER);
            }
            headers.put("Content-Type", Collections.singletonList("text/plain"));
            msg.put(Message.PROTOCOL_HEADERS, headers);
            
            /*
             * В CXF невозможно изменить статус через msg.put(Message.RESPONSE_CODE, status), 
             * поэтому меняем статус ответа
             */
            ResponseBuilder b = Response.fromResponse(resp);
            b.status(status);
//            b.type(MediaType.APPLICATION_JSON);
//            b.header("Content-Type", "text/plain");
            
            return b.build();
        }

        return resp;
    }
}

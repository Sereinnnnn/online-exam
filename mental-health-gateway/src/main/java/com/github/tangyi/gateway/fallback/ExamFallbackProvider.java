package com.github.tangyi.gateway.fallback;

import com.github.tangyi.common.constants.ServiceNameConstant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.netflix.zuul.filters.route.FallbackProvider;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Component;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

/**
 * 考试服务异常回调
 *
 * @author tangyi
 * @date 2019-01-04 15:34
 */
@Component
public class ExamFallbackProvider implements FallbackProvider {

    private static final Logger logger = LoggerFactory.getLogger(ExamFallbackProvider.class);

    private static final String EXAM_SERVICE_DISABLE = "考试服务不可用";

    @Override
    public ClientHttpResponse fallbackResponse(Throwable cause) {
        return new ClientHttpResponse() {
            @Override
            public HttpStatus getStatusCode() {
                return HttpStatus.SERVICE_UNAVAILABLE;
            }

            @Override
            public int getRawStatusCode() {
                return HttpStatus.SERVICE_UNAVAILABLE.value();
            }

            @Override
            public String getStatusText() {
                return HttpStatus.SERVICE_UNAVAILABLE.getReasonPhrase();
            }

            @Override
            public void close() {
            }

            @Override
            public InputStream getBody() {
                if (cause != null && cause.getMessage() != null) {
                    logger.error("调用:{} 异常：{}", getRoute(), cause.getMessage());
                    return new ByteArrayInputStream(cause.getMessage().getBytes());
                } else {
                    logger.error("调用:{} 异常：{}", getRoute(), EXAM_SERVICE_DISABLE);
                    return new ByteArrayInputStream(EXAM_SERVICE_DISABLE.getBytes());
                }
            }

            @Override
            public HttpHeaders getHeaders() {
                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_JSON);
                return headers;
            }
        };
    }

    @Override
    public String getRoute() {
        return ServiceNameConstant.EXAM_SERVICE;
    }

    @Override
    public ClientHttpResponse fallbackResponse() {
        return fallbackResponse(null);
    }
}

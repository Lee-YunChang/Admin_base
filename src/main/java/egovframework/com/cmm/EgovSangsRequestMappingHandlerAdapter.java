package egovframework.com.cmm;

import java.util.ArrayList;
import java.util.List;
import org.springframework.web.method.annotation.MapMethodProcessor;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;

public class EgovSangsRequestMappingHandlerAdapter extends RequestMappingHandlerAdapter {

    public void afterPropertiesSet() {
        super.afterPropertiesSet();

        if (getArgumentResolvers() != null) {
            List resolvers = new ArrayList(getArgumentResolvers());

            int mapMethodProcessorInx = -1;
            int commandMapInx = -1;
            HandlerMethodArgumentResolver dataMapResolver = null;
            System.out.println("----resolvers.size():"+resolvers.size());
            for (int inx = 0; inx < resolvers.size(); ++inx) {
                HandlerMethodArgumentResolver resolver = (HandlerMethodArgumentResolver)resolvers.get(inx);
                if (resolver instanceof MapMethodProcessor) mapMethodProcessorInx = inx;
                else if (resolver instanceof DataMapArgumentResoler) {
                    commandMapInx = inx;
                }
            }
            System.out.println("----commandMapInx:"+commandMapInx);
            if (commandMapInx != -1) {
                dataMapResolver = (HandlerMethodArgumentResolver)resolvers.remove(commandMapInx);
                resolvers.add(mapMethodProcessorInx, dataMapResolver);
                setArgumentResolvers(resolvers);
            }
        }
    }
}

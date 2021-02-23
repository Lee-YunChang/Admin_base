package egovframework.com.cmm;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

import com.sangs.support.DataMap;


/**
 * Description : EgovBindingInitializer
 * 
 * Modification Information
 * 수정일		수정자			수정내용
 * -------	-----------------------------------
 * 2014.04.01  sangs			수정
 *
 */

public class EgovBindingInitializer implements WebBindingInitializer {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    public void initBinder(WebDataBinder binder, WebRequest request) {
    	
    	
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(false));

    }

}

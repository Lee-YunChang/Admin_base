package com.sangs.support;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;
/**
 * ImagePaginationRenderer.java 클래스
 * 
 * @author 서준식
 * @since 2011. 9. 16.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2014.08.25  wibo		       이미지 경로에 ContextPath추가
 * </pre>
 */
public class ImagePaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{
 
 
	public void initVariables(){
		firstPageLabel    = "<a href=\"?pageIndex={1}\"  class=\"arrow\" onclick=\"{0}({1});return false; \">&lt;&lt;</a>\n";
        previousPageLabel = "<a href=\"?pageIndex={1}\"  class=\"arrow\" onclick=\"{0}({1});return false; \">&lt;</a>\n";
        currentPageLabel  = "<a href=\"#\" class=\"on\">{0}</a>\n";
        otherPageLabel    = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a>\n";
        nextPageLabel     = "<a href=\"?pageIndex={1}\" class=\"arrow\" onclick=\"{0}({1});return false; \">&gt;</a>\n";
        lastPageLabel     = "<a href=\"?pageIndex={1}\" class=\"arrow\" onclick=\"{0}({1});return false; \">&gt;&gt;</a>\n";
	}

	public void setServletContext(ServletContext servletContext) {
		//this.servletContext = servletContext;
		initVariables();
	}

}

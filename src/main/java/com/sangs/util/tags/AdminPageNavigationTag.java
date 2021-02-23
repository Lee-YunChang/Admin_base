package com.sangs.util.tags;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class AdminPageNavigationTag extends TagSupport {
	
	private Logger  log = LogManager.getLogger(AdminPageNavigationTag.class);
	private static final long serialVersionUID = -8033235528371094919L;
	
	private int cpage;
	private int total;
	private int pageSize;
	private String link;

	public int doStartTag() {
		return EVAL_BODY_INCLUDE;
	}

	public int doEndTag() { 
		
		

		if(cpage < 1)cpage = 1; //초기값
		
		int totalPage = (total-1)/pageSize + 1;				//전체페이지
		int prev10 = (int)Math.floor((cpage-1) / 10.0) * 10;	//이전10개, 다음10개//    이전 마지막 페이지 0 이면 이전10개 없음
		int next10 = prev10 + 11;							//다음 첫페이지 totalPage 보다 크면 다음10개 없음
		
		StringBuffer sbuf = new StringBuffer();
		
		sbuf.append("<div class='paging'>");
		
		if(prev10 > 0) {
			//처음 목록
			sbuf.append("<a href=\"").append(link).append("(").append(1).append(");").append("\"><img src='/admin/images/paging_arrow_first_on.png' alt='처음목록' /></a>");
			sbuf.append("<a href=\"").append(link).append("(").append(prev10).append(");").append("\"><img src='/admin/images/paging_arrow_prev_on.png' alt='이전10개' ></a>");
		}else{
			
			//처음 목록
			sbuf.append("<a><img src='/admin/images/paging_arrow_first_off.png' alt='처음목록' /></a>");
			sbuf.append("<a><img src='/admin/images/paging_arrow_prev_off.png' alt='이전10개' /></a>");
		}//이전10개
		 		
		for (int i=1+prev10; i<next10 && i<=totalPage; i++ ) {
			if (i==cpage) {
				sbuf.append("<a class='num' ><strong>").append(i).append("</strong></a>");
				if (i != totalPage) sbuf.append("");
			} else {
				sbuf.append(" <a href=\"").append(link).append("(").append(i).append(");\" ").append(">").append(i).append("</a>");
				if (i != totalPage) sbuf.append("");
			}
		}
		
	
		
		
		
		if(totalPage >= next10) {
			sbuf.append("<a href=\"").append(link).append("(").append(next10).append(");").append("\"><img src='/admin/images/paging_arrow_next_on.png' alt='다음10개' /></a>");
			
			//마지막 목록
			sbuf.append("<a href=\"").append(link).append("(").append(totalPage).append(");").append("\"><img src='/admin/images/paging_arrow_last_on.png' alt='마지막목록' /></a>");
			
		}else{
			sbuf.append("<a><img src='/admin/images/paging_arrow_next_off.png' alt='다음10개' /></a>");
			
			
			//마지막 목록
			sbuf.append("<a><img src='/admin/images/paging_arrow_last_off.png' alt='마지막목록' /></a>");
		} // end if 다음10개
		
		
		
		
		
		
		sbuf.append("</div>");

		JspWriter out = pageContext.getOut();
		
		try {
			out.print(sbuf.toString());
		} catch (IOException e) {
		}
		return EVAL_PAGE;
	}

	public void setCpage(int cpage) {
		this.cpage = cpage;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setLink(String link) {
		this.link = link;
	}

}

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<!-- 본문 > 상단 > 타이틀 -->
<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
<c:set var="titleMode"></c:set>
<c:set var="contentsRootPath"><%=SangsProperties.getProperty("Globals.ContentsRootPath") %>/${REQUEST_DATA.courseno}</c:set>
<c:set var="filePath"><%=SangsProperties.getProperty("Globals.ContentsRootUri") %>/${REQUEST_DATA.courseno}</c:set>
<c:set var="treeFilePath"></c:set>
<c:if test="${map.FILE_PATH ne null}">
	<c:set var="filePath">${map.FILE_PATH}</c:set>
	<c:set var="treeFilePath">${map.TREE_FILE_PATH}</c:set>	
</c:if>
<c:choose>
	<c:when test="${pageMode == REQUEST_DATA.pageMode}"><c:set var="titleMode" value="등록"/></c:when>
	<c:otherwise><c:set var="titleMode" value="수정"/></c:otherwise>
</c:choose>
<script type="text/javascript" src="/admin/common/js/cate.js"></script>
<script type="text/javascript" src="/admin/common/js/underscore/underscore-min.js"></script>


<script type="text/javascript">
// disabled="disabled"
$(function () {
  _.templateSettings.interpolate = /\{\{=([^-][\S\s]+?)\}\}/g;
  _.templateSettings.evaluate = /\{\{([^-=][\S\s]+?)\}\}/g;
  _.templateSettings.escape = /\{\{-([^=][\S\s]+?)\}\}/g;
});

</script>

<style>
table table td {height:20px;}
table table td.ttl {padding-left:3px;}
table table td.cttl {font-weight: bold;}
table table td.chk {text-align:center;}
.treeHolder {width:100%; height:500px; overflow:auto; border:1px solid black;}
</style>

<script type="text/template" id="course-template">
<tr>
	<td class="ttl cttl">{{=COURSETITLE}}</td>
	<td class="chk"><input type="checkbox" class="parent" value="0" onclick="chkParent(this)" coursetitle="{{=COURSETITLE}}"/></td>
</tr>
</script>

<script type="text/template" id="tree-template">
<tr>
	<td class="ttl">&nbsp;ㄴ({{=item.SDAY}}차시){{=item.SUBJECT}}</td>
	<td class="chk"><input type="checkbox" class="child" coursetitle="{{=item.COURSETITLE}}" courseno="{{=item.COURSENO}}" treeno="{{=item.TREENO}}" sday="{{=item.SDAY}}" value="{{=item.SUBJECT}}"/></td>
</tr>
</script>

<script type="text/javascript">
var tree = [];

function chkParent(obj) {
	if ($(obj).prop('checked') == true) {
		$('#leftCourse input.child[coursetitle="'+$(obj).attr('coursetitle')+'"]').prop('checked', true);
	} else {
		$('#leftCourse input.child[coursetitle="'+$(obj).attr('coursetitle')+'"]').prop('checked', false);
	}
}

function getCourseTree() {
	var keyword = $('#keyword').val();
	if (keyword) {
		
		$.ajax({
			url:"/admin/course/courseTreeSubject.do"
			,type:"post"
			,dataType:"json"
			,data:{keyword:keyword}
			,success:function(res){
				
				tree = res;
				
				if (res && res.length) {
					
					var course = _.uniq(_.pluck(res, 'COURSETITLE'));
					$('#leftCourse').empty();
					var course_template = $('#course-template').html();
					var tree_template = $('#tree-template').html();
					
					var tplArr = [];
					for (var i=0; i<course.length; i++) {
						
						tplArr.push(_.template(course_template)({COURSETITLE:course[i]}));
						
						for (var j=0; j<res.length; j++) {
							if (course[i] == res[j].COURSETITLE) {
								
								
								tplArr.push(_.template(tree_template)({item:res[j]}));
							}
						}
						
					}
					
					$('#leftCourse').append(tplArr.join(''));
					
				} else {
					alert('조회결과가 없습니다.');
				} 
				
				console.dir(res);
			}
		});
		
	}
}

function toRight() {
	
	var tplArr = [];
	var tree_template = $('#tree-template').html();
	$('#leftCourse input.child:checked').each(function(){
		var where = {COURSENO:parseInt($(this).attr('courseno'),10),TREENO:parseInt($(this).attr('treeno'),10)};
		var tmp = _.findWhere(tree, where );
		console.dir(tmp);
		if (tmp) {
			tmp.checked = 'Y';
			$(this).prop('checked', false);
			$(this).closest('tr').hide();
			tplArr.push(_.template(tree_template)({item:tmp}));
		}
		
	});
	
	if (tplArr.length > 0) {
		$('#leftCourse input.parent:checked').prop('checked', false);
		$('#rightCourse').append(tplArr.join(''));	
	}
}

function toLeft() {
	$('#rightCourse input.child:checked').each(function(){
		var where = {COURSENO:parseInt($(this).attr('courseno'),10),TREENO:parseInt($(this).attr('treeno'),10)};
		var tmp = _.findWhere(tree, where );
		console.dir(tmp);
		if (tmp) {
			tmp.checked = 'N';
			$(this).closest('tr').remove();
			
			var obj = $('#leftCourse input.child[courseno='+where.COURSENO+'][treeno='+where.TREENO+']');
			obj.closest('tr').show();
			
		} else {
			// todo 이미 등록되어있는 차시 삭제(확인 후 서버전송 화면 reflesh);
		}
	});
}

function writeFormCheck() {
	var chkTree = _.where(tree, {checked:'Y'});
	if (chkTree && chkTree.length > 0) {
		if (confirm('추가된 차시구성을 저장하시겠습니까?')) {
			
			var treenos = [];
			var courseno = <c:out value="${courseInfo.COURSENO}" default="0"/> 
			for (var i=0; i<chkTree.length; i++) {
				treenos.push(chkTree[i].TREENO);
			}
			
			$.ajax({
				url:"/admin/course/constTree.do"
				,type:"post"
				,dataType:"json"
				,data:{courseno:courseno,newTree:treenos.join(',')}
				,success:function(res) {
					console.log(res);
					opener.parentReload();
					window.close();
				}
			});
			
		}
	} else {
		alert('추가된 차시 구성이 없습니다.');
	}
}

function enterChk(){
	if (event.keyCode==13) getCourseTree();
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">콘텐츠관리 > 과정명<span> 차시업로드</span></div>

<!-- <div class="space"></div> -->
<div class="tb_title">차시구성하기</div>
<div><span><font class="extext"> ※ 선택한 차시의 페이지수, 학습시간, 콘텐츠 파일을 복사합니다.</font></span></div>
<div><span><font class="extext"> ※ 구성한 차시는 위에서부터 1차시로 순서대로 구성됩니다.</font></span></div>

<div class="space"></div>

<table style="width:100%">
	<colgroup>
		<col width="46%"> 
		<col width="8%">
		<col width="46%">
	</colgroup>
	<tbody>
		<tr>
			<td colspan="2" style="padding-bottom:10px;">
				<input type="text" id="keyword" class="line" style="width:65%" onkeypress="enterChk();" placeholder="과정명을 검색해 주세요."/>&nbsp;
				<a href="#" onclick="getCourseTree()" class="btn search brown">검색</a>
				
			</td>
			
		</tr>
		<tr>
			<td>
				<div class="treeHolder">
					<table style="width:100%">
						<colgroup>
							<col width="90%"> 
							<col width="10%">
						</colgroup>
						<tbody id="leftCourse">
							
						</tbody>
					</table>
				</div>
			</td>
			<td style="text-align:center">
				<div><button onclick="toRight()">▶</button></div><br/>
				<div><button onclick="toLeft()">◀</button></div>
			</td>
			<td>
				<div class="treeHolder">
					<table style="width:100%">
						<colgroup>
							<col width="90%"> 
							<col width="10%">
						</colgroup>
						<tbody id="rightCourse">
							<c:if test="${fn:length(treeList) < 1}">
								<tr>
									<td class="ttl cttl">${courseInfo.COURSETITLE}</td>
									<td class="chk"><input type="checkbox" class="parent" value="0" disabled="disabled" /></td>
								</tr>
							</c:if>	
							<c:forEach var="item" items="${treeList}" varStatus="status">
							
							<c:if test="${status.index == 0}">
								<tr>
									<td class="ttl cttl">${item.COURSETITLE}</td>
									<td class="chk"><input type="checkbox" class="parent" value="0" disabled="disabled" /></td>
								</tr>
							</c:if>
							
							<tr>
								<td class="ttl">&nbsp;ㄴ(${item.SDAY}차시)${item.SUBJECT}</td>
								<td class="chk"><input type="checkbox" class="child" courseno="${item.COURSENO}" treeno="${item.TREENO}" sday="${item.SDAY}" value="${item.SUBJECT}" disabled="disabled" /></td>
							</tr>
							
							</c:forEach>
						</tbody>
					</table>
				</div>
			</td>
		</tr>
	</tbody>
</table>

<br/><br/>

<div class="button" align="center">
	<a href="#" onclick="writeFormCheck();" class= "btn big blue">등록</a>
	<a href="#" onclick="window.close();" class="btn big gray">취소</a> 
</div>

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>
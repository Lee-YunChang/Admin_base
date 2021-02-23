/******************************* 교육과정관련 *****************************/

//콘텐츠관리 > (팝업)콘텐츠 등록(수정)
function CourseFormWin(courseno) {
	var courseformwin = window.open("../course/coursemake.do?subcmd=info_form&courseno="+courseno, "courseformwin" ,"width=900, height=700,scrollbars=1");
	courseformwin.focus();
}


//모의학습
function StudyPopup(courseno, cseqno, cuserno) {
	studymode = "test";
	objcode = "01";
	frameseq = 1;
	var studypopwin = window.open("/academy/studysys/study_win.jsp?studymode="+studymode+"&courseno="+courseno+"&cseqno="+cseqno+"&cuserno="+cuserno+"&objcode="+objcode+"&frameseq="+frameseq+"&progid=0001&complete=0", "studywin", "width=1024,height=768,scrollbars=1,top=0,left=0");
	studypopwin.focus(); 
} 


//로그프로그램실행
function logwin(){
	var logwin = window.open("/admin/common/logtail/logtail.jsp","logwin","width=800,height=600,scrollbars=0");
	logwin.focus();
}


/******************************* 우편번호 찾기 관련 *****************************/

var postcode_part = "home";
function searchPostcode(part){
	this.postcode_part = part;
	var postcode_win = window.open("../common/etc.do?subcmd=postcode","postcode_win", "width=400,height=300,scrollbars=1");
	postcode_win.focus();
}

function searchCompany(){
	var company_win = window.open("../user/company.do?subcmd=search","company_win", "width=500,height=400,scrollbars=1");
	company_win.focus();
}

function idDoubleCheck(){
	var idcheck_win = window.open("../user/user.do?subcmd=idcheck","idcheck_win", "width=400,height=300,scrollbars=0");
	idcheck_win.focus();
}


function fillPostcode(z1, z2, addr, areacode, areaname){
	var frm = document.writeform;
	if(postcode_part == "home"){
		frm.postcode01.value = z1;
		frm.postcode02.value = z2;
		frm.addr1.value = addr;
		frm.areacode.value = areacode;
		frm.areaname.value = areaname;
		frm.addr2.focus();
	} else if(postcode_part == "company"){
		frm.compostcode01.value = z1;
		frm.compostcode02.value = z2;
		frm.comaddr.value = addr;
		frm.comareacode.value = areacode;
		frm.comareaname.value = areaname;
	} else {
		frm.postcode01.value = z1;
		frm.postcode02.value = z2;
		frm.addr.value = addr;
		frm.areacode.value = areacode;
		frm.areaname.value = areaname;
	}
}

function fillCompany(comno, comname, z1, z2, addr, areacode, areaname){
	//alert(areaname);
	var frm = document.writeform;
	frm.comno.value = comno;
	frm.comname.value = comname;
	frm.compostcode01.value = z1;
	frm.compostcode02.value = z2;
	frm.comaddr.value = addr;
	frm.comareacode.value = areacode;
	frm.comareaname.value = areaname;
}


function fillUserid(userid){
	var frm = document.writeform;
	frm.userid.value = userid;
}


function smsform(frm){
	var smspop = window.open("","smsform","width=400,height=500"); 
	frm.method = "post"; 
	frm.target = "smsform"; 
	frm.action = "/admin/common/smsForm.do"; 
	frm.submit(); 
	smspop.focus();
}


function MsgUserAllCheck(){
	 
	 $("input[type='checkbox']").attr('checked', $('#isall').is(':checked'));
}

 

// SMS발송 - 개별
function smsFormPersonal(user){

	var smspop = window.open("","smsform","width=450,height=500"); 

	// Form객체를 만들고 속성값들을 추가함
	var smsForm = document.createElement("<form name=smsform></form>");
	smsForm.method = "post";
	smsForm.action = "../common/sms.do?subcmd=form";

	// TextBox를 생성함
	var oInputHidden = document.createElement("<input text=text name=msg_user>");
	oInputHidden.value = user;

	// Form안에 TextBox를 넣음
	smsForm.appendChild(oInputHidden);

	// Body안에 Form을 넣음
	document.body.appendChild(smsForm);

	// 해당 Form을 Submit함
	smsForm.target = "smsform"; 
	smsForm.submit();
	smspop.focus();
}


// SMS발송 - 일괄
// 2016.03.28 수정
function smsFormGroup(form){
	var smspop = window.open("","smsform","width=520,height=650"); 

	form.method = "post";
	form.action = "/admin/common/smsForm.do";
	form.target = "smsform"; 
	form.submit();
	smspop.focus();
}

// 메일발송 - 일괄
// 2016.03.28 수정
function mailFormGroup(form){
	var specs = "left=10,top=10,width=980,height=800";
	specs += ",menubar=yes,location=yes,resizable=yes,scrollbars=yes,status=yes";
		  
	var mailpop = window.open("","mailform",specs); 
	form.method = "post";
	form.action = "/admin/common/mailForm.do";
	form.target = "mailform"; 
	form.submit();
	mailpop.focus();
}
// 메일발송 - 개별
function mailFormPersonal(user){

	var mailpop = window.open("","mailform","width=700,height=700"); 

	// Form객체를 만들고 속성값들을 추가함
	var mailForm = document.createElement("<form name=mailform></form>");
	mailForm.method = "post";
	mailForm.action = "/admin/common/mailForm.do";

	// TextBox를 생성함
	var oInputHidden = document.createElement("<input text=text name=msg_user>");
	oInputHidden.value = user;

	// Form안에 TextBox를 넣음 
	mailForm.appendChild(oInputHidden);

	// Body안에 Form을 넣음
	document.body.appendChild(mailForm);

	// 해당 Form을 Submit함
	mailForm.target = "mailform"; 
	mailForm.submit();
	mailpop.focus();
}


function popup(src,width,height)
{
	window.open(src,'','width='+width+',height='+height+',scrollbars=1');
}

function popup2(src,width,height,scrollbars)
{
	if ( scrollbars=='' ) scrollbars=1;
	window.open(src,'','width='+width+',height='+height+',scrollbars='+scrollbars);
}

function popup3(src,width,height,scrollbars,resize)
{
	if ( scrollbars=='' ) scrollbars=1;
	if ( resize=='' ) resize=1;
	window.open(src,'','width='+width+',height='+height+',scrollbars='+scrollbars+',resizable='+resize);
}

function popup4(src,width,height,scrollbars,resize)
{
	if ( scrollbars=='' ) scrollbars=1;
	if ( resize=='' ) resize=1;
	var left = Math.ceil((window.screen.width - width)/2);
	var top = Math.ceil((window.screen.height - height)/2);
	window.open(src,'','width='+width+',height='+height+',scrollbars='+scrollbars+',resizable='+resize+',top='+top+',left='+left);
}



// 테이블 라인 마우스 오버시 표시
function onFocusBgCh(obj) {
	 $('.onFocusBgCh').attr("bgcolor","");
	// $(obj).attr("bgcolor","#efefef"); // 회색 
	 $(obj).attr("bgcolor","#ffff95");	// 노랑
	// $(obj).attr("bgcolor","#dbeef3");	// 파랑
	}


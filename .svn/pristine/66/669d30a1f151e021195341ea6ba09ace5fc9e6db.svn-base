

var action_global = ""; //action의 전역변수



function calender(rthis,field)
{
	var localTime = new Date();
	var year = localTime.getYear();
	var month= localTime.getMonth()+1
	
	var nameaction=rthis+"."+field+".value=('{year}-{month}-{day}');onoff_Gcal();";
	cal(year,month,1,nameaction);
	onoff_Gcal();
	return;	
	
}

function cal(year, month, day, action){


	var i, j, day_num=1;
	var last_week, month_link="";
	var calDate = new Date(year, month-1, day_num);
	var checkDate = new Date();
	var date_array = new Array(6);

	for(i=0;i<6;i++) date_array[i] = new Array("","","","","","","");

	//스크립트 추출 및 변환, 내용이 없으면 마지막 action 사용
	if(action == ""){
		script = action_global;
	}else{
		var script = action;
		var action_mode = action.substring(0,3);
		if(action_mode.toLowerCase()=="url") 
			script = "document.location.href='"+action.substring(4,action.length)+"'";
		action_global = script;
	}

	for(j=0;j<6;j++){
		for(i=0;i<7;i++){
			if(j==0 && i==0)
				i = calDate.getDay();
			date_array[j][i]=day_num+"";
			day_num++;

			//해당 날짜값에 대한 유효성 검사
			checkDate.setFullYear(year, month-1, day_num);
			if(checkDate.getDate() != day_num) break;
		}
		if(checkDate.getDate() != day_num) break;
	}
	last_week = (date_array[5][0])?6:5;

	outStr = "<table bgcolor=#D8E7EB width=160 height=160 border=0 cellpadding=0 cellspacing=0 style='border:1 solid;color:#AEB9C4'><tr><td>\n";
	outStr += "<table width=100% height=100% border=0 cellpadding=0 cellspacing=1 style='border:1 solid;color:#AEB9C4'>\n";
	outStr += "<col width=20 align=center></col><col width=20 align=center></col><col width=20 align=center></col><col width=20 align=center></col><col width=20 align=center></col><col width=20 align=center></col><col width=20 align=center></col>\n";
	outStr += "<tr><td class=calendar style='color:red'>S<td class=calendar>M<td class=calendar>T<td class=calendar>W<td class=calendar>T<td class=calendar>F<td class=calendar style='color:blue'>S</tr>\n";

	for(j=0;j<last_week;j++){
		outStr += "<tr>";
		for(i=0;i<7;i++){
			//스크립트 자료변환
			if(date_array[j][i]!=""){
				/*
				action_script = script.replace("{year}", year);
				action_script = action_script.replace("{month}", allot(month));
				action_script = action_script.replace("{day}", allot(date_array[j][i].toString()));
				*/
				action_script = script.replace("{year}", year);
				var month2 = month;
				if(month2 < 10){
					month2 = '0' + month2;
				}
				action_script = action_script.replace("{month}", month2);
				if(date_array[j][i].toString() < 10){
					date_array[j][i] = '0' + date_array[j][i].toString();
				}
				action_script = action_script.replace("{day}", date_array[j][i].toString());

			}
			else 
				action_script = "";

			//날짜별로 스크립트 출력
			if(i==0){ 
				outStr += "<td class=calendar style='color:red;cursor:hand' onMouseover=this.style.backgroundColor='#FFEEEE' onMouseout=this.style.backgroundColor='' onClick=\""+action_script+"\">"+date_array[j][i]+"</td>"; continue; 
			}
			if(i==6){ 
				outStr += "<td class=calendar style='color:blue;cursor:hand' onMouseover=this.style.backgroundColor='#EEEEFF' onMouseout=this.style.backgroundColor='' onClick=\""+action_script+"\">"+date_array[j][i]+"</td>"; continue; 
			}
			outStr += "<td class=calendar style='cursor:hand' onMouseover=this.style.backgroundColor='#EEEEEE' onMouseout=this.style.backgroundColor='' onClick=\""+action_script+"\">"+date_array[j][i]+"</td>";
		}
		outStr += "</tr>\n";
	}
	
	outStr += "</table></td></tr></table>";

	//이전 다음달 링크 
	month_link = (month > 1)? "<a onClick=\"cal("+year+","+(month-1)+","+day+",'')\" style='text-decoration:none; color:#5BA4b5; cursor:hand'>◁</a> <font color=black>"+month:"<a onClick=\"cal("+(year-1)+",12,"+day+",'')\" style='text-decoration:none; color:#909090; cursor:hand'>◁</a> <font color=black>"+month;
	month_link += (month < 12)? "</font> <a onClick=\"cal("+year+","+(month+1)+","+day+",'')\" style='text-decoration:none; color:#909090; cursor:hand'>▷</a>":"</font> <a onClick=\"cal("+(year+1)+",1,"+day+",'')\" style='text-decoration:none; color:#909090; cursor:hand'>▷</a>";


	//HTML 대입
	document.all.G_cal_body.innerHTML =  outStr;
	document.all.G_cal_year.innerHTML = "<a onClick=\"cal("+(year-1)+","+month+","+day+",'')\" style='text-decoration:none; color:#909090; cursor:hand'>◁</a> <font color=black>"+year+"</font> <a onClick=\"cal("+(year+1)+","+month+","+day+",'')\" style='text-decoration:none; color:#909090; cursor:hand'>▷</a>";
	document.all.G_cal_month.innerHTML = month_link + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:off_Gcall();'><b><font color=red>x</font></b></a>";

		
}

function off_Gcall(){
	document.all.G_cal.style.visibility = (document.all.G_cal.style.visibility=="hidden")?"":"hidden";
}

function onoff_Gcal(){
	document.all.G_cal.style.top = event.clientY+5;
	document.all.G_cal.style.left = event.clientX+5;

	document.all.G_cal.style.visibility = (document.all.G_cal.style.visibility=="hidden")?"":"hidden";
}

document.writeln("<style>td.calendar{font-size:7pt; font-family:tahoma;color:black; background-color:white}</style>");
document.writeln(""+"<div id=G_cal style='width=160;position:absolute;visibility:hidden'>"
+"<table bgcolor=#D8E7EB width=160 height=25 border=0 cellpadding=3 cellspacing=0 style='border:1 solid black'>"
+" <tr><td align=center style='font-size:8pt; font-family:tahoma'>"
+" <span id=G_cal_year></span>&nbsp;&nbsp;<span id=G_cal_month></span>"
+" </td></tr>"
+"</table>"
+"<div id=G_cal_body style='width:160'>"
+"</div></div>");


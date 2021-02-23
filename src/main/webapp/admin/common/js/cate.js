function Category(cateno, catename, seq, status, pcateno){
	this.cateno = cateno;
	this.catename = catename;
	this.seq = seq;
	this.status = status;
	this.pcateno = pcateno;
	this.subList = new Array;
	this.subCnt = 0;
	this.subCategory = subCategory;
}

function createCategory(cateno, catename, seq, status, pcateno){
	category = new Category(cateno, catename, seq, status, pcateno);
	return category;
}

function insSub(rootCategory, subCategory) { 
  return rootCategory.subCategory(subCategory); 
} 

function subCategory(subNode) { 
  this.subList[this.subCnt] = subNode;
  this.subCnt++;
  return subNode;
}

//////////////////////////////////////////////////////////////////////////

//cateno에 해당하는 obj반환
function findRootCategory(baseObj, cateno){
	for(i=0; i<baseObj.subList.length; i++){
		obj = baseObj.subList[i];
		if(obj.cateno == cateno) {
			return obj;
		}
	}	
}

//최상위 카테고리 조회
function findRootCategoryList(baseObj, selectForm, cateno, mode){
	
	if (mode == "search")		tempstr = "--전체--";
	else tempstr = "--대분류선택--";
	
	selectForm.options[0] = new Option(tempstr, "0");	//////////
	for(i=0; i<baseObj.subList.length; i++){
		obj = baseObj.subList[i];
		selectForm.options[i+1] = new Option(obj.catename, obj.cateno);
		if (obj.cateno == cateno){
			selectForm.options[i+1].selected = true;
		}
	}

	if(cateno == 0){
		selectForm.options[0].selected = true;
		selectForm.value = "0";
	}

}

//서브 카테고리 조회
function findSubCategoryList(baseObj, pcateno, selectForm, cateno, mode){
	
	//alert("adsf");
	for(i=0; i<selectForm.length; i++){
		selectForm.options[i]=null;
	}
	selectForm.options[selectForm.length]=null;

	if (mode == "search")		tempstr = "--전체--";
	else tempstr = "--소분류선택--";
	
	selectForm.options[0] = new Option(tempstr, "0");	//////////
	if(pcateno > 0){
		rootObj = findRootCategory(baseObj, pcateno);
		for(i=0; i<rootObj.subList.length; i++){
			obj = rootObj.subList[i];
			selectForm.options[i+1] = new Option(obj.catename, obj.cateno);	
			if (obj.cateno == cateno){ 
				selectForm.options[i+1].selected = true;
			}
		}
		
		if (cateno == 0){
			selectForm.options[0].selected = true;
			selectForm.value = "0";
		}
	} else {
		selectForm.options[0] = new Option(tempstr, "0");	//////////
		selectForm.options[0].selected = true;
		selectForm.value = "0";
	}

	return selectForm;

}

package com.sangs.util;
import com.ckeditor.CKEditorConfig;

public class CKEditorUtil {
	
	
	/**
	 * CKEditor Settings 
	 * @return
	 */
	public static CKEditorConfig getCKEditorConfig(String photoUploadPath) {
		CKEditorConfig settings = new CKEditorConfig();
		settings.addConfigValue("toolbar"
				,"["
				/*+ "{ name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },"*/
				+ "{ name: 'document', items : [ 'Source','-','DocProps','Preview','Print',] },"
				+ "{ name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },"
				+ "{ name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },"
				+ "{ name: 'forms', items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },"
				+ "{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },"
				+ "{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },"
				+ "{ name: 'links', items : [ 'Link','Unlink','Anchor' ] },"
				+ "{ name: 'insert', items : [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe' ] },"
				+ "{ name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },"
				+ "{ name: 'colors',      items : [ 'TextColor','BGColor' ] },"
				+ "{ name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }"
				+ "]");
		settings.addConfigValue("filebrowserImageUploadUrl", "/common/ckeditorFileUploader.jsp?photoUploadPath="+photoUploadPath); 
		return settings;
	}

}

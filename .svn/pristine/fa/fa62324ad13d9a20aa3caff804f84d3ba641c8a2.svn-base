package com.sangs.util;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.regex.Pattern;
//import com.edailyedu.edu.common.config.Constants;
//import com.edailyedu.edu.common.db.DBManager;
//import com.edailyedu.edu.pms.common.dao.CommonDAO;

/**
 * 
 * <pre> 
 *  서브시스템 : 공통유틸
 *       설명 : 파일 관련된 Util 
 *   최초 작성 : LYM (2009. 03. 25) 
 *   변경 작성 :  
 * </pre>
 */
public class FileUtil {

    private static final Pattern dosSeperator = Pattern.compile("\\\\");
    private static final Pattern lastSeperator = Pattern.compile("/$");

    /**
     * 패스정보를 제외한 파일명을 리턴한다.
     * @return 패스정보를 삭제한 파일명
     */
    public static String getFileNameChop(String s) {
        if(s == null)
            return null;
        s = dosSeperator.matcher(s).replaceAll("/");
        int i = s.lastIndexOf("/");
        if(i > -1)
            return s.substring(i + 1);
        else
            return s;
    }

    /**
     * 주어진 파일의 path의 마지막에 /가 있는지 검사하고 없는 경우 /를 추가하여 리턴한다.
     * @return /를 붙인 full path
     */
    public static String getCompleteLeadingSeperator(String s) {
        if(s == null)
            return null;
        s = dosSeperator.matcher(s).replaceAll("/");
        if(!s.endsWith(File.separator))
            s = s + "/";
        return s;
    }

    /**
     * 파일명 중복시 파일명[index].확장자 형태로 파일명을 변경해서 리턴한다.
     * @return 변경된 파일명
     */
    public static File getConvertFile(File file) {
        if(!file.exists()) {
            return file;
        }

        String s = file.getName();
        int i = s.lastIndexOf('.');
        String s1 = i != -1 ? s.substring(i) : "";
        String s2 = i != -1 ? s.substring(0, i) : s;

        int j = 0;
        do {
            
            file = new File(getCompleteLeadingSeperator(file.getParent()) + s2 + "[" + j + "]" + s1);
           
        	
            j++;
        } while(file.exists());

        return file;
    }
    
    
    /**
     * 저장 디렉토리에 특정 파일 삭제.
     * @param path
     * @param delFileName
     * @return
     */
    public static boolean deleteFile(String path, String delFileName) throws Exception{

    	boolean returnValue = false;

		File fileDir = new File(path); //저장 디렉토리.
		if(fileDir.exists() && fileDir.isDirectory()){
			File[] datafile= fileDir.listFiles();
			for(int n=0;n<datafile.length;n++){
				if (datafile[n].getName().equals(delFileName)){
					datafile[n].delete();
					break;
				}
			}
			returnValue = true;
		}else{
			returnValue = true;
		}

    	return returnValue;
    }

    
    /**
     * 실제 저장된 파일 삭제.
     * 
     * @param fileInfo : 파일의 경로 + 이름까지 함께 넘겨와야 한다. (MT_UPLOAD_FILE.FILE_PATH)
     * @throws Exception
     */
    public static void deleteFile(String fileInfo) throws Exception {

    	if(fileInfo == null || fileInfo.equals(""))
    		return;
    	
    	File delFile = new File(fileInfo);

    	if(delFile.exists() && delFile.isFile())
    		delFile.delete();
    	
    }
    
    /**
     * DB 및 실제 파일을 삭제 한다.
     * @param fileGroupNo
     * @throws Exception
     */
    public static void commonDeleteGroupfile(int fileGroupNo) throws Exception {

    	
    	Connection con = null;
    	
    	try{
    		/*
	    	//Connection
	    	con = DBManager.getConnection();
	        con.setAutoCommit(false);
	        CommonDAO dao = new CommonDAO(con);
	        
	        //파일정보
	        DataMap fileMap = dao.getListUploadFile(fileGroupNo);
	        if(fileMap == null) return;
	        fileMap.setNullToInitialize(true);
	        
			if(fileMap.keySize("fileGroupNo") > 0){
				
				//DB의 기존 파일의 모든 정보
				for(int i=0; i < fileMap.keySize("fileGroupNo"); i++){
					//파일 삭제.
					deleteFile(fileMap.getString("filePath", i));
				}
				
				//기존 groupFile 삭제.
				dao.deleteUploadFileGroupNo(fileGroupNo);  
			}
			
			con.commit();
			*/
        } catch (Exception e) {
        	if(con != null) con.rollback();
            throw new Exception(e);
        } finally {
            if (con != null) {
                try {
                	con.setAutoCommit(true);
                    con.close();
                } catch (SQLException e1) {
                }
            }
        }
    }
    
}


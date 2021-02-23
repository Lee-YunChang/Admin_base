package com.sangs.support;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sangs.util.FileUtil;
import com.sangs.util.StringUtil;

/**
 * @제목 FileUploadUtil
 * @설명 실제 파일업로드 수행
 * @작성자 이내희
 * @마지막날짜 2010.12.17
 */
public class FileUploadUtil {

    /* Log를 위한 정의 */
    private Logger log = LogManager.getLogger(this.getClass());

    /**
     * 파일 업로드를 처리해 준다.
     * @param request
     * @return
     * @throws IOException
     */
    public DataMap fileUpload(HttpServletRequest request, String ADDFILE_ROOT_PATH,
            int ADDFILE_MAXSIZE) throws Exception {

        //return requestMap
        DataMap map = new DataMap();
        DataMap fileBox = new DataMap();

        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;

        // upload 폴더 없을경우 생성.
        if (!new File(ADDFILE_ROOT_PATH).exists()) new File(ADDFILE_ROOT_PATH).mkdirs();

        /*
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(ADDFILE_MAXSIZE);
        factory.setRepository(new File(ADDFILE_ROOT_PATH));

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(ADDFILE_MAXSIZE);
        */

        String fullDir = ""; //파일의 풀경로 	 ex) D:/temp/upload/board
        String dir = ""; //파일 저장 위치.  ex) /board

        try {

            /*
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            */
        	
        	
            Iterator<String> iter = mRequest.getFileNames();
            dir = (String) request.getAttribute("UPLOAD_DIR");

            dir = StringUtil.getContentReplace(dir);
            //업로드 저장 경로가 안들어왔을경우 Default 셋팅

            if (dir.equals("")) {
//                fullDir = ADDFILE_ROOT_PATH + File.separator + "temp";
                fullDir = ADDFILE_ROOT_PATH + "/" + "temp";
            } else {
//                fullDir = ADDFILE_ROOT_PATH + File.separator + dir;
                fullDir = ADDFILE_ROOT_PATH + "/" + dir;
            }
            //fullDir = StringUtil.getContentReplace(fullDir); // ':' 를 replace시 경로가 c:\경로가 c\로 변해버려서 정상적인 파일 생성 / 저장이 불가
            String eFullDir = fullDir;
            
            // 저장 폴더 없을 경우 생성.
            if (!new File(eFullDir).exists()) {
                new File(eFullDir).mkdirs();

            }

            int fileCnt = 0;
            int fileCheckCnt = 0;

            while (iter.hasNext()) {

                MultipartFile item = mRequest.getFile(iter.next());
                /*
                String itemName = item.getName();
                itemName = itemName.substring(itemName.lastIndexOf("\\") + 1);
                */


                String orgFileName = item.getOriginalFilename(); //사용자가 올린  파일 이름.
                String fileExt = orgFileName.substring(orgFileName.lastIndexOf(".") + 1, orgFileName.length());

                String sysFileName =  Long.toString(System.currentTimeMillis()) + "_" + item.getOriginalFilename(); //실제 저장되는 파일 이름.
                // 파일 확장자 명체크 로직 추가
                fileCheckCnt++;
                boolean checkFile = FileUploadCheckUtil.checkFileExt(orgFileName, ADDFILE_ROOT_PATH, 1);
                if (checkFile == true) {
                    // 시스템에 저장되는 파일.
                	//fullDir = StringUtil.getContentReplace(fullDir);
                	String eSeparator = File.separator;
                    File sysFile = FileUtil.getConvertFile(new File(fullDir + eSeparator + sysFileName));
                    // 파일 저장
                    item.transferTo(sysFile);
                    fileBox.addString("uploadFileFulltPath", fullDir); //전체 저장 위치.
                    fileBox.addString("uploadFilePath", dir); //저장 위치.
                    fileBox.addString("uploadFileOrgName", orgFileName); //사용자가 올린 파일명.
                    fileBox.addString("uploadFileSaveName", sysFileName); //실제 저장되는 파일 이름.
                    fileBox.addLong("uploadFileSize", sysFile.length()); //저장파일사이즈 
                    fileBox.addString("uploadFileExt", fileExt); //파일확장자
                    fileBox.addString("fileUploadOk", "Y"); //등록여부 
                    fileBox.addString("uploadFieldName", item.getName()); // 첨부파일 필드명
                    fileBox.addString("uploadSeq", item.getName().substring(item.getName().length() - 1)); // 첨부파일 순서 구분

                    fileCnt++;
                }
            }

            map.add("UPLOAD_FILE", fileBox);
            map.add("UPLOAD_FILE_CNT", fileCnt);
            map.add("UPLOAD_FILE_TMP", fileCheckCnt);

        } catch (IOException ex) {
            throw ex;
        } catch (Exception ex) {
            throw ex;

        }

        return map;
    }
    
    /**
     * 콘텐츠 차시구성 파일 업로드를 처리해 준다.
     * @param request
     * @return
     * @throws IOException
     */
    public DataMap fileUpload2(HttpServletRequest request, String ADDFILE_ROOT_PATH,
            int ADDFILE_MAXSIZE) throws Exception {

        //return requestMap
        DataMap map = new DataMap();

        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;

        // upload 폴더 없을경우 생성.
        if (!new File(ADDFILE_ROOT_PATH).exists()) new File(ADDFILE_ROOT_PATH).mkdirs();


        String fullDir = ""; //파일의 풀경로 	 ex) D:/temp/upload/board
        String dir = ""; //파일 저장 위치.  ex) /board

        try {
        	
            Iterator<String> iter = mRequest.getFileNames();
            dir = (String) request.getAttribute("UPLOAD_DIR");

            dir = StringUtil.getContentReplace(dir);
            //업로드 저장 경로가 안들어왔을경우 Default 셋팅

            if (dir.equals("")) {
                fullDir = ADDFILE_ROOT_PATH + File.separator + "temp";
            } else {
                fullDir = ADDFILE_ROOT_PATH + File.separator + dir;
            }
            String eFullDir = fullDir;
            
            // 저장 폴더 없을 경우 생성.
            if (!new File(eFullDir).exists()) {
                new File(eFullDir).mkdirs();

            }
            while (iter.hasNext()) {
                MultipartFile item = mRequest.getFile(iter.next());
                String sysFileName = item.getOriginalFilename(); //사용자가 올린  파일 이름.
                // 파일 확장자 명체크 로직 추가
                boolean checkFile = FileUploadCheckUtil.checkFileExt(sysFileName, ADDFILE_ROOT_PATH, 1);
                if (checkFile == true) {
                    // 시스템에 저장되는 파일.
                	//fullDir = StringUtil.getContentReplace(fullDir);
                	String eSeparator = File.separator;
                    File sysFile = FileUtil.getConvertFile(new File(fullDir + eSeparator + sysFileName));
                    // 파일 저장
                    item.transferTo(sysFile);
                }
            }
        } catch (IOException ex) {
        	
            throw ex;
        } catch (Exception ex) {
        	
            throw ex;
        }
        return map;
    }

    /**
     * 파일 업로드를 처리해 준다.(단일파일)
     * @param request
     * @return
     * @throws IOException
     */
    public DataMap singleFileUpload(HttpServletRequest request, MultipartFile item, String ADDFILE_ROOT_PATH, int ADDFILE_MAXSIZE) throws Exception {

        //return requestMap
        DataMap map = new DataMap();
        DataMap fileBox = new DataMap();

        // upload 폴더 없을경우 생성.
        if (!new File(ADDFILE_ROOT_PATH).exists()) new File(ADDFILE_ROOT_PATH).mkdirs();

        String fullDir = ""; //파일의 풀경로 	 ex) D:/temp/upload/board
        String dir = ""; //파일 저장 위치.  ex) /board

        try {
            dir = request.getParameter("UPLOAD_DIR");

            dir = StringUtil.getContentReplace(dir);
            //업로드 저장 경로가 안들어왔을경우 Default 셋팅

            if (dir.equals("")) {
                fullDir = ADDFILE_ROOT_PATH + File.separator + "temp";
            } else {
                fullDir = ADDFILE_ROOT_PATH + File.separator + dir;
            }
            
            String eFullDir = fullDir;
            
            // 저장 폴더 없을 경우 생성.
            if (!new File(eFullDir).exists()) {
                new File(eFullDir).mkdirs();

            }
        
            String orgFileName = item.getOriginalFilename(); //사용자가 올린  파일 이름.
            String fileExt = orgFileName.substring(orgFileName.lastIndexOf(".") + 1, orgFileName.length());

            String sysFileName = Long.toString(System.currentTimeMillis()) + "_" + item.getOriginalFilename(); //실제 저장되는 파일 이름.

            // 파일 확장자 명체크 로직 추가
            boolean checkFile = FileUploadCheckUtil.checkFileExt(orgFileName, ADDFILE_ROOT_PATH, 1);
            if (checkFile == true) {
                // 시스템에 저장되는 파일.
            	//fullDir = StringUtil.getContentReplace(fullDir);
            	String eSeparator = File.separator;
                File sysFile = FileUtil.getConvertFile(new File(fullDir + eSeparator + sysFileName));
                // 파일 저장
                item.transferTo(sysFile);

                fileBox.addString("uploadFileFulltPath", fullDir); //전체 저장 위치.
                fileBox.addString("uploadFilePath", dir); //저장 위치.
                fileBox.addString("uploadFileOrgName", orgFileName); //사용자가 올린 파일명.
                fileBox.addString("uploadFileSaveName", sysFileName); //실제 저장되는 파일 이름.
                fileBox.addLong("uploadFileSize", sysFile.length()); //저장파일사이즈 
                fileBox.addString("uploadFileExt", fileExt); //파일확장자
                fileBox.addString("fileUploadOk", "Y"); //등록여부 
                fileBox.addString("uploadFieldName", item.getName()); // 첨부파일 필드명
                fileBox.addString("uploadSeq", item.getName().substring(item.getName().length() - 1)); // 첨부파일 순서 구분

            }

            map.add("UPLOAD_FILE", fileBox);

        } catch (IOException ex) {
            throw ex;
        } catch (Exception ex) {
            throw ex;
        }

        return map;
    }
    
    /**
     * 파일 업로드를 처리해 준다.(단일파일)
     * 작성자 : 전용재C
     * @param request
     * @return
     * @throws IOException
     */
    public DataMap singleFileUpload(MultipartFile item, String ADDFILE_ROOT_PATH, String ADDFILE_SUB_PATH) throws Exception {

    	if (ADDFILE_ROOT_PATH == null || "".equals(ADDFILE_ROOT_PATH)) return null;
        
    	DataMap fileBox = new DataMap();

        
        // upload 폴더 없을경우 생성.
        if (!new File(ADDFILE_ROOT_PATH).exists()) new File(ADDFILE_ROOT_PATH).mkdirs();

        String fullDir = ""; 	//파일의 풀경로   ex) D:/temp/upload/board
        String dir = ""; 		//파일 저장 위치. ex) /board

        try {
        	
        	//업로드 저장 경로가 안들어왔을경우 Default 셋팅

        	dir = ADDFILE_SUB_PATH;

            if (dir != null && !"".equals(dir)) {
            	dir = StringUtil.getContentReplace(dir);
//            	fullDir = ADDFILE_ROOT_PATH + File.separator + dir;
            	fullDir = ADDFILE_ROOT_PATH + "/" + dir;
            } else {
            	dir = ADDFILE_ROOT_PATH.substring(ADDFILE_ROOT_PATH.lastIndexOf("/") + 1, ADDFILE_ROOT_PATH.length());
                fullDir = ADDFILE_ROOT_PATH;
            }
            
            // 저장 폴더 없을 경우 생성.
            if (!new File(fullDir).exists()) {
                new File(fullDir).mkdirs();

            }
        

            String orgFileName = item.getOriginalFilename(); 													// 사용자가 올린  파일 이름.
            String fileExt = orgFileName.substring(orgFileName.lastIndexOf(".") + 1, orgFileName.length());		// 파일확장자.
            String sysFileName = Long.toString(System.currentTimeMillis()) + "_" + item.getOriginalFilename(); 	// 실제 저장되는 파일 이름.

            // 파일 확장자 명체크 로직 추가
            boolean checkFile = FileUploadCheckUtil.checkFileExt(orgFileName, ADDFILE_ROOT_PATH, 1);
            if (checkFile == true) {
                // 시스템에 저장되는 파일.
            	//fullDir = StringUtil.getContentReplace(fullDir);
            	String eSeparator = File.separator;
                File sysFile = FileUtil.getConvertFile(new File(fullDir + eSeparator + sysFileName));
                // 파일 저장
                item.transferTo(sysFile);

                fileBox.addString("uploadFileFulltPath", fullDir); 										// 전체 저장 위치.
                fileBox.addString("uploadFilePath", dir); 												// 저장 위치.
                fileBox.addString("uploadFileOrgName", orgFileName); 									// 사용자가 올린 파일명.
                fileBox.addString("uploadFileSaveName", sysFileName); 									// 실제 저장되는 파일 이름.
                fileBox.addLong("uploadFileSize", sysFile.length()); 									// 저장파일사이즈 
                fileBox.addString("uploadFileExt", fileExt); 											// 파일확장자
                fileBox.addString("fileUploadOk", "Y"); 												// 등록여부 
                fileBox.addString("uploadFieldName", item.getName()); 									// 첨부파일 필드명
                fileBox.addString("uploadSeq", item.getName().substring(item.getName().length() - 1)); 	// 첨부파일 순서 구분

            }

            return fileBox;

        } catch (IOException ex) {
        	
            throw ex;
        } catch (Exception ex) {
        	
            throw ex;
        }

    }
    
    /**
     * zip파일 압축해제(파일명에 한글이 있을경우 한글깨짐 주의)
     * 전용재C
     * @param zipFile		: zip으로 압축된 파일
     * @param targetDir		: 압출을 풀어 저장할 디렉토리
     * @throws Exception
     */
    public static void unzip(File zipFile, File targetDir) throws Exception {
    	
    	int BUFFER_SIZE = 1024 * 2;
    	FileInputStream fis = null;
    	ZipInputStream zis = null;
    	ZipEntry zentry = null;
    	
    	try {
    		fis = new FileInputStream(zipFile);
    		zis = new ZipInputStream(fis);
    		
    		while ( (zentry = zis.getNextEntry()) != null ) {
    			String fileNameToUnzip = zentry.getName();
    			File targetFile = new File(targetDir, fileNameToUnzip);
    			
    			if (zentry.isDirectory()) {
    				// 디렉토리면 디렉토리 생성
    				new File(targetFile.getAbsolutePath()).mkdirs();
    			} else {
    				// 파일이면 상위 디렉토리 생성
    				new File(targetFile.getParent()).mkdirs();
    				FileOutputStream fos = null;
    				try {
    					fos = new FileOutputStream(targetFile);
    					byte[] buffer = new byte[BUFFER_SIZE];
    					int len = 0;
    					while ( (len = zis.read(buffer)) != -1 ) {
    						fos.write(buffer, 0, len);
    					}
    				} finally {
    					if (fos != null) { fos.close(); }
    				}
    			}
    			
    		}
    		
    	} finally {
    		if (zis != null) { zis.close(); }
    		if (fis != null) { fis.close(); }
    	}
    }
    
    /**
     * 스트림용
     * @param zipIns
     * @param targetDir
     * @throws Exception
     */
    public static void unzip(InputStream zipIns, File targetDir) throws Exception {
    	
    	int BUFFER_SIZE = 1024 * 2;
    	ZipInputStream zis = null;
    	ZipEntry zentry = null;
    	
    	try {
    		zis = new ZipInputStream(zipIns);
    		
    		while ( (zentry = zis.getNextEntry()) != null ) {
    			String fileNameToUnzip = zentry.getName();
    			File targetFile = new File(targetDir, fileNameToUnzip);
    			
    			if (zentry.isDirectory()) {
    				// 디렉토리면 디렉토리 생성
    				new File(targetFile.getAbsolutePath()).mkdirs();
    			} else {
    				// 파일이면 상위 디렉토리 생성
    				new File(targetFile.getParent()).mkdirs();
    				FileOutputStream fos = null;
    				try {
    					fos = new FileOutputStream(targetFile);
    					byte[] buffer = new byte[BUFFER_SIZE];
    					int len = 0;
    					while ( (len = zis.read(buffer)) != -1 ) {
    						fos.write(buffer, 0, len);
    					}
    				} finally {
    					if (fos != null) { fos.close(); }
    				}
    			}
    			
    		}
    		
    	} finally {
    		if (zis != null) { zis.close(); }
    	}
    }
    
    
    /**
     * 콘텐츠 zip 파일 업로드를 처리해 준다.(단일파일)
     * @param request
     * @return
     * @throws IOException
     */
    public void contentsFileUpload(HttpServletRequest request, MultipartFile item, DataMap data, int ADDFILE_MAXSIZE) throws Exception {

    	String fileName = item.getOriginalFilename(); //사용자가 올린  파일 이름
    	String contentsRootPath = data.getString("contentsRootPath");
    	String filePath = data.getString("filePath");
    	String treeFilePath = data.getString("treeFilePath");
    	
    	contentsRootPath = contentsRootPath.replaceAll("&","");
    	treeFilePath = treeFilePath.replaceAll("&","");
    	
    	//업로할 경로가 없을 경우 디렉토리 생성
    	if (!new File( contentsRootPath ).exists()) {
    		new File( contentsRootPath ).mkdir();
    	}
    	
    	String pathArr = "";
    	String[] path = treeFilePath.split("/");

    	if(path.length > 1) {
    		for(int i=0; i<path.length; i++) {
    			if(i != (path.length-1)) {
    				pathArr = pathArr + path[i];
    				
    				if (!new File( contentsRootPath +"/"+ pathArr ).exists()) {
    					new File( contentsRootPath +"/"+ pathArr ).mkdir();
    				}
    			}
    		}
    	}
    	
    	if (!new File( contentsRootPath +"/"+ treeFilePath ).exists()) {
    		new File( contentsRootPath +"/"+ treeFilePath ).mkdir();
    	}
    	
    	String tempPath = SangsProperties.getProperty("Globals.addFileRootPath") +"/"+ SangsProperties.getProperty("Globals.addFileTempPath");
    	
    	File orgFile = new File (tempPath +"/"+fileName); 
    	File newFile = new File (contentsRootPath +"/"+ treeFilePath +"/"+ fileName);
    	
    	/*if (orgFile.exists()) {
    		orgFile.renameTo(newFile);
    	}*/
    	File sysFile = FileUtil.getConvertFile(newFile);
        // 파일 저장
        item.transferTo(sysFile);

    	try {
    		
    		ContentFileManager contentFileManager = new ContentFileManager();
    		contentFileManager.unzip(newFile, new File(contentsRootPath +"/"+ treeFilePath), false);
    		
    	} catch (Exception ex){
    		throw ex;
		}

    }
    
    public static void main(String[] args) throws Exception {
    	//String tmp = "C:/Users/doldory77/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/HMREDU_ADM/edu-data/contents";
    	
    	File zipFile = new File("c:/tmp","zip_root.zip");
    	File targetDir = new File("d:/tmp");
    	unzip(zipFile, targetDir);
    }

}
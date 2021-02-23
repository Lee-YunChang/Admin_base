package com.sangs.support;

import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Stack;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveInputStream;
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.sangs.util.DateUtil;
import com.sangs.util.StringUtil;
/**
 * 이러닝콘텐츠 파일 관련 메니져 
 * @author Administrator
 *
 */

public class ContentFileManager {
	
	private static Log log = LogFactory.getLog(ContentFileManager.class);  
	
	private static final int BUFFER_SIZE = 4096;
	
	public List<EduMap> unzip(File zippedFile, File destDir, String charsetName) throws IOException {

		InputStream is = new FileInputStream(zippedFile);
		ZipArchiveInputStream zis ;
		ZipArchiveEntry entry ;
		String name ;
		File target ;
		int nWritten = 0;
		BufferedOutputStream bos ;
		byte [] buf = new byte[1024 * 8];
		List<EduMap> list = new ArrayList<EduMap>();
		
		String strDir = "";

		zis = new ZipArchiveInputStream(is, charsetName, true);
		
		while ( (entry = zis.getNextZipEntry()) != null ) {
			

				name = entry.getName();
				try {
					strDir = destDir + System.getProperty("file.separator") + name.substring(0, name.lastIndexOf("/"));
					strDir = StringUtil.getContentReplace(strDir);
					String eStrDir = strDir;
					if (!new File(eStrDir).exists()) {
						new File(eStrDir).mkdir(); 
					} 
					
				} catch(RuntimeException ex){
				} catch (Exception ex) {
					
					ex.getMessage();
				}
				
				String eName = StringUtil.getContentReplace(name); 
				target = new File (destDir, eName);
				EduMap map = new EduMap();
				if (!target.isDirectory()) {
					target.createNewFile();
					bos = new BufferedOutputStream(new FileOutputStream(target));
					try {
						while ((nWritten = zis.read(buf)) >= 0 ){
							bos.write(buf, 0, nWritten);
						}
					} catch (Exception e) {
						
					} finally {
						bos.close();
					}
					
					map.put("FTYPE", "FILE");
					map.put("NAME", name);
					map.put("SIZE", target.length());
					list.add(map);
				}
				
		}
		zis.close();
		return list;
	}
	
	/**
	 * compresses the given file(or dir) and creates new file under the same directory.
	 * @param src file or directory
	 * @throws IOException
	 */
	public void zip(File src) throws IOException{
		zip(src, Charset.defaultCharset().name(), true);
	}
	/**
	 * zips the given file(or dir) and create 
	 * @param src file or directory to compress
	 * @param includeSrc if true and src is directory, then src is not included in the compression. if false, src is included.
	 * @throws IOException
	 */
	public void zip(File src, boolean includeSrc) throws IOException{
		zip(src, Charset.defaultCharset().name(), includeSrc);
	}
	/**
	 * compresses the given src file (or directory) with the given encoding
	 * @param src
	 * @param charSetName
	 * @param includeSrc
	 * @throws IOException
	 */
	public void zip(File src, String charSetName, boolean includeSrc) throws IOException {
		zip( src, src.getParentFile(), charSetName, includeSrc);
	}
	/**
	 * compresses the given src file(or directory) and writes to the given output stream.
	 * @param src
	 * @param os
	 * @throws IOException
	 */
	public void zip(File src, OutputStream os) throws IOException {
		zip(src, os, Charset.defaultCharset().name(), true);
	}
	/**
	 * compresses the given src file(or directory) and create the compressed file under the given destDir. 
	 * @param src
	 * @param destDir
	 * @param charSetName
	 * @param includeSrc
	 * @throws IOException
	 */
	public void zip(File src, File destDir, String charSetName, boolean includeSrc) throws IOException {
		String fileName = src.getName();
		if ( !src.isDirectory() ){
			int pos = fileName.lastIndexOf(".");
			if ( pos >  0){
				fileName = fileName.substring(0, pos);
			}
		}
		fileName += ".zip";

		File zippedFile = new File ( destDir, fileName);
		if ( !zippedFile.exists() ) zippedFile.createNewFile();
		zip(src, new FileOutputStream(zippedFile), charSetName, includeSrc);
	}
	public void zip(File src, OutputStream os, String charsetName, boolean includeSrc)
	throws IOException {
		ZipArchiveOutputStream zos = new ZipArchiveOutputStream(os);
		zos.setEncoding(charsetName);
		FileInputStream fis ;
		
		int length ;
		ZipArchiveEntry ze ;
		byte [] buf = new byte[8 * 1024];
		String name ;
		
		Stack<File> stack = new Stack<File>();
		File root ;
		if ( src.isDirectory() ) {
			if( includeSrc ){
				stack.push(src);
				root = src.getParentFile();
			}
			else {
				File [] fs = src.listFiles();
				for (int i = 0; i < fs.length; i++) {
					stack.push(fs[i]);
				}
				root = src;
			}
		} else {
			stack.push(src);
			root = src.getParentFile();
		}
		
		while ( !stack.isEmpty() ){
			File f = stack.pop();
			name = toPath(root, f);
			if ( f.isDirectory()){
				File [] fs = f.listFiles();
				for (int i = 0; i < fs.length; i++) {
					if ( fs[i].isDirectory() ) stack.push(fs[i]);
					else stack.add(0, fs[i]);
				}
			} else {
				ze = new ZipArchiveEntry(name);
				zos.putArchiveEntry(ze);
				fis = new FileInputStream(f);
				
				try {
					while ( (length = fis.read(buf, 0, buf.length)) >= 0 ){
						zos.write(buf, 0, length);
					}
				} catch(Exception e) {
				} finally {

					fis.close();	
				}
				zos.closeArchiveEntry();
			}
		}
		zos.close();
	}
	private String toPath(File root, File dir){
		String path = dir.getAbsolutePath();
		path = path.substring(root.getAbsolutePath().length()).replace(File.separatorChar, '/');
		if ( path.startsWith("/")) path = path.substring(1);
		if ( dir.isDirectory() && !path.endsWith("/")) path += "/" ;
		return path ;
	}
	
	/**
	 * 파일목록조회
	 * @param source
	 */
	public List<EduMap> fileList(String filePath, List<EduMap> list, String subPath)  {

		try {
			File dir = new File(filePath); 
			if(!dir.isDirectory()){
				return list;
			}
			
			File[] fileList = dir.listFiles();
			
			fileList = sortFileList(fileList,comparetypeName);
			
			int size = 0;
			for (int i = 0 ; i < fileList.length ; i++) {
			
				File file = fileList[i]; 
				if (file.isFile()) {
					
					EduMap map = new EduMap();
					// 파일이 있다면 파일 이름 출력
					size = (int)(file.length() / 1024);
					if (size == 0) size = 1;
					map.put("FTYPE", "FILE");
					map.put("PATH", subPath);
					map.put("NAME", file.getName());
					map.put("SIZE", size);
					map.put("DT",  DateUtil.getDate(file.lastModified()));
					list.add(map);
					
				} else if (file.isDirectory()) {

					// 서브디렉토리가 존재하면 재귀적 방법으로 다시 탐색
					fileList(file.getCanonicalPath().toString(), list, subPath +"/"+file.getName()); 
	
				}				
			}
			return list;
		} catch (NullPointerException ex) {
			return list;
		}  catch (Exception ex) {
			return list;
		}
		
	}
	
	private static final int comparetypeName = 0;
	private static final int comparetypeDate = 1;
    
    public File[] sortFileList(File[] files, final int compareType)
    {
    
       Arrays.sort(files,
       new Comparator<Object>()
       {
        @Override
        public int compare(Object object1, Object object2) {
         
         String s1 = "";
         String s2 = "";
         int ret = 0;

         if(compareType == comparetypeName){
          s1 = ((File)object1).getName();
          s2 = ((File)object2).getName();
         }
         else if(compareType == comparetypeDate){
          s1 = ((File)object1).lastModified()+"";
          s2 = ((File)object2).lastModified()+"";
         }
         if(s1 != null && s2 != null) {
        	 ret = s1.compareTo(s2);
         }
         return ret;

       }
    });
     
     return files;
    }


	
	/**
     * 소스 디렉토리 및 파일 일괄 삭제 실행
     * @param source
     * @throws Exception
     */
    public static void removeAll(String source) throws Exception {
    	
    	File[] listFile = new File(source).listFiles(); 
    	try{
    		if(listFile.length > 0) {
    			for(int i = 0 ; i < listFile.length ; i++) {
    				if(listFile[i].isFile()) {
    					listFile[i].delete(); 
    				} else {
    					removeAll(listFile[i].getPath());
    				}
    				listFile[i].delete();
    			}
    	    }
    	} catch (Exception e) {
    		throw e;
    	}
    	
    }

    public static void unzip( String zipFilePath, String targetDirPath, boolean fileNameToLowerCase )
    		throws IOException, Exception
    	{
    		//unzip(new File(zipFilePath), new File(targetDirPath), fileNameToLowerCase);
    	
	    	File destDir = new File(targetDirPath);
	        if (!destDir.exists()) {
	            destDir.mkdir();
	        }
	        ZipInputStream zipIn = new ZipInputStream(new FileInputStream(zipFilePath));
	        ZipEntry entry = zipIn.getNextEntry();
	        // iterates over entries in the zip file
	        try {
		        while (entry != null) {
		            String filePath = targetDirPath + File.separator + entry.getName();
		            if (!entry.isDirectory()) {
		                // if the entry is a file, extracts it
		                extractFile(zipIn, filePath);
		            } else {
		                // if the entry is a directory, make the directory
		                File dir = new File(filePath);
		                dir.mkdir();
		            }
		            zipIn.closeEntry();
		            entry = zipIn.getNextEntry();
		        }
	        }catch(Exception e) {
			} finally {
				zipIn.close();
			}

    }
    
    /**
     * Extracts a zip entry (file entry)
     * @param zipIn
     * @param filePath
     * @throws IOException
     */
    private static void extractFile(ZipInputStream zipIn, String filePath) throws IOException {
        BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(filePath));
        byte[] bytesIn = new byte[BUFFER_SIZE];
        int read = 0;
        while ((read = zipIn.read(bytesIn)) != -1) {
            bos.write(bytesIn, 0, read);
        }
        bos.close();
    }

    public static void unzip(File zipFile, File targetDir, boolean fileNameToLowerCase)
    		throws IOException, Exception
    	{
    		FileInputStream fis = null;
    		ZipArchiveInputStream zis = null;
    		ZipEntry zentry = null;
    		FileWriter fw = null;
    		BufferedWriter bw = null;

    		String charsetName = "EUC-KR";
    		
    		try {
    			fis = new FileInputStream(zipFile); // FileInputStream
    			//zis = new ZipInputStream(fis); // ZipInputStream
    			
    			zis = new ZipArchiveInputStream(fis, charsetName, true);
    			
    			while ((zentry = (ZipEntry) zis.getNextEntry()) != null)
    			{
    				String fileNameToUnzip = zentry.getName();
    				if (fileNameToLowerCase) { // fileName toLowerCase
    					 fileNameToUnzip = fileNameToUnzip.toLowerCase();
    				}

    				File targetFile = new File(targetDir, fileNameToUnzip);

    				if (zentry.isDirectory()) // Directory 인 경우
    				{
    					targetFile.mkdirs();
    				}
    				else // File 인 경우
    				{
    					// Directory 생성
    					String dirPath = targetFile.getAbsolutePath().replaceAll("\\\\", "/");
    					File dir = new File( dirPath.substring(0, dirPath.lastIndexOf("/")) );
    					dir.mkdirs();

    					fw = new FileWriter( targetFile );
    					bw = new BufferedWriter( fw );
    					
    					if( bw != null ) bw.close();
    					if( fw != null ) fw.close();
    					unzipEntry(zis, targetFile);
    				}
    			}
    		 }
    		 catch( IOException ioe ){
    			 throw ioe;
    		 }
    		 catch( Exception e ){
    			 throw e;
    		 }
    		 finally
    		 {
    			 try{
    				 if( zis != null ) zis.close();
    				 if( fis != null ) fis.close();
    				 if( bw != null ) bw.close();
    				 if( fw != null ) fw.close();
    			 }
    			 catch( Exception e ){throw e;}
    		 }
    	}

    	/**
    	 * Zip 파일의 한 개 엔트리의 압축을 푼다.
    	 *
    	 * @param zis - Zip Input Stream
    	 * @param filePath - 압축 풀린 파일의 경로
    	 * @return
    	 * @throws Exception
    	 */
    	protected static File unzipEntry(ZipArchiveInputStream zis, File targetFile) throws Exception {
    		FileOutputStream fos = null;
    		try {
    			fos = new FileOutputStream(targetFile);

    			byte[] buffer = new byte[1024];
    			int len = 0;
    			while ((len = zis.read(buffer)) != -1) {
    				fos.write(buffer, 0, len);
    			}
    		}
    		catch( Exception e )
    		{
    			throw e;
    		}
    		finally {
    			if (fos != null) fos.close();
    		}
    		return targetFile;
    	}
}

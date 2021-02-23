package com.sangs.util;

import java.awt.Container;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.MediaTracker;
import java.awt.RenderingHints;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
 
/**
 * 이미지 처리를 위한 Helper Class
 *  		               

 * @author 	wibo  
 * @since 	2014.04.01
 */
public class SangsImageThumb { 

	protected Logger log = LogManager.getLogger(this.getClass());
	
	private File imgFile = null;			// 원본 이미지 File 객체
	private OutputStream output = null;		// Target 섬네일 이미지의 OutputStream
	private int width = 0;					// Target 썸네일 이미지의 Width
	private int height = 0;					// Target 썸네일 이미지의 Height
	private int quality = 100;				// 썸네일 이미지의 Quality
	private int mode = 0;				//	0 일때 비율로 리사이즈, 1 명시한 사이즈로 (width, height) 리사이즈   
	
	/**
	 * 생성자.
	 */
	public SangsImageThumb() {}

	/**
	 * 생성자.
	 * @param imgPath 원본 이미지 Path
	 * @param width Target이미지의 Width
	 * @param height Target이미지의 Height
	 */
	public SangsImageThumb(String imgPath, int width, int height) {
		this.imgFile = new File(imgPath);
		this.width = width;
		this.height = height;
	}
	public SangsImageThumb(String imgPath, int width, int height, int mode) {
		this.imgFile = new File(imgPath);
		this.width = width;
		this.height = height;
		this.mode = mode;
	}

	/**
	 * 생성자.
	 * @param file 원본이미지의 File 객체
	 * @param width Target이미지의 Width
	 * @param height Target이미지의 Height
	 */
	public SangsImageThumb(File file, int width, int height) {
		this.imgFile = file;
		this.width = width;
		this.height = height;
	}
	

	/**
	 * File 객체에 썸네일 이미지 저장
	 * @param file java.io.File 객체
	 */
	public void save(File file) throws FileNotFoundException {
		this.output = new FileOutputStream(file);
		run();
	}

	/**
	 * 썸네일 이미지 저장
	 * @param savePath 저장하려는 파일 Path
	 */
	public void save(String savePath) throws FileNotFoundException {
		this.output = new FileOutputStream(new File(savePath));
		run();
	}

	/**
	 * OutputStream에 썸네일 이미지 표출
	 * @param outputStream java.io.OutputStream
	 */
	public void save(OutputStream outputStream) {
		this.output = outputStream;
		run();
	}

	/**
	 * 이미지 Resizing을 실행한다.
	 */
	private void run() {
		int thumbWidth = 0;
		int thumbHeight = 0;
		String realPath = "";

		try {
			// 원본 이미지가 존재할 경우, 썸네일 이미지를 생성한다.
			if (this.imgFile.exists() && this.imgFile.isFile()) {
				realPath = this.imgFile.getAbsolutePath();

				// 원본 이미지를 읽어들인다.
				Image image = Toolkit.getDefaultToolkit().getImage(realPath);
				MediaTracker mediaTracker = new MediaTracker(new Container());
				mediaTracker.addImage(image, 0);
				mediaTracker.waitForID(0);

				// width,height 입력이 없으면, 원래 사이즈 크기로 지정한다.
				if (this.width == 0 || this.height == 0) {
					thumbWidth = image.getWidth(null);
					thumbHeight = image.getHeight(null);
				}
				// 썸네일 이미지의 width, height 크기를 계산한다.
				else {
					
					
					
					int imageWidth = image.getWidth(null);
					int imageHeight = image.getHeight(null);
					
					if(mode == 0) {	// 0일때 비율 리사이즈
						
						// 출력될 영역보다 실제 이미지가 클 경우 작은사이즈가 기준이 되고
						if (imageWidth * thumbHeight / imageHeight > thumbWidth) {
							thumbWidth = imageWidth * thumbHeight / imageHeight;
						} else {
							thumbHeight = imageHeight * thumbWidth / imageWidth;
						}
					} else if(mode == 3) {
						// width와 height중 원하는 사이즈 보다 큰쪽을 원하는 사이즈로 하여 비율 리사이즈
						if (imageWidth * thumbHeight / imageHeight < thumbWidth) {
							thumbWidth = imageWidth * thumbHeight / imageHeight;
						} else {
							thumbHeight = imageHeight * thumbWidth / imageWidth;
						}
					} else if(mode == 9) {
						// 명시한 사이즈로 리사이즈
						thumbWidth = this.width;
						thumbHeight = this.height;
					}
				}

				// 원본 이미지를 썸네일 이미지의 크기에 맞게 새로 그린다.
				BufferedImage thumbImage = new BufferedImage(thumbWidth, thumbHeight, BufferedImage.TYPE_INT_RGB);
				Graphics2D graphics2D = thumbImage.createGraphics();
				graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
				graphics2D.drawImage(image, 0, 0, thumbWidth, thumbHeight, null);
 
				// 썸네일 이미지를 저장한다.
				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(this.output);
				JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(thumbImage);
				quality = Math.max(0, Math.min(quality, 100));
				param.setQuality((float) quality / 100.0f, false);
				encoder.setJPEGEncodeParam(param);
				encoder.encode(thumbImage);

				// 저장된 썸네일이미지를 outputStram으로 최종 생성한다.
				
			}
		}
		
		catch (Exception e) {
			
		}finally{
			try {
				this.output.flush();
				this.output.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				
			}
			
		}
	}

	/**
	 * 원본 이미지를 읽어서 썸네일로 저장한다.
	 * @param srcImgPath 원본 이미지 파일명
	 * @param targetImgPath 저장할 이미지 파일명
	 * @param width 생성할 썸네일이미지의 Width
	 * @param height 생성할 썸네일이미지의 Height
	 */
	public static void thumbnail(String srcImgPath, String targetImgPath, int width, int height, int mode) {
		SangsImageThumb sangsImageThumb = null;
		try {
			sangsImageThumb = new SangsImageThumb(srcImgPath, width, height, mode);
			sangsImageThumb.save(targetImgPath);
		}
		catch (Exception e) {
			 
		}
		finally {
			sangsImageThumb = new SangsImageThumb();
		}
	}
	
	public static void thumbnail(String srcImgPath, String targetImgPath, int width, int height) {
		thumbnail(srcImgPath, targetImgPath, width, height, 0);
	}
	

	/**
	 * 원본 이미지를 읽어서 썸네일로 저장한다.
	 * @param srcFile 원본 이미지 파일명
	 * @param targetImgPath 저장할 이미지 파일명
	 * @param width 생성할 썸네일이미지의 Width
	 * @param height 생성할 썸네일이미지의 Height
	 */
	public static void thumbnail(File srcFile, String targetImgPath, int width, int height) {
		SangsImageThumb sangsImageThumb = null;
		try {
			sangsImageThumb = new SangsImageThumb(srcFile, width, height);
			sangsImageThumb.save(targetImgPath);
		}
		catch (Exception e) {
			 
		}
		finally {
			sangsImageThumb = new SangsImageThumb();
		}
	}

	/**
	 * 원본 이미지를 읽어서 썸네일로 저장한다.
	 * @param srcImgPath 원본 이미지 File 객체
	 * @param output 표출할 OutputStream
	 * @param width 생성할 썸네일이미지의 Width
	 * @param height 생성할 썸네일이미지의 Height
	 */
	public static void thumbnail(String srcImgPath, OutputStream output, int width, int height) {
		SangsImageThumb sangsImageThumb = null;
		try {
			sangsImageThumb = new SangsImageThumb(srcImgPath, width, height);
			sangsImageThumb.save(output);
		}
		catch (Exception e) {
			 
		}
		finally {
			sangsImageThumb =  new SangsImageThumb();
		}
	}

	/**
	 * 원본 이미지를 읽어서 썸네일로 저장한다.
	 * @param srcFile 원본 이미지 File 객체
	 * @param output 표출할 OutputStream
	 * @param width 생성할 썸네일이미지의 Width
	 * @param height 생성할 썸네일이미지의 Height
	 */
	public static void thumbnail(File srcFile, OutputStream output, int width, int height) {
		
		Logger log = LogManager.getLogger();
		
		SangsImageThumb sangsImageThumb = null;
		try {
			sangsImageThumb = new SangsImageThumb(srcFile, width, height);
			sangsImageThumb.save(output);
		}
		catch (Exception e) {
			
		}
		finally {
			sangsImageThumb = new SangsImageThumb();
		}
	}

}

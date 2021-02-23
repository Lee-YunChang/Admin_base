package com.sangs.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import com.sangs.support.SangsProperties;


public class LcmsParser {
	private static final Logger log = LogManager.getLogger(LcmsParser.class);
	
	public static final String ADLCP	="http://www.adlnet.org/xsd/adlcp_v1p3";
	public static final String ADLSEQ	="http://www.adlnet.org/xsd/adlseq_v1p3";
	public static final String ADLNAV	="http://www.adlnet.org/xsd/adlnav_v1p3";
	public static final String IMSSS	="http://www.imsglobal.org/xsd/imsss";
	
	public static boolean isPrint = false;
	
	private static Pattern p = Pattern.compile("loadPage[(]\"(.*)\"[)]");
	// private static String tmpContentsPath = "C:/Users/doldory77/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp2/wtpwebapps/HMREDU_WWW/edu-data/contents";
	
	
	
	///////////////////////////////////////////////////////
	// SQL 영역 시작
	///////////////////////////////////////////////////////
	
	
	private static String getEdCourseTree = "SELECT TREENO, FILE_PATH, FRAMECNT FROM LMS_ED_COURSE_TREE WHERE COURSENO = ?";
	
	
	private static String upEdCourseTreeFrmCnt = "UPDATE LMS_ED_COURSE_TREE SET FRAMECNT = ? WHERE TREENO = ?";
	
	
	private static String getItemResourceMaxSeq = "SELECT NVL(MAX(RSRC_SEQ)+1, 1) AS RSRC_SEQ FROM LCMS_ITEM_RESOURCE";
	
	
	private static String insItemResource = "INSERT INTO LCMS_ITEM_RESOURCE (RSRC_SEQ,RSRC_TYPE,RSRC_HREF,RSRC_BASE_DIR,RSRC_SCORM_TYPE,USER_ID,UPDATE_DT,GROUP_SEQ,RSRC_TITLE,RSRC_SCO_SIZE,RSRC_SCO_VERSION,RSRC_ID) VALUES (?,?,?,?,?,'1',SYSDATE,1,?,0,?,?)";
	
	
	private static String getOrganizationMaxSeq = "SELECT NVL(MAX(ORG_SEQ) + 1, 1) AS ORG_SEQ FROM LCMS_ORGANIZATION";
	
	
	private static String insOrganization = "INSERT INTO LCMS_ORGANIZATION (ORG_SEQ,COURSE_TYPE,ORG_ID,ORG_TITLE,ORG_DIR,UPDATE_DT,OBJ_GLOBAL_TO_SYS,ORG_GUBUN,COURSE_SEQ) VALUES (?,'import',?,	?,'test',SYSDATE,'true','contents',?)";
	
	
	private static String getItemMaxSeq = "SELECT NVL(MAX(ITEM_SEQ) + 1, 1) AS ITEM_SEQ FROM LCMS_ITEM";
	
	
	private static String insItem = "INSERT INTO LCMS_ITEM (ITEM_SEQ,HIGH_ITEM_SEQ,ORG_ITEM_NO,ITEM_ID,ITEM_ID_REF,ITEM_TITLE,ITEM_TYPE,ITEM_OPEN,ITEM_START_FILE,UPDATE_DT,RSRC_SEQ,ORG_SEQ,COURSE_SEQ,BEFORE_ITEM_SEQ) VALUES (?,0,1,?,?,?,'00001','true',?,SYSDATE,?,?,?,0)";
	
	
	private static String getScormSeqMaxSeq = "SELECT NVL(MAX(SEQ_IDX_NUM) + 1, 1) AS SEQ_IDX_NUM FROM LCMS_SCORM_SEQUENCE";
	
	
	private static String insScormSequence = "INSERT INTO LCMS_SCORM_SEQUENCE (SEQ_IDX_NUM,ITEM_SEQ,ORG_SEQ,CHOICE,CHOICE_EXIT,FLOW,ROLLUP_OBJ_SATISFIED,ROLLUP_PROGRESS_COMPLETION,OBJ_MEASURE_WEIGHT,HIDE_UI_CON,UPDATE_DT,COURSE_SEQ) VALUES (?,?,?,?,?,?,?,?,?,?,SYSDATE,?)";
	
	
	//private static String insEdCourseTree = "INSERT INTO ED_COURSE_TREE (TREENO,COURSENO,SDAY,SUBJECT,FILE_PATH,MOBILE_FILE_PATH,LCMS_ORG_SEQ,SRC_FROM) VALUES ((SELECT NVL(MAX(TREENO) + 1, 1) FROM ED_COURSE_TREE),?,?,?,'/' || ? || '/' || ?,'/' || ? || SUBSTR(?,10),?,?)";
	private static String insEdCourseTree = "INSERT INTO LMS_ED_COURSE_TREE (TREENO,COURSENO,SDAY,SUBCNT,SUBJECT,FILE_PATH,LCMS_ORG_SEQ,SRC_FROM) VALUES ((SELECT NVL(MAX(TREENO) + 1, 1) FROM LMS_ED_COURSE_TREE),?,?,1,?,'/' || ? || '/' || ?,?,?)";
	
	
	private static String deLcmsOrganization = "DELETE FROM LCMS_ORGANIZATION WHERE ORG_SEQ IN (SELECT LCMS_ORG_SEQ FROM LMS_ED_COURSE_TREE WHERE COURSENO = ?)";
	
	
	private static String delLcmsScormSequence = "DELETE FROM LCMS_SCORM_SEQUENCE	WHERE ORG_SEQ IN (SELECT LCMS_ORG_SEQ FROM LMS_ED_COURSE_TREE WHERE COURSENO = ?)";
	
	
	private static String delLcmsItemResource = "DELETE FROM LCMS_ITEM_RESOURCE WHERE RSRC_SEQ IN ( SELECT RSRC_SEQ FROM LCMS_ITEM WHERE ORG_SEQ IN (SELECT LCMS_ORG_SEQ FROM LMS_ED_COURSE_TREE WHERE COURSENO = ?) )";
	
	
	private static String delLcmsItem = "DELETE FROM LCMS_ITEM WHERE ORG_SEQ IN (SELECT LCMS_ORG_SEQ FROM LMS_ED_COURSE_TREE WHERE COURSENO = ?)";
	
	
	private static String delEdCourseTree = "DELETE FROM LMS_ED_COURSE_TREE WHERE COURSENO = ?";
	
	
	///////////////////////////////////////////////////////
	// SQL 영역 끝
	///////////////////////////////////////////////////////	
	
	/**
	 * xml tag 사이의 텍스트 반환
	 * @param nodeOrElement
	 * @param nameSpace
	 * @param tagName
	 * @param idx
	 * @return
	 */
	public static String getText(Object nodeOrElement, String nameSpace, String tagName, int idx) {
		String result = "";
		Element element = (Element) nodeOrElement;
		if (tagName == null) {
			result = element.getTextContent();
		} else {
			
			if (nameSpace == null) {
				result = element.getElementsByTagName(tagName).item(idx).getTextContent();
			} else {
				result =  element.getElementsByTagNameNS(nameSpace, tagName).item(idx).getTextContent();
			}
		}
		
		 
		return result;
		
	}
	
	/**
	 * @param nodeOrElement
	 * @return
	 */
	public static String getText(Object nodeOrElement) {
		String result = "";
		Element element = (Element) nodeOrElement;
		result = element.getTextContent();
		
		 
		return result;
	}
	
	/**
	 * xml tag의 속성값 반환
	 * @param nodeOrElement
	 * @param nameSpace
	 * @param tagName
	 * @param idx
	 * @param attrName
	 * @return
	 */
	public static String getAttribute(Object nodeOrElement, String nameSpace, String tagName, int idx, String attrName) {
		String result = "";
		Element element = (Element) nodeOrElement;
		if (tagName == null) {
			result = element.getAttribute(attrName);
		} else {
			
			if (nameSpace == null) {
				result = ((Element)element.getElementsByTagName(tagName).item(idx)).getAttribute(attrName);
			} else {
				result = ((Element)element.getElementsByTagNameNS(nameSpace, tagName).item(idx)).getAttribute(attrName);
			}
		}
		
		 
		return result;
		
	}
	
	/**
	 * @param nodeOrElement
	 * @param attrName
	 * @return
	 */
	public static String getAttribute(Object nodeOrElement, String attrName) {
		String result = "";
		Element element = (Element) nodeOrElement;
		result = element.getAttribute(attrName);
		
		 
		return result;
	}
	
	/**
	 * @param nodeOrElement
	 * @param nameSpace
	 * @param attrName
	 * @return
	 */
	public static String getAttribute(Object nodeOrElement, String nameSpace, String attrName) {
		String result = "";
		Element element = (Element) nodeOrElement;
		result = element.getAttributeNS(nameSpace, attrName);
		
		 
		return result;
	}
	
	/**
	 * 특정노드의 작식을 찾아 반환
	 * @param nodeOrElement
	 * @param nameSpace
	 * @param searchTag
	 * @param idx
	 * @return
	 */
	public static Element getElement(Object nodeOrElement, String nameSpace, String searchTag, int idx) {
		Element element = (Element) nodeOrElement;
		if (nameSpace == null) {
			return (Element)element.getElementsByTagName(searchTag).item(idx);
		} else {
			return (Element)element.getElementsByTagNameNS(nameSpace, searchTag).item(idx);
		}
	}

	/**
	 * XML Parsing To List<Map>
	 * @param xmlFullPath
	 * @return
	 * @throws Exception
	 */
	public static List<Map<String, Object>> parse(String xmlFullPath, InputStream in) throws Exception {
		
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		dbf.setNamespaceAware(true);
		Document dom = null;
		if (xmlFullPath == null) {
			dom = dbf.newDocumentBuilder().parse(in);
		} else {
			dom = dbf.newDocumentBuilder().parse(new File(xmlFullPath)); // d:/tmp/imsmanifest.xml
		}
		
		NodeList org = dom.getElementsByTagName("organization");
		
		
		Element tmpElement = null;
		NodeList tmpNodeList = null;
		
		Element organization = null;
		Element item = null;
		Element sequencing = null;
		
		List<Map<String, Object>> orgMapList = new ArrayList<Map<String, Object>>();
		Map<String, Object> orgMap = null;
		
		List<Map<String, Object>> rollupMapList = null;
		Map<String, Object> rollupMap = null;
		
		XPath xpath = XPathFactory.newInstance().newXPath();
		String ex = "//*[local-name()='resource'][@identifier='#identifier#']";
		
		for (int i=0; i<org.getLength(); i++) {
			
			orgMap = new HashMap<String, Object>();
			rollupMapList = new ArrayList<Map<String,Object>>();
			
			organization = (Element)org.item(i);
			orgMap.put("org_id", getAttribute(organization, "identifier"));
			tmpNodeList = organization.getElementsByTagName("title");
			orgMap.put("title1", getText(tmpNodeList.item(0)));
			
			item = getElement(organization, null, "item", 0);
			orgMap.put("title2", getText(item, null, "title", 0));
			orgMap.put("identifier", getAttribute(item, "identifier"));
			orgMap.put("identifierref", getAttribute(item, "identifierref"));
			orgMap.put("hideLMSUI", getText(item, ADLNAV, "hideLMSUI", 0));
			
			sequencing = getElement(organization, IMSSS, "sequencing", 1);
			orgMap.put("choice", getAttribute(sequencing, IMSSS, "controlMode", 0, "choice"));
			orgMap.put("choiceExit", getAttribute(sequencing, IMSSS, "controlMode", 0, "choiceExit"));
			orgMap.put("flow", getAttribute(sequencing, IMSSS, "controlMode", 0, "flow"));
			
			orgMap.put("rollupObjectiveSatisfied", getAttribute(sequencing, IMSSS, "rollupRules", 0, "rollupObjectiveSatisfied"));
			orgMap.put("rollupProgressCompletion", getAttribute(sequencing, IMSSS, "rollupRules", 0, "rollupProgressCompletion"));
			orgMap.put("objectiveMeasureWeight", getAttribute(sequencing, IMSSS, "rollupRules", 0, "objectiveMeasureWeight"));
			
			tmpNodeList = sequencing.getElementsByTagNameNS(IMSSS, "rollupRule");
			for (int j=0; j<tmpNodeList.getLength(); j++) {
				tmpElement = (Element)tmpNodeList.item(j);
				
				rollupMap = new HashMap<String, Object>();
				rollupMap.put("childActivitySet", getAttribute(tmpElement, "childActivitySet"));
				rollupMap.put("conditionCombination", getAttribute(tmpElement, IMSSS, "rollupConditions", 0, "conditionCombination"));
				rollupMap.put("condition", getAttribute(tmpElement, IMSSS, "rollupCondition", 0, "condition"));
				rollupMap.put("operator", getAttribute(tmpElement, IMSSS, "rollupCondition", 0, "operator"));
				rollupMap.put("action", getAttribute(tmpElement, IMSSS, "rollupAction", 0, "action"));
				
				rollupMapList.add(rollupMap);
				
			}
			
			Node node = (Node)xpath.compile(ex.replace("#identifier#", (String)orgMap.get("identifierref"))).evaluate(dom, XPathConstants.NODE);
			
			orgMap.put("type", getAttribute(node, "type"));
			orgMap.put("scormType", getAttribute(node, ADLCP, "scormType"));
			orgMap.put("href", getAttribute(node, "href"));
			orgMap.put("file_cnt", node.getChildNodes().getLength());
			
			orgMap.put("rollupRule", rollupMapList);
			
			orgMapList.add(orgMap);
			
			
		}
		
		return orgMapList;
		
		
	}
	
	/**
	 * XML TO LCMS DB Insert
	 * @param conn
	 * @param xmlParseList
	 * @param courseno
	 * @return
	 * @throws Exception
	 */
	public static boolean insertLCMSDB(Connection conn, List<Map<String, Object>> xmlParseList, int courseno) throws Exception {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			conn.setAutoCommit(false);
			
			// 1. 기존 데이터 삭제(순서중요)
			stmt = conn.prepareStatement(LcmsParser.deLcmsOrganization);
			stmt.setInt(1, courseno); stmt.execute(); stmt.close(); stmt = null;
			stmt = conn.prepareStatement(LcmsParser.delLcmsScormSequence);
			stmt.setInt(1, courseno); stmt.execute(); stmt.close(); stmt = null;
			stmt = conn.prepareStatement(LcmsParser.delLcmsItemResource);
			stmt.setInt(1, courseno); stmt.execute(); stmt.close(); stmt = null;
			stmt = conn.prepareStatement(LcmsParser.delLcmsItem);
			stmt.setInt(1, courseno); stmt.execute(); stmt.close(); stmt = null;
			stmt = conn.prepareStatement(LcmsParser.delEdCourseTree);
			stmt.setInt(1, courseno); stmt.execute(); stmt.close(); stmt = null;
			
			
			// 2. XML 파싱된 데이터(MAP LIST)를 DB에 등록(순서중요)
			int rsrc_seq = 0;
			rs = conn.prepareStatement(getItemResourceMaxSeq).executeQuery();
			while (rs.next()) {
				rsrc_seq = rs.getInt("RSRC_SEQ");
			}
			rs.close();
			rs = null;
			
			String[] tmpArr = null;
			for (int i=0,max=xmlParseList.size(); i<max; i++) {
				stmt = conn.prepareStatement(insItemResource);
				xmlParseList.get(i).put("rsrc_seq", rsrc_seq);
				stmt.setInt(1, rsrc_seq);
				stmt.setString(2, String.valueOf(xmlParseList.get(i).get("type")));
				stmt.setString(3, String.valueOf(xmlParseList.get(i).get("href")));
				
				tmpArr = String.valueOf(xmlParseList.get(i).get("href")).split("[/]");
				
				stmt.setString(4, courseno + "/" + tmpArr[0] + "/" + tmpArr[1]);
				stmt.setString(5, String.valueOf(xmlParseList.get(i).get("scormType")));
				stmt.setString(6, String.valueOf(xmlParseList.get(i).get("title2")));
				stmt.setString(7, "1.00.00");
				stmt.setString(8, String.valueOf(xmlParseList.get(i).get("identifierref")));
				
				stmt.execute();
				stmt.close();
				stmt = null;
				
				rsrc_seq++;
			}
			
			int org_seq = 0;
			rs = conn.prepareStatement(getOrganizationMaxSeq).executeQuery();
			while (rs.next()) {
				org_seq = rs.getInt("ORG_SEQ");
			}
			rs.close();
			rs = null;
			
			for (int i=0,max=xmlParseList.size(); i<max; i++) {
				stmt = conn.prepareStatement(insOrganization);
				xmlParseList.get(i).put("org_seq", org_seq);
				stmt.setInt(1, org_seq);
				stmt.setString(2, String.valueOf(xmlParseList.get(i).get("org_id")));
				stmt.setString(3, String.valueOf(xmlParseList.get(i).get("title1")));
				stmt.setInt(4, courseno);
				
				stmt.execute();
				stmt.close();
				stmt = null;
				
				org_seq++;
			}
			
			int item_seq = 0;
			rs = conn.prepareStatement(getItemMaxSeq).executeQuery();
			while (rs.next()) {
				item_seq = rs.getInt("ITEM_SEQ");
			}
			rs.close();
			rs = null;
			
			for (int i=0,max=xmlParseList.size(); i<max; i++) {
				stmt = conn.prepareStatement(insItem);
				xmlParseList.get(i).put("item_seq", item_seq);
				stmt.setInt(1, item_seq);
				stmt.setString(2, String.valueOf(xmlParseList.get(i).get("identifier")));
				stmt.setString(3, String.valueOf(xmlParseList.get(i).get("identifierref")));
				stmt.setString(4, String.valueOf(xmlParseList.get(i).get("title2")));
				stmt.setString(5, String.valueOf(xmlParseList.get(i).get("href")));
				stmt.setInt(6, Integer.valueOf(String.valueOf(xmlParseList.get(i).get("rsrc_seq"))));
				stmt.setInt(7, Integer.valueOf(String.valueOf(xmlParseList.get(i).get("org_seq"))));
				stmt.setInt(8, courseno);
				
				stmt.execute();
				stmt.close();
				stmt = null;
				
				item_seq++;
			}
			
			int seq_idx_num = 0;
			rs = conn.prepareStatement(getScormSeqMaxSeq).executeQuery();
			while (rs.next()) {
				seq_idx_num = rs.getInt("SEQ_IDX_NUM");
			}
			rs.close();
			rs = null;
			
			for (int i=0,max=xmlParseList.size(); i<max; i++) {
				stmt = conn.prepareStatement(insScormSequence);
				xmlParseList.get(i).put("seq_idx_num", seq_idx_num);
				stmt.setInt(1, seq_idx_num);
				stmt.setInt(2, Integer.valueOf(String.valueOf(xmlParseList.get(i).get("item_seq"))));
				stmt.setInt(3, Integer.valueOf(String.valueOf(xmlParseList.get(i).get("org_seq"))));
				stmt.setString(4, String.valueOf(xmlParseList.get(i).get("choice")));
				stmt.setString(5, String.valueOf(xmlParseList.get(i).get("choiceExit")));
				stmt.setString(6, String.valueOf(xmlParseList.get(i).get("flow")));
				stmt.setString(7, String.valueOf(xmlParseList.get(i).get("rollupObjectiveSatisfied")));
				stmt.setString(8, String.valueOf(xmlParseList.get(i).get("rollupProgressCompletion")));
				stmt.setString(9, String.valueOf(xmlParseList.get(i).get("objectiveMeasureWeight")));
				stmt.setString(10, String.valueOf(xmlParseList.get(i).get("hideLMSUI")));
				stmt.setInt(11, courseno);
				
				stmt.execute();
				stmt.close();
				stmt = null;
				
				seq_idx_num++;
			}
			
			innerInsertEdCourseTreeDB(conn, xmlParseList, courseno);
			
			
			conn.commit();
			
			return true;
		} catch (Exception e) {
			conn.rollback();
			
			return false;
		} finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
		
		
	}
	
	/**
	 * XML TO LMS_ED_COURSE_TREE Insert
	 * @param conn
	 * @param xmlParseList
	 * @param courseno
	 * @return
	 * @throws Exception
	 */
	public static boolean insertEdCourseTreeDB(Connection conn, List<Map<String, Object>> xmlParseList, int courseno) throws Exception {
		
		PreparedStatement stmt = null;
		
		try {
			conn.setAutoCommit(false);
			
			for (int i=0,max=xmlParseList.size(); i<max; i++) {
				stmt = conn.prepareStatement(insEdCourseTree);
				stmt.setInt(1, courseno);
				stmt.setInt(2, i+1);
				stmt.setString(3, String.valueOf(xmlParseList.get(i).get("title2")));
				stmt.setString(4, ""+courseno);
				stmt.setString(5, String.valueOf(xmlParseList.get(i).get("href")));
				stmt.setString(6, ""+courseno);
				stmt.setString(7, String.valueOf(xmlParseList.get(i).get("href")));
				stmt.setInt(8, Integer.valueOf(String.valueOf(xmlParseList.get(i).get("org_seq"))));
				stmt.setString(9, "1");
				
				stmt.execute();
				stmt.close();
				stmt = null;
			}
			
			conn.commit();
			
			return true;
		} catch (Exception e) {
			conn.rollback();
			
			return false;
		} finally {
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
	}
	
	public static void innerInsertEdCourseTreeDB(Connection conn, List<Map<String, Object>> xmlParseList, int courseno) throws Exception {
		
		PreparedStatement stmt = null;
		
		try {
			
			for (int i=0,max=xmlParseList.size(); i<max; i++) {
				stmt = conn.prepareStatement(insEdCourseTree);
				stmt.setInt(1, courseno);
				stmt.setInt(2, i+1);
				stmt.setString(3, String.valueOf(xmlParseList.get(i).get("title2")));
				stmt.setString(4, ""+courseno);
				stmt.setString(5, String.valueOf(xmlParseList.get(i).get("href")));
				
				stmt.setInt(6, Integer.valueOf(String.valueOf(xmlParseList.get(i).get("org_seq"))));
				stmt.setString(7, "1");
				
				stmt.execute();
				stmt.close();
				stmt = null;
			}
			
		} finally {
			
			if (stmt != null) stmt.close();
			
		}
	}	
	
	/**
	 * 차시별 페이지수 자동 등록
	 * @param conn
	 * @param contentsPath	: 컨텐츠 풀 물리경고
	 * @param courseno
	 * @return
	 * @throws Exception
	 */
	public static boolean pageCntParse(Connection conn, String contentsPath, int courseno) throws Exception {

		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Map<String, Integer>> list = new ArrayList<Map<String, Integer>>();
		Map<String, Integer> item = null;
		
		try {
			String typeProblem = "";
			conn.setAutoCommit(false);
			
			stmt = conn.prepareStatement(getEdCourseTree);
			stmt.setInt(1, courseno);
			rs = stmt.executeQuery();
			
			int frameCnt = 0;
			while (rs.next()) {
				item = new HashMap<String, Integer>();
				String tmp = String.valueOf(readPageCount(contentsPath + rs.getString("FILE_PATH")));

				if(tmp.equals("")){//index.html 파일에 loadPage()의 값이 숫자가 아닐 경우 자동등록 불가(개별등록해야함)
					typeProblem = "Y";
				} else {
					item.put("treeno", rs.getInt("TREENO"));
					frameCnt = Integer.valueOf(readPageCount(contentsPath + rs.getString("FILE_PATH")));
					item.put("framecnt", frameCnt);
					list.add(item);
				}
				
			}
			
			stmt.close();
			stmt = null;
			
			for (int i=0,max=list.size(); i<max; i++) {
				if(list.get(i).get("framecnt") != null) {
					stmt = conn.prepareStatement(upEdCourseTreeFrmCnt);
					stmt.setInt(1, list.get(i).get("framecnt"));
					stmt.setInt(2, list.get(i).get("treeno"));
					stmt.execute();
					stmt.close();
					stmt = null;
				}
			}
			
			if(!typeProblem.equals("")) {
				return false;
			} else {
				conn.commit();
				return true;
			}
		} catch (FileNotFoundException e) {
			conn.rollback();
			
			return false;
		} catch (Exception e) {
			conn.rollback();
			
			return false;
		} finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
	}
	
	public static String readPageCount(String filePath) throws Exception {
		String result = "";
		
		BufferedReader br = null;
		try {
			
			br = new BufferedReader(new FileReader(filePath));
			String line = null;
			while ((line = br.readLine()) != null) {
				Matcher m = p.matcher(line);
				if (m.find()) {
					result = m.group(1);
					break;
				}
			}
			
		} finally {
			if (br != null) br.close();
		}
		
		return result;
	}
	
	public static void main(String[] args) throws Exception {
		
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(SangsProperties.getProperty("Globals.DriverClassName"));
		ds.setUrl(SangsProperties.getProperty("Globals.Url"));
		ds.setUsername(SangsProperties.getProperty("Globals.UserName"));
		ds.setPassword(SangsProperties.getProperty("Globals.Password"));
		
		//ds.setUrl("jdbc:cubrid:192.168.20.98:30000:hmredu:::?charset=UTF-8");
		//ds.setUsername("dba");
		//ds.setPassword("hmredu#1234");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			/*conn = ds.getConnection();

			//pageCntParse(conn, tmpContentsPath, 5);
			List<Map<String, Object>> xmlParseList = LcmsParser.parse("d:/tmp/imsmanifest.xml", null);
			if (xmlParseList != null && xmlParseList.size() > 0) {
				int courseno = 26;
				if (insertLCMSDB(conn, xmlParseList, courseno)) {
					conn = ds.getConnection();
					insertEdCourseTreeDB(conn, xmlParseList, courseno);
				}
			}*/
			
		} catch (Exception e) {
			
		} finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
		
		
	}
}

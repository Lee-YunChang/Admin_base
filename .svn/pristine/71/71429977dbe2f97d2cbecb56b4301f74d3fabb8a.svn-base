package com.sangs.support;

import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @제목 EduMap
 * @설명 데이터맵과 성향은 같으나 좀더 가볍게 제작하여
 * 		ibatis에서 db값을 추출시 List등 객체에 담기위한 클래스.
 * @작성자 송종훈
 * @마지막날짜 2010.11.22
 */
public class EduMap extends LinkedHashMap {
	private Log log = LogFactory.getLog(this.getClass());
	private String name;
	
	public EduMap() {
		
	}
	
	public EduMap(String s) {
		name = s;
	}
	
	public EduMap(Map map){
		super(map);
	}
	
	public Object get(Object key) {
		Object result = super.get(key);
		return result;
	}
	
	public int getInt(Object key) {
		if(key == null){
			return 0;
		}else{
		
			if(super.get(key.toString()) == null){
				
				return 0;
				
			} else {
				
				Class class1 = key.getClass();
				if (class1 == java.lang.Integer.class)
					return ((Integer) super.get(key.toString())).intValue();
				if (class1 == java.lang.Short.class)
					return ((Short) super.get(key.toString())).shortValue();
				if (class1 == java.lang.String.class) {
					try {
						return Integer.parseInt(super.get(key.toString()).toString());
					} catch (Exception exception) {
						
						throw new RuntimeException(
								"[Exception in EduMap] Value Type(int) does not match : It's type is not int.");
					}
				} else {
					throw new RuntimeException(
							"[Exception in EduMap] Value Type(int) does not match : It's type is not int..");
				}	
			}
		}
		
	}
	
	public float getFloat(Object key) {
		
		String val = "";
		if (key == null || key.toString().equals("")){
				return 0.0F;
		} else {
			if(super.get(key.toString()) == null){
				return 0.0F;
			}else{
				val = (super.get(key.toString())).toString();
				return new Float(val).floatValue();
				
				/*
				Class class1 = key.getClass();
				if (class1 == java.lang.Float.class){
					val = super.get(key);
					return (Float)super.get(key)
				}else if (class1 == java.lang.String.class) {
					try { 
						val = (String)super.get(key.toString());
						return new Float(val).floatValue();
					} catch (Exception exception) {
						throw new RuntimeException(
						"[Exception in DataMap] Value Type(float) does not match : It's type is not float.");
					}
					
				} else {
					throw new RuntimeException(
							"[Exception in DataMap] Value Type(float) does not match : It's type is not float.");
				}
				*/
			}
		}

	}
	
	public double getDouble(Object key) { 
		if (key == null || key.toString().equals("")){
			return 0.0D;
		} else {
			
			if(super.get(key.toString()) == null){
				return 0.0D;
			}else{
				Class class1 = key.getClass();
				if (class1 == java.lang.Double.class)
					return ((Double) key).doubleValue();
				if (class1 == java.lang.Float.class)
					return (double) ((Float) key).floatValue();
				if (class1 == java.lang.Integer.class)
					return (double) ((Integer) key).intValue();
				if (class1 == java.lang.Long.class)
					return (double) ((Long) key).longValue();
				if (class1 == java.lang.String.class) {
					try {
						return Double.parseDouble(key.toString());
					} catch (Exception exception) {
						throw new RuntimeException(
						"[Exception in DataMap] Value Type(double) does not match : It's type is not double.");
					}
				} else {
					throw new RuntimeException(
							"[Exception in DataMap] Value Type(double) does not match : It's type is not double.");
				}
			}
		}
	}
	
	public boolean getBoolean(Object key) {
		
		Boolean bar = true;
		
		if (key == null) {
				return false;
		} else {
			if(super.get(key.toString()) == null){
				return false;
			}else{
				if (key.getClass().isInstance(bar))
					return ((Boolean) key).booleanValue();
				if (key.getClass().isInstance("")) {
					try {
						return Boolean.getBoolean(key.toString());
					} catch (Exception exception) {
						throw new RuntimeException(
						"[Exception in DataMap] Value Type(boolean) does not match : It's type is not boolean.");
					}
				} else {
					throw new RuntimeException(
							"[Exception in DataMap] Value Type(boolean) does not match : It's type is not boolean.");
				}
			}
		}
	}
	
	public String getString(Object key) {

		if (key != null) {
			if(super.get(key.toString()) == null){
				return "";
			}else{
				return replaceXss((String)super.get(key.toString()));
			}
		} else {
			return "";
		}
	}
	
	public String replaceXss(String str) {
		String rtnVal = "";
		
		rtnVal = str.replaceAll("<", "&lt;");
		rtnVal = rtnVal.replaceAll(">", "&gt;");
		
		return rtnVal;
		
	}

	public Set entrySet() {
		return null;
	}
	@Override
	public void clear() {
		super.clear();
		clear();
	}
	@Override
	public boolean containsKey(Object key) {
		super.containsKey(key);
		return containsKey(key);
		
	}
	@Override
	public boolean containsValue(Object value) {
		super.containsValue(value);
		return containsValue(value);
		
	}
	@Override
	public boolean isEmpty() {
		super.isEmpty();
		return isEmpty();
	}
	@Override
	public Set keySet() {
		super.keySet();
		return keySet();
	}

	public Object put(Object key, Object value) {
		return super.put(key, value);
	}
	@Override
	public void putAll(Map t) {
		super.putAll(t);
		putAll(t);
	}
	@Override
	public Object remove(Object key) {
		super.remove(key);
		return remove(key);
	}
	@Override
	public int size() {
		super.size();
		return size();
	}
	@Override
	public Collection values() {
		super.values();
		return values();
	}
	
	public synchronized String toString() {
		
		int i = super.size() - 1;
		StringBuffer stringbuffer = new StringBuffer();
		Set set = super.entrySet();
		Iterator iterator = set.iterator();
		stringbuffer.append("{");
		for (int j = 0; j <= i; j++) {
			Object obj = iterator.next();
			if (obj == null)
				stringbuffer.append("");
			else
				stringbuffer.append(obj.toString());
			if (j < i)
				stringbuffer.append(", ");
		}

		stringbuffer.append("}");
		
		return "EduMap[" + name + "]=" + stringbuffer.toString();
		
		
	}
		
	@Override
	public boolean equals(Object o){
		//super.equals(o);
		//return equals(o);
		boolean equals; // = super.equals(o);
		if(o != null) {
			int i1 = this.hashcode();
			int i2 = ((EduMap) o).hashcode();
			if(i1 == i2) { equals = super.equals(o); }
			else { equals = false; }
		 }else {
			 equals = false;
		 }
		return equals;
	}
	
	public int hashcode(){
		return super.hashCode();
	}
	
}

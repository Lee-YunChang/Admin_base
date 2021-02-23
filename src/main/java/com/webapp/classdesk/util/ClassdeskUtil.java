package com.webapp.classdesk.util;

import java.util.LinkedList;
import java.util.Random;

public class ClassdeskUtil {

	/**
	 * 클래스데스크 - 시험 > 세트방식 랜덤 난수 구하기
	 * @param total
	 * @param rStartNum
	 * @param rEndNum
	 * @return
	 */
	public static int[] getExamSetRandomList(int total, int rStartNum, int rEndNum) {
		LinkedList<Integer> list = new LinkedList<Integer>();
		
		for(int i = rStartNum; i < rEndNum; ++i){
			list.addLast(i);   // 1~100까지의 값을 집어 넣음
		}

		Random random = new Random();
		
		int[] intVAl = new int[total];
		
		int zindex = 0;
		for(int i = list.size(); i > 0; i--){
			int index = random.nextInt(i);      //현재 list 길이 만큼의 숫자에서 랜덤 숫자 뽑아냄
			int random_number = (Integer)list.get(index);  //랜덤 값이 나온 값을 리스트에서 뽑아냄 (결국 랜덤으로 나온 값을 뽑아내는것과 같음
			
			intVAl[zindex] = random_number;
			zindex++;
			list.remove(index);       //뽑아낸 리스트 제거           
		}
		
		return intVAl;
		
	}
	
	
	
	
}

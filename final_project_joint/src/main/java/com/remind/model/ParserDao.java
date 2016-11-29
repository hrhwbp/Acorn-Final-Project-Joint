package com.remind.model;

import org.springframework.stereotype.Component;

import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.util.ArrayList;

import java.net.URL;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

@Component
public class ParserDao implements ParserDaoInter {

   public ArrayList<ParserDto> getData(String bean) {
      ArrayList<ParserDto> list = new ArrayList<ParserDto>();
      
      try {
         ParserDto dto = new ParserDto();
         
         //URL입력 후 Web-source 가져오기
         Document doc = Jsoup.connect(bean).get();						
         //상품 제목 가져오기
         Elements titleelem = doc.select("title");
         
         //가격 가져오기
         Elements priceelem = doc.select("[itemprop*=price]");			
         Elements priceelem2 = doc.select("[class*=price]");          	
         
         //이미지 경로 가져오기
         Elements imageelem3 = doc.select("[class*=Img] [src$=jpg]");   
         Elements imageelem = doc.select("[id*=Image] [src$=jpg]");
         Elements imageelem2 = doc.select("[id*=img] [src$=jpg]");
         
         Element irum = null;
         Element cost = null;
         Element image = null;
         
         //상품명 Parsing   
         if( !titleelem.get(0).attr("title").toString().equals(null)){
            irum = titleelem.get(0);
            if(irum.text().length() > 20){								//상품명 길이 자르기
               dto.setName(irum.text().substring(0, 30));				//dto에 넣기
            }else{
               dto.setName(irum.text());
            }
         }
         
         //상품 가격 Parsing
         if(priceelem.size() > 0){										
            for (int j = 0; j < priceelem.size(); j++) {
               if((!priceelem.get(j).attr("class").toString().equals(null) || !priceelem.get(j).equals(null))){
                  cost = priceelem.get(j);
                  if(dto.getPrice()==null){
                     System.out.println("없음");
                     System.out.println(cost.text());
                     dto.setPrice(cost.text());   
                  }else{
                     System.out.println("있음");
                  }
               }
            }
         }else if(priceelem2.size() > 0){
            for (int j = 0; j < priceelem2.size(); j++) {
               if((!priceelem2.get(j).attr("class").toString().equals(null) || !priceelem2.get(j).equals(null))){
                  cost = priceelem2.get(j);
                  if(dto.getPrice()==null){
                     dto.setPrice(cost.text());   
                  }else{
                     System.out.println("있음");
                  }
               }
            }
         }

         //상품 이미지 주소 Parsing
         if(imageelem3.size() > 0){
            for (int i = 0; i < imageelem3.size(); i++) {
               if( !imageelem3.get(i).attr("id").toString().equals(null) || !imageelem3.get(i).equals(null)){
                  image = imageelem3.get(i);
                  if(dto.getImage()==null){
                     dto.setImage(imageelem3.get(i).attr("src").toString());
                  }else{
                     System.out.println("이미지 있음");
                  }
               }
            }
         }else if(imageelem.size() > 0) {
            for (int i = 0; i < imageelem.size(); i++) {
               if( !imageelem.get(i).attr("id").toString().equals(null) || !imageelem.get(i).equals(null)){
                  image = imageelem.get(i);
                  if(dto.getImage()==null){
                     dto.setImage(imageelem.get(i).attr("src").toString());
                  }else{
                     System.out.println("이미지 있음");
                  }
               }
            }
         }else if(imageelem2.size() > 0) {
            for (int i = 0; i < imageelem2.size(); i++) {
               if( !imageelem2.get(i).attr("id").toString().equals(null) || !imageelem2.get(i).equals(null)){
                  image = imageelem2.get(i);
                  if(dto.getImage()==null){                    
                     dto.setImage(imageelem2.get(i).attr("src").toString());
                  }else{
                     System.out.println("이미지 있음");
                  }
               }
            }
         }
         list.add(dto);
      } catch (Exception e) {
         System.out.println("에러당 : " + e);
      }
      return list;
   }

}
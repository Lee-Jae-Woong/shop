package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.ReviewDTO;
import com.spring.dto.user.LoginUserDTO;
import com.spring.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Resource(name="loginUserBean")
	private LoginUserDTO loginUserBean;
	
	@RequestMapping(value="/review")
	public String load(MultipartHttpServletRequest mtfRequest,RedirectAttributes redirect) {
		
		
		List<MultipartFile> fileList = mtfRequest.getFiles("filenames");
		
		String userId = loginUserBean.getId();
		String gdsNum = mtfRequest.getParameter("gdsNum");
		String content = mtfRequest.getParameter("content");
		int score = Integer.parseInt(mtfRequest.getParameter("score"));
		String files = "";

		
		String path = "C:\\image\\"+gdsNum+"\\";
		
		/*경로 확인해보기
			String path_test = "/";
			String realPathtoUploads =  mtfRequest.getServletContext().getRealPath(path_test);
			System.out.println("realPathtoUploads : " + realPathtoUploads);
		*/
		
		if(! new File(path).exists()) {
			
			new File(path).mkdir(); 
			
		}
		
		if(!fileList.get(0).isEmpty()){
			/*
			for (MultipartFile mf : fileList) {
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				long fileSize = mf.getSize();
			
			// 파일 사이즈에 관한 처리 해주기
			  if(fileSize>) {
			  
			  }
			 
				
			String saveFileName = System.currentTimeMillis() + originFileName;
			String realFileName = path + saveFileName;
		
    
            try {
                mf.transferTo(new File(realFileName));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                
                e.printStackTrace();
            }
            	
            	files = files + saveFileName+",";
            
        	}
			
			*/
			
			for(Iterator<MultipartFile> i = fileList.iterator(); i.hasNext();) {
				
				MultipartFile mf = i.next();
				
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				long fileSize = mf.getSize();
				String saveFileName = System.currentTimeMillis() + originFileName;
				String realFileName = path + saveFileName;
				
				try {
					mf.transferTo(new File(realFileName));
	            } catch (IllegalStateException e) {
	                e.printStackTrace();
	            } catch (IOException e) {
	                
	                e.printStackTrace();
	            }
	            	
	            	files = files + saveFileName;
	            	if(i.hasNext()) {
	            		files += ",";
	            	}
	            
	        	}
			
			
		}
		
		
		ReviewDTO rvDTO = new ReviewDTO(Long.parseLong(gdsNum),userId,content,files,score);
		
		reviewService.addReview(rvDTO);
		
		redirect.addAttribute("gds", gdsNum);        
		 
        return "redirect:/shop";
	

		
		
		
	}
 
}

package com.comFirstPage.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comFirstPage.model.*;


public class ShowProdsImage extends HttpServlet {
	private static final long serialVersionUID = 1L;   
    
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    ServletOutputStream sos = null;
	    
		int comID = Integer.parseInt(req.getParameter("comID"));
		ProductsService prodService = new ProductsService();
		List<ProductVO> prodVOs = new ArrayList<ProductVO>();
		prodVOs = prodService.getProdsByComId(comID);
		ProductVO prodVO = prodVOs.get(0); //第一個元素從0開始 <.size()
		
		// 檢查是否已有商家圖片
		if (prodVO.getProdSubPic1() != null) {
			res.setContentType("image/jpg");
			try {
				sos = res.getOutputStream();
				sos.write(prodVO.getProdSubPic1());
				sos.flush();
				sos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		else {
			res.setContentType("image/jpg");
			// 預設商家圖片
			File file = new File(getServletContext().getRealPath("/img/ComDefaultPic.jpg"));
			System.out.println(file.exists());
			byte[] comPic = new byte[(int) file.length()];
			try {
				BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
				in.read(comPic);
				sos = res.getOutputStream();
				sos.write(comPic);
				sos.flush();
				sos.close();
				in.close();
			} catch(Exception e) {
		        e.printStackTrace();
			}
		}
	} // end doGet()
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
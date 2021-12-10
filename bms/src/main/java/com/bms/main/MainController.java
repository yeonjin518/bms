package com.bms.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bms.common.util.CommonUtil;
import com.bms.goods.dto.GoodsDto;
import com.bms.goods.service.GoodsService;

@Controller
@EnableAspectJAutoProxy
public class MainController {
	
	@Autowired
	private GoodsService goodsService;

	@RequestMapping(value= "/" , method = RequestMethod.GET)
	public ModelAndView home() throws Exception{
		return new ModelAndView("redirect:/main/main.do");
	}
	
	
	@RequestMapping(value= "/main/main.do" , method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/main");
		
		HttpSession session = request.getSession();
		session.setAttribute("sideMenu", "user");
		
		List<Map<String, Object>> bestseller   = goodsService.listGoods("bestseller");
		List<Map<String, Object>> newbook      = goodsService.listGoods("newbook");
		List<Map<String, Object>> steadyseller = goodsService.listGoods("steadyseller");
		
		mv.addObject("bestseller" , bestseller);
		mv.addObject("newbook" , newbook);
		mv.addObject("steadyseller" , steadyseller);
		
		return mv;
		
	}
	
}

package com.project.Hospital.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.Hospital.DAO.DoctorsDAO;
import com.project.Hospital.DAO.LoginDAO;
import com.project.Hospital.model.Login;
import com.project.Hospital.model.LoginCheckSite;

@Controller
public class LoginController {

	@Autowired
	DoctorsDAO doctorDao;
	@Autowired
	LoginDAO loginDao;
	List<Login> loginList;
	Map<String, Login> usernameMap;

	/**
	 * 
	 * @param site
	 * @return ModelAndView mv
	 * Redirects the home page to the login page. This will take argument site which is the site we need to redirect after successful login.
	 */
	@RequestMapping("/login")
	public ModelAndView login(LoginCheckSite site) {
		refreshLoginList();
		ModelAndView mv = new ModelAndView("loginPage.jsp");
		mv.addObject("site", site);
		return mv;
	}
	
	/**
	 * 
	 * @param login
	 * @return ModelAndView mv
	 * 
	 * This will take Login object as a argument which contains username, password and sitename and 
	 * compares them with those in the database. 
	 * If successful it will redirect to specific portal or else it will display the login page again.
	 */

	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck(Login login) {
		System.out.println(login);
		Iterator<String> itr = usernameMap.keySet().iterator();
		
        while (itr.hasNext()) {
            System.out.println(itr.next());
        }
		
		if (usernameMap.containsKey(login.getUsername())) {
			if (usernameMap.get(login.getUsername()).getPassword().equals(login.getPassword())
					&& usernameMap.get(login.getUsername()).getSiteName().equals(login.getSiteName())) {
				System.out.println("login successful");
				ModelAndView mv = new ModelAndView(login.getSiteName());
				mv.addObject("login", login);
				mv.addObject("username", login.getUsername());
				return mv;
			} else {
				
				System.out.println("not successful");
				ModelAndView mv = new ModelAndView("loginPage.jsp");
				return mv;
			}
		} else {
			System.out.println("not successful");
			ModelAndView mv = new ModelAndView("loginPage.jsp");
			return mv;
		}
	}
	
	
	/**
	 * This will refresh the login list and add all the login details in a arraylist and this method is passed to login.
	 */
	private synchronized void refreshLoginList() {
		if (loginList == null) {
			loginList = new ArrayList<Login>();
		}
		if (usernameMap == null) {
			usernameMap = new HashMap<String, Login>();
		}
		loginList.clear();
		usernameMap.clear();
		loginList = loginDao.findAll();
		for (Login l : loginList) {
			usernameMap.put(l.getUsername(), l);
		}
	}

	/**
	 * 
	 * @param username
	 * @return ModelAndView mv
	 * This will redirect the page to specific portal the user needs to visit.
	 */
	@RequestMapping("/Portal")
	public ModelAndView doctorPortal(String username) {
		Login login = loginDao.findByUsername(username);
		ModelAndView mv = new ModelAndView(login.getSiteName());
		mv.addObject("login", login);
		mv.addObject("username", login.getUsername());
		return mv;
	}
	
}

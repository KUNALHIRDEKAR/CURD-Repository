package com.example.controller;

import java.beans.Beans;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.omg.CORBA.UserException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.constant.AppConstant;
import com.example.dto.User;
import com.example.properties.AppProperties;
import com.example.repository.CurdRepository;
import com.example.utility.UserUtility;

@Controller
public class CrudRepositoryController {
	@Autowired
	CurdRepository dao;

	@RequestMapping("/getPage")
	public String getpage(Model model) {
		User user = new User();
		model.addAttribute("user", user);

		return AppConstant.VIEW_PAGE;
	}

	@RequestMapping(value = "/pageReg", method = RequestMethod.POST)
	public String getUserDetails(@ModelAttribute("user") User user, Model model) {
		// AppProperties ap=new AppProperties();
		UserUtility userUtility = new UserUtility();
		BeanUtils.copyProperties(user, userUtility);
		dao.save(userUtility);
		model.addAttribute("msg", "Registration Success");

		return AppConstant.VIEW_PAGE;
	}
 
	@RequestMapping("/getDetails")
	public String getDetails(Model model) {

		Iterable<UserUtility> userList = dao.findAll();
		// UserUtility utility=new UserUtility();
		List<User> list = new ArrayList();

		// BeanUtils.copyProperties(userList, list) ;
		for (UserUtility utility : userList) {
			User user = new User();
			BeanUtils.copyProperties(utility, user);
			list.add(user);

			model.addAttribute(AppConstant.ALL_USER_LIST, list);
		}
		return AppConstant.DISPLAY_ALL_USER_LIST;
	}
	@RequestMapping("/getDetails2")
	public String getDetails2(Model model,@RequestParam("pn") Integer currPageNo) {

		Integer pagesize=3;
		
		PageRequest pageRequest =PageRequest.of(currPageNo-1, pagesize);
		Page<UserUtility> page= dao.findAll(pageRequest);
		List<UserUtility> userList= page.getContent();
		// UserUtility utility=new UserUtility();
		List<User> list = new ArrayList();
		int totalPages=page.getTotalPages();
		model.addAttribute("tp",totalPages);
		model.addAttribute("cp",currPageNo);
		// BeanUtils.copyProperties(userList, list);
		for (UserUtility utility : userList) {
			User user = new User();
			BeanUtils.copyProperties(utility, user);
			list.add(user);

			model.addAttribute(AppConstant.ALL_USER_LIST, list);
		}
		return AppConstant.DISPLAY_ALL_USER_LIST;
	}



	@RequestMapping(value = "/editUser")
	public String editUser(Model model, @RequestParam("uid") Integer uid) {
		Optional<UserUtility> optEtity = dao.findById(uid);
		if (optEtity.isPresent()) {
			UserUtility utility = optEtity.get();
			User user = new User();
			BeanUtils.copyProperties(utility, user);
			model.addAttribute("user", user);
		}
		return AppConstant.EDIT_PAGE;
	}

	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public String editUser(@ModelAttribute("user") User user, Model model, @RequestParam("uid") Integer uid) {
		UserUtility utility = new UserUtility();
		BeanUtils.copyProperties(user, utility);
		utility.setUid(uid);
		dao.save(utility);
		
		model.addAttribute(AppConstant.UPDATE_USER, "User SuccessFully Updated");
		return AppConstant.EDIT_PAGE;
	}

	@RequestMapping(value = "/deleteUser")
	public String deleteUser(Model model, @RequestParam("uid") Integer uid) {
		dao.deleteById(uid);
		return "redirect:/getDetails";
	}

}

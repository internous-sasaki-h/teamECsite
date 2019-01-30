package com.internousdev.gerbera.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.gerbera.dao.DestinationInfoDAO;
import com.internousdev.gerbera.dto.DestinationInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class SettlementConfirmAction extends ActionSupport implements SessionAware{


	private Map<String, Object> session;

	public String execute() {
		if(!session.containsKey("mCategoryList")) {
			return "sessionTimeOut";
		}
		String result = ERROR;

		if(session.containsKey("loginId")) {
			DestinationInfoDAO destinationInfoDAO = new DestinationInfoDAO();
			List<DestinationInfoDTO> destinationInfoDtoList = new ArrayList<>();
			destinationInfoDtoList = destinationInfoDAO.getDestinationInfo(String.valueOf(session.get("loginId")));
			Iterator<DestinationInfoDTO> iterator = destinationInfoDtoList.iterator();
			if(!(iterator.hasNext())) {
				destinationInfoDtoList = null;
			}
			session.put("destinationInfoDtoList", destinationInfoDtoList);
		}

		if(!session.containsKey("loginId")) {
			result = "goLogin";
		}else {
			result = SUCCESS;
		}
		return result;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
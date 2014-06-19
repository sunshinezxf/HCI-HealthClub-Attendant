package action;

import model.PageBean;
import service.AttendantService;

@SuppressWarnings("serial")
public class ShowMember extends BaseAction {
	private String a_id;
	private AttendantService attendantService;
	private String page = "0";

	public AttendantService getAttendantService() {
		return attendantService;
	}

	public void setAttendantService(AttendantService attendantService) {
		this.attendantService = attendantService;
	}

	public String execute() throws Exception {
		int cur = Integer.parseInt(page);
		PageBean pageBean = attendantService.getPageBean(2, cur);
		request.setAttribute("pageBean", pageBean);
		return "success";
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}
}

package action;

import java.util.ArrayList;

import model.Activity;
import model.record.ActivityRecord;
import service.AttendantService;

@SuppressWarnings("serial")
public class ConfirmAttend extends BaseAction {
	private String v_id;
	private String ac_id;
	private AttendantService attendantService;

	public AttendantService getAttendantService() {
		return attendantService;
	}

	public void setAttendantService(AttendantService attendantService) {
		this.attendantService = attendantService;
	}

	public String execute() throws Exception {
		int vip_id = Integer.parseInt(v_id);
		int activity_id = Integer.parseInt(ac_id);
		boolean status = attendantService.confirmAttend(vip_id, activity_id);
		if (status) {
			Activity activity = attendantService.viewActivity(Integer
					.parseInt(ac_id));
			request.setAttribute("activity", activity);
			ArrayList<ActivityRecord> records = attendantService
					.getRecord(Integer.parseInt(ac_id));
			request.setAttribute("record", records);
			return "success";
		}
		request.setAttribute("prompt",
				"Oops, something's wrong with your operation");
		return "failure";
	}

	public String getV_id() {
		return v_id;
	}

	public void setV_id(String v_id) {
		this.v_id = v_id;
	}

	public String getAc_id() {
		return ac_id;
	}

	public void setAc_id(String ac_id) {
		this.ac_id = ac_id;
	}

}

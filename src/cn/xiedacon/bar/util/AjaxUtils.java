package cn.xiedacon.bar.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONObject;

public class AjaxUtils {

	public static void send(Object obj){
		JSONObject jsonObject = JSONObject.fromObject(obj);
		sendJSON(jsonObject);
	}
	
	public static void sendMsg(String msg){
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("type", "fail");
		jsonObject.put("error", msg);
		sendJSON(jsonObject);
	}
	
	public static void sendJSON(JSONObject jsonObject){
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		try {
			ServletActionContext.getResponse().getWriter().print(jsonObject);
		} catch (IOException e) {
		}
	}
	
	public static void sendString(String str){
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		try {
			ServletActionContext.getResponse().getWriter().print(str);
		} catch (IOException e) {
		}
	}
	
	@SuppressWarnings("rawtypes")
	public static void sendList(String name,List list){
		Map<String, List> map = new HashMap<>();
		map.put(name, list);
		send(map);
	}
}

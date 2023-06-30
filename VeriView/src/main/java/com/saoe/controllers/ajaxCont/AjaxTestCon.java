package com.saoe.controllers.ajaxCont;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.saoe.model.search.SearchDAO;
import com.saoe.model.search.SearchDTO;

@WebServlet("/AjaxTestCon")
public class AjaxTestCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String searchWord = request.getParameter("searchWord");

		System.out.println(searchWord);
		if (searchWord.length() > 0) {

			SearchDAO dao = new SearchDAO();

			List<SearchDTO> searchList = dao.search("%" + searchWord + "%");
			
			for(SearchDTO search : searchList) {
				System.out.println(search.getRest_no() + search.getRest_name());
			}
			
			

			if (searchList.size() > 0) {

				JSONArray jarray = new JSONArray();
				for (SearchDTO search : searchList) {
					JSONObject json = new JSONObject();
					json.put("rest_no", search.getRest_no());
					json.put("rest_name", search.getRest_name());

					jarray.add(json);
				}

				response.setCharacterEncoding("utf-8");
				System.out.println(jarray.toJSONString());
				response.getWriter().print(jarray);
			}
		}

	}
}

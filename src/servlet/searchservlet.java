package servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import search_service.search_service;

/**
 * Servlet implementation class customerservlet
 */
//@WebServlet("/customerservlet")
public class searchservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private search_service service;

	public searchservlet() {
		service = new search_service();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProc(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProc(request, response);
	}

	protected void doProc(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		String contextPath = request.getContextPath();
		String reqUri = request.getRequestURI();

		if (reqUri.equals(contextPath + "/search_form.se")) {
			request.getRequestDispatcher("index.jsp?section=search_form.jsp").forward(request, response);

		}
		
		else if (reqUri.equals(contextPath + "/search_form_ok.se")) {
			String sort = request.getParameter("sort");
			String title = request.getParameter("title");
			String search_data = request.getParameter("search_data");
			String currentPage1 = request.getParameter("currentPage");
			if(sort.equals("Main_info")) {
			request.setAttribute("search_select_List",  service.search_select_ma_list(sort, title,search_data,currentPage1));
			request.setAttribute("search_select_State", service.search_select_ma_state(sort, title,search_data));
			
			request.getRequestDispatcher("index.jsp?section=select_list_main.jsp").forward(request, response);
			}
			else if(sort.equals("cus_info")) {
				request.setAttribute("search_select_List", service.search_select_cu(sort, title,search_data,currentPage1));
				
				request.getRequestDispatcher("index.jsp?section=select_list_cus.jsp").forward(request, response);
				}
		}
		
		


	}

}

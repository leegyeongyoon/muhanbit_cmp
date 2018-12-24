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

import Maintenance_service.Maintenance_service;



/**
 * Servlet implementation class customerservlet
 */
//@WebServlet("/customerservlet")
public class Maintenanceservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Maintenance_service service;

	public Maintenanceservlet() {
		service = new Maintenance_service();
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
		
	
		
		if (reqUri.equals(contextPath + "/mainten_insert.ma")) {
			String sort = request.getParameter("sort").trim();
			String type = request.getParameter("type").trim();
			String ca_title = request.getParameter("ca_title").trim();
			String com_name = request.getParameter("com_name").trim();
			String op = request.getParameter("op").trim();
			String content = request.getParameter("content").trim();
			String other = request.getParameter("other").trim();
			String go_date = request.getParameter("go_date").trim();
			

			if (service.Maintenance_insert(sort, type,ca_title,com_name,op,content,other,go_date)) {
				out.println("<script>alert('유지보수 등록 등록 성공'); location.href='Maintenance_list.ma'</script>");

			} else {
				out.println("<script>alert('유지보수 등록  실패'); location.href='Maintenance_insert_page.ma'</script>");

			}
		}
		else if (reqUri.equals(contextPath + "/Maintenance_insert_page.ma")) {
				
			request.getRequestDispatcher("index.jsp?section=Maintenance_insert.jsp").forward(request, response);

		}
		
		else if (reqUri.equals(contextPath + "/Maintenance_list.ma")) {
			
				 request.setAttribute("maintenanceList", service.getMaintenanceList());
				
			request.getRequestDispatcher("index.jsp?section=Maintenance_list.jsp").forward(request, response);

		}
		
		
	
	}
}

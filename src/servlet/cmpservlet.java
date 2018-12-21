package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import state_service.state_service;

/**
 * Servlet implementation class cmpservlet
 */
@WebServlet("/cmpservlet")
public class cmpservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private state_service service;

	public cmpservlet() {
		service = new state_service();
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

		if (reqUri.equals(contextPath + "/state_insert.do")) {
			String sort = request.getParameter("sort").trim();
			String title = request.getParameter("title").trim();
			System.out.println(sort + "  - " + title);

			if (service.state_insert(sort, title)) {
				out.println("<script>alert('등록 성공'); location.href='index.do'</script>");

			} else {
				out.println("<script>alert('등록 실패'); location.href='state_insert_page.do'</script>");

			}

		} else if (reqUri.equals(contextPath + "/state_insert_page.do")) {
			request.getRequestDispatcher("index.jsp?section=state_insert.jsp").forward(request, response);
		}

		else if (reqUri.equals(contextPath + "/test.do")) {
			String sort = request.getParameter("sort").trim();
			request.setAttribute("sortlist", service.sort_select(sort));
			request.getRequestDispatcher("sortlist_ajax.jsp").forward(request, response);

		}

		else if (reqUri.equals(contextPath + "/state_delete.do")) {
			String sort = request.getParameter("sort").trim();
			request.setAttribute("sortlist", service.sort_select(sort));
			request.getRequestDispatcher("sortlist_ajax.jsp").forward(request, response);

		} else if (reqUri.equals(contextPath + "/state_delete_ok.do")) {
			String sort = request.getParameter("sort");
			String title = request.getParameter("title");
			if (service.state_delete(sort, title)) {
				out.println("<script>alert('삭제 성공'); location.href='index.do'</script>");

			} else {
				out.println("<script>alert('삭제 실패'); location.href='state_delete.do'</script>");

			}
			
		}
		else if (reqUri.equals(contextPath + "/state_delete_page.do")) {
			request.getRequestDispatcher("index.jsp?section=state_delete.jsp").forward(request, response);
		}
		

		else if (reqUri.equals(contextPath + "/LoginForm.do")) {
			request.getRequestDispatcher("LoginResult.jsp").forward(request, response);
		}

		else if (reqUri.equals(contextPath + "/index.do")) {

			request.getRequestDispatcher("index.jsp").forward(request, response);

		}
		/*
		 * else if (reqUri.equals(contextPath + "/Join.do")) { String id =
		 * request.getParameter("id"); String password =
		 * request.getParameter("password"); String name = request.getParameter("name");
		 * String email = request.getParameter("email"); String birth =
		 * request.getParameter("birth"); String address =
		 * request.getParameter("address"); String phone =
		 * request.getParameter("phone");
		 * 
		 * if(service.join(id, password, name, email, birth, address, phone)) { out.
		 * println("<script>alert('회원가입 완료'); location.href='LoginForm.jsp'</script>");
		 * 
		 * } else { out.
		 * println("<script>alert('회원가입  실패'); location.href='JoinForm.jsp'</script>");
		 * 
		 * }
		 * 
		 * }
		 */

		else if (reqUri.equals(contextPath + "/MemberList.do")) {

			request.getRequestDispatcher("MemberList.jsp").forward(request, response);

		}
	}
}

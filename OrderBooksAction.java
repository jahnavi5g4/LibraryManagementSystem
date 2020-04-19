

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderBooksAction
 */
@WebServlet("/OrderBooksAction")
public class OrderBooksAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderBooksAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String bid = request.getParameter("bid");
		String bname = request.getParameter("bname");
		String sid = request.getParameter("sid");
		String sname = request.getParameter("sname");
		String issdate = request.getParameter("issdate");
		String retdate = request.getParameter("retdate");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/svecw","root","");
			PreparedStatement ps1 = con.prepareStatement("select * from book where bookid = '"+bid+"' and bookname = '"+bname+"'");
			ResultSet rs = ps1.executeQuery();
			if (rs.next()){
				PreparedStatement ps = con.prepareStatement("insert into booksissued values(' " +bid+ " ',' " +bname+ " ' , ' "+sid+" ', ' "+sname+" ', ' " +issdate+ " ',' "+retdate+" ','not issued')");
				int i = ps.executeUpdate();
				if (i > 0){
					response.sendRedirect("success.html");
				}
				else{
					response.sendRedirect("failure.html");
				}
			}
			else{
				response.sendRedirect("failure.html");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

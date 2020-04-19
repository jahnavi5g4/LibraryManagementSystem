

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
 * Servlet implementation class addbooksAction
 */
@WebServlet("/addbooksAction")
public class addbooksAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addbooksAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		String book = request.getParameter("book");
		String price = request.getParameter("price");
		int qnt = Integer.parseInt(request.getParameter("qnt"));
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/svecw","root","");
			PreparedStatement ps1 = con.prepareStatement("select * from book where bookid = '"+bid+"'");
			ResultSet rs = ps1.executeQuery();
			if (rs.next()){
				int qnty = rs.getInt("quantity");
				if (qnty >= 1){
					PreparedStatement ps2 = con.prepareStatement("update book set quantity = '"+(qnty+qnt)+"' where bookid = '"+bid+"'");
					int j = ps2.executeUpdate();
					if (j > 0){
						System.out.println("SUCCESS");
						response.sendRedirect("ViewBooksAction.jsp");
					}
					else{
						response.sendRedirect("failure.html");
					}
				}
			}
			else{
				PreparedStatement ps = con.prepareStatement("insert into book(bookid,bookname,price,quantity)values('"+bid+"','"+book+"','"+price+"','"+qnt+"')");
				int i = ps.executeUpdate();
				if (i > 0){
					response.sendRedirect("ViewBooksAction.jsp");
				}
				else{
					response.sendRedirect("failure.html");
				}
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

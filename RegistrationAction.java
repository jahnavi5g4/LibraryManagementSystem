

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class RegistrationAction
 */
@WebServlet("/RegistrationAction")
public class RegistrationAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String rno = request.getParameter("rollno");
		String un = request.getParameter("name");
		String pw = request.getParameter("password");
		String mo = request.getParameter("mobile");
		String em = request.getParameter("email");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/svecw","root","");
			PreparedStatement ps = con.prepareStatement("insert into student values(' " +rno+ " ',' " +un+ " ' ,' " +pw+ " ',' " +mo+ " ',' " +em+ " ')");
			int i = ps.executeUpdate();
			if(i>0)
				response.sendRedirect("User1.html");
			else
				response.sendRedirect("register.html");
  
		} catch (Exception e) {
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

package gifts;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SignInServlet")
public class Signin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/giftsgalore", "root", "1234");

            PreparedStatement pst = connection.prepareStatement("SELECT * FROM users1 WHERE email = ? AND password = ?");
            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("user", email);
                response.sendRedirect("homepage.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid credentials. <a href='signup.jsp'>Sign up here</a>");
                RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
                rd.forward(request, response);
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Sign in failed due to an internal error. Try again.");
        }
    }
}

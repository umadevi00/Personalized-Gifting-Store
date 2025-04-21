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

@WebServlet("/SignUpServlet")
public class Signup extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/giftsgalore", "root", "1234");

            // Check if the user already exists
            PreparedStatement checkUserPst = connection.prepareStatement("SELECT * FROM users1 WHERE email = ?");
            checkUserPst.setString(1, email);
            ResultSet rs = checkUserPst.executeQuery();

            if (rs.next()) {
                // User already exists
                request.setAttribute("errorMessage", "User already exists. Try again with a different email.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
                dispatcher.forward(request, response);
            } else {
                // Insert new user
                PreparedStatement insertUserPst = connection.prepareStatement("INSERT INTO users1 (email, password) VALUES (?, ?)");
                insertUserPst.setString(1, email);
                insertUserPst.setString(2, password);

                int row = insertUserPst.executeUpdate();
                if (row > 0) {
                    response.sendRedirect("signin.jsp");
                } else {
                    request.setAttribute("errorMessage", "Sign up failed. Try again.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
                    dispatcher.forward(request, response);
                }
            }

            // Close connections
            rs.close();
            checkUserPst.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Sign up failed due to an internal error. Try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
            dispatcher.forward(request, response);
        }
    }
}

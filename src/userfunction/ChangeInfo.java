package userfunction;

import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ChangeInfo")
public class ChangeInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String user_username = request.getParameter("user_username");
        String user_password = request.getParameter("user_password");
        String user_phoneNumber = request.getParameter("user_phoneNumber");
        JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
        String sql = "update `user` set `user_password` = ? , `user_phoneNumber` = ? where `user_username` = ?";
        jdbcTemplate.update(sql, user_password, user_phoneNumber, user_username);
        HttpSession session = request.getSession();
        session.setAttribute("user_password", user_password);
        session.setAttribute("user_phoneNumber", user_phoneNumber);
        request.getRequestDispatcher("myInfo.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

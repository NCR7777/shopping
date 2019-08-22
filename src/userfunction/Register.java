package userfunction;

import domain.User;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Register")
public class Register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String user_username = request.getParameter("user_username");
        String user_password = request.getParameter("user_password");
        String user_nickname = request.getParameter("user_nickname");
        String user_phoneNumber = request.getParameter("user_phoneNumber");
        String user_sex = request.getParameter("user_sex");
        if ("male".equals(user_sex)) {
            user_sex = "男";
        } else {
            user_sex = "女";
        }
        String sql = "INSERT into `user` VALUES(null,?,?,?,?,?)";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
        jdbcTemplate.update(sql, user_username, user_password, user_nickname, user_phoneNumber, user_sex);
        HttpSession session = request.getSession();
        session.setAttribute("user_username", user_username);
        session.setAttribute("user_password", user_password);
        session.setAttribute("user_nickname", user_nickname);
        session.setAttribute("user_phoneNumber", user_phoneNumber);
        session.setAttribute("user_sex", user_sex);
        session.setMaxInactiveInterval(60 * 60);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

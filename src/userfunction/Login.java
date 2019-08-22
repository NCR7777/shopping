package userfunction;

import domain.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/Login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String user_username = request.getParameter("user_username");
        String user_password = request.getParameter("user_password");
        HttpSession session = request.getSession();
        JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
        String sql = "select * from `user` where `user_username` = ? and `user_password` = ?";
        List<User> list = jdbcTemplate.query(sql, new Object[]{user_username, user_password}, new BeanPropertyRowMapper<User>(User.class));
        for (User user : list) {
            session.setAttribute("user_id", user.getUser_id());
            session.setAttribute("user_username", user.getUser_username());
            session.setAttribute("user_password", user.getUser_password());
            session.setAttribute("user_nickname", user.getUser_nickname());
            session.setAttribute("user_phoneNumber", user.getUser_phoneNumber());
            session.setAttribute("user_sex", user.getUser_sex());
        }
        session.setMaxInactiveInterval(60 * 60);
        if (session.getAttribute("user_username") != null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("loginFailed.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

package goods;

import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/OrderPay")
public class OrderPay extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String user_address = request.getParameter("user_address");
        String pay_channel = request.getParameter("pay_channel");
        String paid = "已支付";
        String order_id = request.getParameter("order_id");
        JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
        String sql = "UPDATE `order` SET `user_address` = ? , pay_channel = ? , `order_status` = ? WHERE `order_id` = ?";
        jdbcTemplate.update(sql, user_address, pay_channel, paid, order_id);
        request.getSession().setAttribute("order",null);
        response.sendRedirect("myOrder.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

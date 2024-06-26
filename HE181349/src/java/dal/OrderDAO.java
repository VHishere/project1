/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Orders;
/**
 *
 * @author vh69
 */
public class OrderDAO extends DBContext {
    public List<Orders> getAllOrder() {
        String sql = "SELECT * FROM Orders";
        List<Orders> listOrder = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Orders order = new Orders();
                order.setOrderID(rs.getInt("orderID"));
                order.setAccountID(rs.getInt("accountID"));
                order.setOrderDate(rs.getDate("orderDate"));
                order.setAddress(rs.getString("address"));
                order.setTotalPrice(rs.getInt("totalPrice"));
                order.setStatus(rs.getInt("status"));
                listOrder.add(order);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listOrder;
    }
    public int insertOrder(Orders order) {
        String sql = "INSERT INTO Orders VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, order.getAccountID());
            ps.setDate(2, order.getOrderDate());
            ps.setString(3, order.getAddress());
            ps.setInt(4, order.getTotalPrice());
            ps.setInt(5, order.getStatus());
            ps.executeUpdate();
            String sql2 = "SELECT MAX(orderID) AS orderID FROM Orders";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ResultSet rs = ps2.executeQuery();
            if (rs.next()) {
                return rs.getInt("orderID");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return -1;
    }
    public List<Integer> getAllOrderIDByAccountID(int accountID) {
        String sql = "SELECT orderID FROM Orders WHERE accountID = ?";
        List<Integer> listOrderID = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accountID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listOrderID.add(rs.getInt("orderID"));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listOrderID;
    }
    public List<Orders> getListOrderByAccountID(int accountID) {
        String sql = "SELECT * FROM Orders WHERE accountID = ? ORDER BY orderDate DESC";
        List<Orders> listOrder = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accountID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Orders order = new Orders();
                order.setOrderID(rs.getInt("orderID"));
                order.setAccountID(rs.getInt("accountID"));
                order.setOrderDate(rs.getDate("orderDate"));
                order.setAddress(rs.getString("address"));
                order.setTotalPrice(rs.getInt("totalPrice"));
                order.setStatus(rs.getInt("status"));
                listOrder.add(order);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listOrder;
    }

}
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
import model.Product;
/**
 *
 * @author vh69
 */
public class ProductDAO extends DBContext {
    public List<Product> adminGetAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getInt("Price"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setImage(rs.getString("Image"));
                product.setDescription(rs.getString("Description"));
                product.setStatus(rs.getInt("Status"));
                list.add(product);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE Status = 1 ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getInt("Price"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setImage(rs.getString("Image"));
                product.setDescription(rs.getString("Description"));
                list.add(product);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    public int countProduct() {
        String sql = "SELECT COUNT(*) FROM Product WHERE Status = 1 ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }
    public List<Product> getProductByPage(int begin, int number_of_product, String categoryID) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Product WHERE CategoryID = ? AND Status = 1 ORDER BY ProductID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(categoryID));
            ps.setInt(2, begin);
            ps.setInt(3, number_of_product);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getInt("Price"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setImage(rs.getString("Image"));
                product.setDescription(rs.getString("Description"));
                list.add(product);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    public List<Product> searchProduct(int begin, int number_of_product, String search) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Product WHERE Name LIKE ? ORDER BY ProductID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setInt(2, begin);
            ps.setInt(3, number_of_product);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getInt("Price"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setImage(rs.getString("Image"));
                product.setDescription(rs.getString("Description"));
                list.add(product);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    public Product getProductByID(String id) {
        String sql = "SELECT * FROM Product WHERE ProductID = ? AND Status = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getInt("Price"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setImage(rs.getString("Image"));
                product.setDescription(rs.getString("Description"));
                product.setStatus(rs.getInt("status"));
                return product;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        } catch (NumberFormatException ex) {
            System.out.println(ex);
        }
        return null;
    }
    public List<Product> getProductByPage(int begin, int number_of_product) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Product WHERE Status = 1 ORDER BY ProductID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, begin);
            ps.setInt(2, number_of_product);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getInt("Price"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setImage(rs.getString("Image"));
                product.setDescription(rs.getString("Description"));
                list.add(product);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    public List<Product> getListProductByOrderID(int orderID) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT Product.*, OrderDetail.Quantity FROM OrderDetail JOIN Product ON OrderDetail.ProductID = Product.ProductID WHERE OrderDetail.OrderID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getInt("Price"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setImage(rs.getString("Image"));
                product.setDescription(rs.getString("Description"));
                product.setQuantity(rs.getInt("Quantity"));
                list.add(product);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    public Product getProductByID(int id) {
        String sql = "SELECT * FROM Product WHERE ProductID = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getInt("Price"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setImage(rs.getString("Image"));
                product.setDescription(rs.getString("Description"));
                product.setStatus(rs.getInt("status"));
                return product;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    public boolean deleteProductByID(int id) {
        String sql = "UPDATE Product SET Status = 0 WHERE ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }
    public boolean updateProduct(Product product) {
        String sql = "UPDATE Product SET  name = ?, price = ?, description  = ?, image = ?, status = ?, categoryID = ? WHERE ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setInt(2, product.getPrice());
            ps.setString(3, product.getDescription());
            ps.setString(4, product.getImage());
            ps.setInt(5, product.getStatus());
            ps.setInt(6, product.getCategoryID());
            ps.setInt(7, product.getProductID());
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }
    public boolean insertProduct(Product product) {
        String sql = "INSERT INTO Product (name, price, description, image, status, categoryID) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setInt(2, product.getPrice());
            ps.setString(3, product.getDescription());
            ps.setString(4, product.getImage());
            ps.setInt(5, product.getStatus());
            ps.setInt(6, product.getCategoryID());
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }
}
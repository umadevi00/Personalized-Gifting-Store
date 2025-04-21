package gifts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Mothersql {
    
    // Method to retrieve list of products from the database
    public List<Product> getProducts() {
        List<Product> listProducts = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/giftsgalore", "root", "1234");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM product_mothersday");
            
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("product_id"));
                product.setName(rs.getString("product_name"));
                product.setPrice(rs.getDouble("price"));
                product.setDescription(rs.getString("description"));
                product.setBuyerName(rs.getString("buyer_name"));
                product.setReview(rs.getString("review"));
                product.setRatings(rs.getDouble("ratings"));
                product.setImageUrl(rs.getString("imageUrl"));
                listProducts.add(product);
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listProducts;
    }
    
    // Method to retrieve a single product by ID
    public Product getProductById(int productId) {
        Product product = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/giftsgalore", "root", "1234");
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM product_mothersday WHERE product_id = " + productId;
            ResultSet rs = stmt.executeQuery(sql);
            
            if (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("product_id"));
                product.setName(rs.getString("product_name"));
                product.setPrice(rs.getDouble("price"));
                product.setDescription(rs.getString("description"));
                product.setBuyerName(rs.getString("buyer_name"));
                product.setReview(rs.getString("review"));
                product.setRatings(rs.getDouble("ratings"));
                product.setImageUrl(rs.getString("imageUrl"));
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }
    
    // Method to add a new product to the database
    public void addProduct(Product product) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/giftsgalore", "root", "1234");
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO product_mothersday (product_name, price, description, buyer_name, review, ratings, imageUrl) VALUES ('"
                         + product.getName() + "', " + product.getPrice() + ", '" + product.getDescription() + "', '"
                         + product.getBuyerName() + "', '" + product.getReview() + "', " + product.getRatings() + ", '"
                         + product.getImageUrl() + "')";
            stmt.executeUpdate(sql);
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class ConnectDB {

    private Connection con;
//
//    public static  void main(String[] args) throws SQLException{
//        ConnectDB con = new ConnectDB();
//        con.open("weblab6");
//        float price = 36.000f;
//       // ArrayList insert = con.insertProduct("pro2110","store20", "country20", price ,2);
//        System.out.println(insert.size());
//        con.close();
//      for(int i= 0; i< insert.size(); i++){
//          Product p = (Product)insert.get(i);
//          System.out.println(p.getName());
//      }
//      
//    }
    public void open(String databaseName) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/" + databaseName + "??useUnicode=true&characterEncoding=UTF-8";
            con = (Connection) DriverManager.getConnection(url, "root", "");
            con.setAutoCommit(false);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void close() throws SQLException {
        con.close();
    }

    public boolean insertNewAccount(String name, String visa, String address) {
        String query = null;
        try {
            query = "insert into account(Name,Visa,Address) values('" + name + "','" + visa + "','" + address + "')";
            PreparedStatement pr = (PreparedStatement) con.prepareStatement(query);
            int insert = pr.executeUpdate();
            con.commit();
            if (insert > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //this method doesn't get quantity;
    public ArrayList selectProduct(String table) {
        ArrayList arr = new ArrayList();
        try {
            String query = "select * from " + table;
            PreparedStatement pr = (PreparedStatement) con.prepareStatement(query);
            ResultSet rs = pr.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setName(rs.getString("Name"));
                p.setManufacturer(rs.getString("Manufacturer"));
                p.setCountry(rs.getString("Country"));
                p.setPrice(rs.getFloat("Price"));
                arr.add(p);
            }
        } catch (Exception e) {
        }

        return arr;
    }
    public ArrayList insertProduct(String username,String name,String manu, String country,float price, int quantity){
        ArrayList arr = new ArrayList();
        try{
            String query = "insert into orderProduct(UserName,Name,Manufacturer,Country,Price,Quantity) values('"+username+"','"+name+"','"+manu+"','"+country+"',"+price+","+quantity+")";
            System.out.println(query);
            PreparedStatement pr = (PreparedStatement)con.prepareStatement(query);
//            pr.setString(1,name);
//            pr.setString(2,manu);
//            pr.setString(3,country);
//            pr.setFloat(4, price);
//            pr.setInt(5, quantity);
//            System.out.println(query);
            int insert = pr.executeUpdate(query);
            
            con.commit();
            if(insert > 0){
                String query2 ="select * from orderProduct";
                PreparedStatement pr2 = (PreparedStatement)con.prepareStatement(query2);
                ResultSet rs = pr2.executeQuery();
                System.out.println(query2+"after");
                while(rs.next()){
                    Product p = new Product();
                    p.setName(rs.getString(2));
                    p.setManufacturer(rs.getString(3));
                    p.setCountry(rs.getString(4));
                    p.setPrice(rs.getFloat(5));
                    p.setQuantity(rs.getInt(6));
                
                    
                    arr.add(p);
                }
            }else{
                System.out.println("Some thing wrong");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return arr;
    }
}

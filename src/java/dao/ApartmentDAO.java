/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ApartmentDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Utils;

/**
 *
 * @author Trieu Do
 */
public class ApartmentDAO {

    Connection conn = null;
    PreparedStatement ptm = null;
    ResultSet rs = null;

    private static final String AD_SEARCH_APARTMENT = "SELECT A.apartmentId, A.size, A.image, B.buildingName, C.typeName, C.rentPrice, C.salePrice, [Status] = CASE [status]\n"
            + "WHEN 0 THEN 'Het phong' ELSE 'Con phong' END\n"
            + "FROM Apartments A, Buildings B, ApartmentTypes C\n"
            + "WHERE apartmentId LIKE ? and B.buildingId=A.buildingId and C.apartmentTypeId=A.apartmentTypeId\n"
            + "ORDER BY A.apartmentId ASC\n"
            + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY;";
    private static final String US_SEARCH_APARTMENT = "SELECT A.apartmentId, A.size, A.image, B.buildingName, C.rentPrice, C.salePrice, [Status] = CASE [status]\n"
            + "WHEN 1 THEN 'Con phong' END\n"
            + "FROM Apartments A, Buildings B, ApartmentTypes C\n"
            + "WHERE apartmentId LIKE ? and B.buildingId=A.buildingId and C.apartmentTypeId=A.apartmentTypeId and status = 1\n"
            + "ORDER BY A.apartmentId ASC";
        private static final String AD_SEARCH_APARTMENT_TYPE = "";
//   private static final String UPDATE_APARTMENT = "\n"
//            + "UPDATE Apartments \n"
//            + "SET image = ?\n"
//            + "FROM Apartments A, ApartmentTypes B	\n"
//            + "WHERE A.apartmentTypeId=B.apartmentTypeId and A.apartmentId LIKE ?\n"
//            + "UPDATE ApartmentTypes\n"
//            + "SET rentPrice = ?, salePrice = ?\n"
//            + "FROM Apartments A, ApartmentTypes B\n"
//            + "WHERE A.apartmentTypeId=B.apartmentTypeId and A.apartmentId LIKE ?\n"; 
    private static final String UPDATE_APARTMENT = "UPDATE Apartments SET image = ? WHERE apartmentId LIKE ?";
    private static final String UPDATE_APARTMENT_PRICE = "UPDATE Aparments SET ";
    private static final String UPDATE_APARTMENT_STATUS = "UPDATE Apartments SET status = 0 WHERE apartmentId like ?";
    private static final String COUNT_ROOM = "SELECT COUNT(apartmentId) AS [count]\n"
            + "FROM Apartments WHERE status = ?;";

    public int countApartment(String status) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_ROOM);
                ptm.setString(1, status);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    count = Integer.parseInt(rs.getString("count"));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return count;
    }
    private static final String GET_TOTAL_APARTMENT = "SELECT count(*) FROM Apartments";
    private static final String GET_APARTMENT_TYPE = "SELECT* FROM ApartmentTypes";
    
    public List<ApartmentDTO> getListApartment_AD(String searchApartment, int index) throws SQLException {
        List<ApartmentDTO> listApartment = new ArrayList<>();

        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(AD_SEARCH_APARTMENT);
                ptm.setString(1, "%" + searchApartment + "%");
                ptm.setInt(2, (index - 1) * 10);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String apartmentId = rs.getString("apartmentId");
                    String size = rs.getString("size");
                    String image = rs.getString("image");
                    String buildingName = rs.getString("buildingName");
                    String typeName = rs.getString("typeName");
                    float rentPrice = Float.parseFloat(rs.getString("rentPrice"));
                    float salePrice = Float.parseFloat(rs.getString("salePrice"));
                    String status = rs.getString("status");
                    listApartment.add(new ApartmentDTO(apartmentId, size, image, buildingName, typeName, rentPrice, salePrice, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listApartment;
    }

    public List<ApartmentDTO> getListApartment_US(String search) throws SQLException {
        List<ApartmentDTO> listApartment = new ArrayList<>();
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(US_SEARCH_APARTMENT);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String apartmentId = rs.getString("apartmentId");
                    String size = rs.getString("size");
                    String image = rs.getString("image");
                    String buildingName = rs.getString("buildingName");
                    float rentPrice = Float.parseFloat(rs.getString("rentPrice"));
                    float salePrice = Float.parseFloat(rs.getString("salePrice"));
                    String status = rs.getString("status");
                    listApartment.add(new ApartmentDTO(apartmentId, size, image, buildingName, image, rentPrice, salePrice, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listApartment;
    }
    
    

    public int getTotalApartment() {
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TOTAL_APARTMENT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }


    public List<ApartmentDTO> getListApartmentType() throws SQLException{
        List<ApartmentDTO> listApartmentTpye = new ArrayList<>();
        try {
            conn= Utils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_APARTMENT_TYPE);
                rs = ptm.executeQuery();
                while(rs.next()){
                    String apartmentTypeId = rs.getString("apartmentTypeId");
                    String typeName = rs.getString("typeName");
                    float rentPrice = Float.parseFloat(rs.getString("rentPrice"));
                    float salePrice = Float.parseFloat(rs.getString("salePrice"));
                    listApartmentTpye.add(new ApartmentDTO(apartmentTypeId, typeName, rentPrice, salePrice));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listApartmentTpye;
    }
//    public boolean updateApartment(String apartmentId, String image) throws SQLException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        try {
//            conn = Utils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(UPDATE_APARTMENT);
////                ptm.setString(1, apartment.getSize());
////                ptm.setString(2, apartment.getBuildingName());
//                ptm.setString(1, apartmentId);
//                ptm.setString(2, image);
////                ptm.setString(4, Float.toString(apartment.getRentPrice()));
////                ptm.setString(5, Float.toString(apartment.getSalePrice()));
////                ptm.setString(6, apartment.getStatus());
//
//                check = ptm.executeUpdate() > 0;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return check;
//    }

//    public void updateApartment(String apartmentId, String image) throws SQLException {
//        //boolean check = false;
////        Connection conn = null;
////        PreparedStatement ptm = null;
//        try {
//            conn = Utils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(UPDATE_APARTMENT);
////                ptm.setString(1, apartment.getSize());
////                ptm.setString(2, apartment.getBuildingName());
//                ptm.setString(1, apartmentId);
//                ptm.setString(2, image);
////                ptm.setString(4, Float.toString(apartment.getRentPrice()));
////                ptm.setString(5, Float.toString(apartment.getSalePrice()));
////                ptm.setString(6, apartment.getStatus());
//
//                ptm.executeUpdate();
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//    }
    public boolean updateApartment(ApartmentDTO apartment) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_APARTMENT);
//                ptm.setString(1, apartment.getSize());
//                ptm.setString(2, apartment.getBuildingName());
                ptm.setString(1, apartment.getImage());
                ptm.setString(2, apartment.getApartmentId());
//                ptm.setString(4, Float.toString(apartment.getRentPrice()));
//                ptm.setString(5, Float.toString(apartment.getSalePrice()));
//                ptm.setString(6, apartment.getStatus());

                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateApartmentStatus(String apartmentId) throws SQLException {
        boolean check = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_APARTMENT_STATUS);
                ptm.setString(1, apartmentId);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}

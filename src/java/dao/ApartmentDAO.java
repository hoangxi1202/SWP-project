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

    private static final String AD_SEARCH_APARTMENT = "SELECT A.apartmentId, A.size, A.image, B.buildingName, C.rentPrice, C.salePrice, [Status] = CASE [status]\n"
            + "WHEN 0 THEN 'Het phong' ELSE 'Con phong' END\n"
            + "FROM Apartments A, Buildings B, ApartmentTypes C\n"
            + "WHERE apartmentId LIKE ? and B.buildingId=A.buildingId and C.apartmentTypeId=A.apartmentTypeId";
    private static final String US_SEARCH_APARTMENT = "SELECT A.apartmentId, A.size, A.image, B.buildingName, C.rentPrice, C.salePrice, [Status] = CASE [status]\n"
            + "WHEN 1 THEN 'Con phong' END\n"
            + "FROM Apartments A, Buildings B, ApartmentTypes C\n"
            + "WHERE apartmentId LIKE ? and B.buildingId=A.buildingId and C.apartmentTypeId=A.apartmentTypeId and status = 1";
//   private static final String UPDATE_APARTMENT = "\n"
//            + "UPDATE Apartments \n"
//            + "SET image = ?\n"
//            + "FROM Apartments A, ApartmentTypes B	\n"
//            + "WHERE A.apartmentTypeId=B.apartmentTypeId and A.apartmentId LIKE ?\n"
//            + "UPDATE ApartmentTypes\n"
//            + "SET rentPrice = ?, salePrice = ?\n"
//            + "FROM Apartments A, ApartmentTypes B	\n"
//            + "WHERE A.apartmentTypeId=B.apartmentTypeId and A.apartmentId LIKE ?\n"; 
    private static final String UPDATE_APARTMENT = "UPDATE Apartments SET image = ? WHERE apartmentId = ?";
    private static final String UPDATE_APARTMENT_STATUS = "UPDATE Apartments SET status = 0 WHERE apartmentId like ?";

    public List<ApartmentDTO> getListApartment_AD(String searchApartment) throws SQLException {
        List<ApartmentDTO> listApartment = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(AD_SEARCH_APARTMENT);
                ptm.setString(1, "%" + searchApartment + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String apartmentId = rs.getString("apartmentId");
                    String size = rs.getString("size");
                    String image = rs.getString("image");
                    String buildingName = rs.getString("buildingName");
                    float rentPrice = Float.parseFloat(rs.getString("rentPrice"));
                    float salePrice = Float.parseFloat(rs.getString("salePrice"));
                    String status = rs.getString("status");
                    listApartment.add(new ApartmentDTO(apartmentId, size, image, buildingName, rentPrice, salePrice, status));
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
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
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
                    listApartment.add(new ApartmentDTO(apartmentId, size, image, buildingName, rentPrice, salePrice, status));
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

    public boolean updateApartment(String apartmentId, String image) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_APARTMENT);
//                ptm.setString(1, apartment.getSize());
//                ptm.setString(2, apartment.getBuildingName());
                ptm.setString(1, apartmentId);
                ptm.setString(2, image);
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

//    public boolean updateApartment(ApartmentDTO apartment) throws SQLException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        try {
//            conn = Utils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(UPDATE_APARTMENT);
////                ptm.setString(1, apartment.getSize());
////                ptm.setString(2, apartment.getBuildingName());
//                ptm.setString(1, apartment.getApartmentId());
//                ptm.setString(2, apartment.getImage());
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
    public boolean updateApartmentStatus(String apartmentId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
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
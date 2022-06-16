/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.BillDTO;
import entity.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Utils;

/**
 *
 * @author Nhat Linh
 */
public class BillDAO {

    private static final String VIEW_BILL = "SELECT billId, total, Bills.[status], [date], Apartments.apartmentId\n"
            + " FROM Bills, Apartments, Contracts, Owners\n"
            + " WHERE Bills.apartmentId = Apartments.apartmentId\n"
            + "	AND Apartments.apartmentId = Contracts.apartmentId\n"
            + "	AND Contracts.ownerId = Owners.ownerId\n"
            + "	AND Owners.userId = ? AND Bills.status = ?";
//    private static final String VIEW_DETAIL = "";

    public List<BillDTO> getBill(String userId, String status) throws SQLException {
        List<BillDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(VIEW_BILL);
                stm.setString(1, userId);
                stm.setString(2, status);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String billId = rs.getString("billId");
                    double total = Double.parseDouble(rs.getString("total"));
                    boolean statusBill = Utils.getBoolean(rs.getString("status"));
                    String date = rs.getString("date");
                    String apartmentId = rs.getString("apartmentId");
                    list.add(new BillDTO(billId, total, statusBill, date, apartmentId));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<Service> getDetail(String billId) {
        List<Service> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
//        try {
            //not support yet
//            conn = Utils.getConnection();
//            if (conn != null) {
//                stm = conn.prepareStatement(VIEW_BILL);
//                stm.setString(1, userId);
//                stm.setString(2, status);
//                rs = stm.executeQuery();
//                while (rs.next()) {
//                    String billId = rs.getString("billId");
//                    double total = Double.parseDouble(rs.getString("total"));
//                    boolean statusBill = Utils.getBoolean(rs.getString("status"));
//                    String date = rs.getString("date");
//                    String apartmentId = rs.getString("apartmentId");
//                    list.add(new BillDTO(billId, total, statusBill, date, apartmentId));
//                }
//            }
//        } catch (ClassNotFoundException | SQLException e) {
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (stm != null) {
//                stm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
        return list;
    }
}

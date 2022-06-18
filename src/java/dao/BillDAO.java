/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.BillDTO;
import dto.DetailBill;
import entity.Service;
import java.sql.Connection;
import java.sql.Date;
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

    private static final String UPDATE_BILL = "UPDATE Bills set status = ? WHERE billId = ?";
    private static final String VIEW_BILL = "SELECT billId, total, Bills.[status], [date], Apartments.apartmentId\n"
            + " FROM Bills, Apartments, Contracts, Owners\n"
            + " WHERE Bills.apartmentId = Apartments.apartmentId\n"
            + "	AND Apartments.apartmentId = Contracts.apartmentId\n"
            + "	AND Contracts.ownerId = Owners.ownerId\n"
            + "	AND Owners.userId LIKE ? AND Bills.status LIKE ?";
    private static final String VIEW_DETAIL_INDEX = "SELECT Services.serviceId, Services.serviceName, Services.servicePrice, \n"
            + "Services.date, ServiceDetails.oldIndex,\n"
            + "ServiceDetails.newIndex, ServiceDetails.usagaIndex, ServiceDetails.date as printDate, \n"
            + "BillDetails.priceDetail \n"
            + "FROM Services, Bills, BillDetails, ServiceDetails\n"
            + "WHERE Bills.billId = BillDetails.billId\n"
            + "	AND BillDetails.serviceId = Services.serviceId\n"
            + "	AND Services.serviceId = ServiceDetails.serviceId\n"
            + " AND Bills.billId = ?\n"
            + " AND Services.status = 1";
    private static final String VIEW_DETAIL = "SELECT Services.serviceId, Services.serviceName, Services.servicePrice, \n"
            + "Services.date,\n"
            + "BillDetails.priceDetail\n"
            + "FROM Services, Bills, BillDetails\n"
            + "WHERE Services.serviceId NOT IN (SELECT ServiceDetails.serviceId FROM ServiceDetails)\n"
            + "	AND Bills.billId = BillDetails.billId\n"
            + "	AND BillDetails.serviceId = Services.serviceId\n"
            + "	AND Bills.billId = ?;";

    public boolean PaymentBill(String billId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE_BILL);
                stm.setString(1, "1");
                stm.setString(2, billId);
                check = stm.executeUpdate() > 0;
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return check;
    }

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

    public List<DetailBill> getDetailEW(String billId) throws SQLException {
        List<DetailBill> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                //Electric and Water
                stm = conn.prepareStatement(VIEW_DETAIL_INDEX);
                stm.setString(1, billId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String serviceId = rs.getString("serviceId");
                    String serviceName = rs.getString("serviceName");
                    float servicePrice = Float.parseFloat(rs.getString("servicePrice"));
                    String date = rs.getString("date");
                    int oldIndex = Integer.parseInt(rs.getString("oldIndex"));
                    int newIndex = Integer.parseInt(rs.getString("newIndex"));
                    int usageIndex = Integer.parseInt(rs.getString("usagaIndex"));
                    String printDate = rs.getString("printDate");
                    float priceDetail = Float.parseFloat(rs.getString("priceDetail"));
                    list.add(new DetailBill(serviceId, serviceName, servicePrice, date, priceDetail, newIndex, oldIndex, usageIndex, printDate));
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

    public List<Service> getDetail(String billId) throws SQLException {
        List<Service> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                //Other Services
                stm = conn.prepareStatement(VIEW_DETAIL);
                stm.setString(1, billId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String serviceId = rs.getString("serviceId");
                    String serviceName = rs.getString("serviceName");
                    float servicePrice = Float.parseFloat(rs.getString("servicePrice"));
                    Date date = Date.valueOf(rs.getString("date"));
                    float priceDetail = Float.parseFloat(rs.getString("priceDetail"));
                    list.add(new Service(serviceId, serviceName, servicePrice, date, priceDetail));
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
}

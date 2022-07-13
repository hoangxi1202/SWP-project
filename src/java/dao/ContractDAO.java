/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ContractDTO;
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
public class ContractDAO {

//    private static final String AD_SEARCH_CONTRACT = "SELECT A.contractId, C.apartmentId, B.fullName, F.serviceName, A.startDate, A.endDate, A.[status]\n"
//            + "FROM Contracts A, Owners B, Apartments C, Bills D, BillDetails E, Services F \n"
//            + "WHERE (B.fullName LIKE ? OR A.contractId LIKE ?) AND A.ownerId=B.ownerId \n"
//            + "       AND A.apartmentId=C.apartmentId AND C.apartmentId=D.apartmentId \n"
//            + "       AND D.billId=E.billId AND E.serviceId=F.serviceId";
    private static final String COUNT_CONTRACT = "Select COUNT(contractId) as [count] \n"
            + "FROM Contracts WHERE [status] = ?";
    private static final String AD_SEARCH_CONTRACT = "SELECT A.contractId, C.apartmentId, B.fullName, F.serviceName, A.startDate, A.endDate, A.[status]\n"
            + "FROM Contracts A, Owners B, Apartments C, Bills D, BillDetails E, Services F \n"
            + "WHERE  A.ownerId=B.ownerId \n"
            + "       AND A.apartmentId=C.apartmentId AND C.apartmentId=D.apartmentId \n"
            + "       AND D.billId=E.billId\n"
            + "       GROUP BY A.contractId, B.fullName, C.apartmentId, A.startDate, A.endDate, A.[status]";
    private static final String DELETE_CONTRACT = "UPDATE Contracts SET status = 0 WHERE contractId = ?";

    public int countContract(String status) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_CONTRACT);
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
//    public List<ContractDTO> getListContract_AD(String search) throws SQLException {
//        List<ContractDTO> listContract = new ArrayList<>();
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        ResultSet rs = null;
//        try {
//            conn = Utils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(AD_SEARCH_CONTRACT);
//                ptm.setString(1, "%" + search + "%");
//                rs = ptm.executeQuery();
//                while (rs.next()) {
//                    String contractId = rs.getString("contractId");
//                    String apartmentId = rs.getString("apartmentId");
//                    String fullName = rs.getString("fullName");
//                    String serviceName = rs.getString("serviceName");
//                    String startDate = rs.getString("startDate");
//                    String endDate = rs.getString("endDate");
//                    String status = rs.getString("status");
//                    listContract.add(new ContractDTO(contractId, apartmentId, fullName, serviceName, startDate, endDate, status));
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return listContract;
//    }\

    public List<ContractDTO> getListContract_AD() throws SQLException {
        List<ContractDTO> listContract = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(AD_SEARCH_CONTRACT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String contractId = rs.getString("contractId");
                    String apartmentId = rs.getString("apartmentId");
                    String fullName = rs.getString("fullName");
                    String startDate = rs.getString("startDate");
                    String endDate = rs.getString("endDate");
                    String status = rs.getString("status");
                    listContract.add(new ContractDTO(contractId, apartmentId, fullName, startDate, endDate, status));
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
        return listContract;
    }

}

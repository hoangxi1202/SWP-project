/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.TroubleDTO;
import dto.TroubleTypeDTO;
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
public class TroubleDAO {

    private static final String VIEW_TROUBLE = "SELECT Apartments.apartmentId, Apart_Troubles.tranId, Owners.fullName, Apart_Troubles.date, Troubles.troubleName as type, \n"
            + "            Apart_Troubles.detail, Apart_Troubles.status \n"
            + "            FROM Apartments, Troubles, Owners, Apart_Troubles, Contracts \n"
            + "            WHERE Troubles.troubleId = Apart_Troubles.troubleId \n"
            + "			AND Owners.ownerId = Contracts.ownerId \n"
            + "			AND Apartments.apartmentId = Apart_Troubles.apartmentId \n"
            + "			AND Contracts.apartmentId = Apartments.apartmentId";
    private static final String UPDATE_TROUBLE = "UPDATE Apart_Troubles SET status = ? WHERE tranId = ?";
    private static final String VIEW_TYPE_TROUBLE = "SELECT troubleId, troubleName FROM Troubles";

    public List<TroubleDTO> getListTrouble() throws SQLException {
        //not fix yet
        List<TroubleDTO> listTrouble = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_TROUBLE);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String apartment = rs.getString("apartmentId");
                    String troubleId = rs.getString("tranId");
                    String ownerName = rs.getString("fullName");
                    String date = rs.getString("date");
                    String typeName = rs.getString("type");
                    String detail = rs.getString("detail");
                    String check = rs.getString("status");
                    boolean status = false;
                    if (check.equals("1")) {
                        status = true;
                    }
                    listTrouble.add(new TroubleDTO(troubleId, apartment, ownerName, date, typeName, detail, "", status));

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
        return listTrouble;
    }

    public boolean updateTrouble(String troubleId, String status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_TROUBLE);
                if ("true".equals(status)) {
                    ptm.setString(1, "1");
                } else {
                    ptm.setString(1, "0");
                }
                ptm.setString(2, troubleId);
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

    public boolean createTrouble(String accountId, String apartmentId, String type, String detail, String solution) {
        //not support yet
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("");
            }
        } catch (Exception e) {
        }
        return check;
    }

    public List<TroubleTypeDTO> getListTypeTrouble() throws SQLException {
        List<TroubleTypeDTO> listTrouble = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_TYPE_TROUBLE);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String typeId = rs.getString("typeId");
                    String detail = rs.getString("detail");
                    listTrouble.add(new TroubleTypeDTO(typeId, detail));

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
        return listTrouble;
    }
}

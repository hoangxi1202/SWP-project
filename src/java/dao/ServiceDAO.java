/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Service;
import entity.ServiceDetail;
import entity.ServiceTypes;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import utils.Utils;

/**
 *
 * @author Minh Hoàng
 */
public class ServiceDAO {

    public boolean checkDuplicate(String id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                String sql = "SELECT serviceId "
                        + " FROM Services "
                        + " WHERE serviceId=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return check;
    }
    public boolean checkDuplicateServiceDetail(String id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                String sql = "SELECT serviceDetailId "
                        + " FROM ServiceDetails "
                        + " WHERE serviceDetailId=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return check;
    }

    public boolean insertService(Service s) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Services(serviceId, serviceName, servicePrice, status, date, typeId) "
                        + " VALUES(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, s.getServiceId());
                stm.setString(2, s.getServiceName());
                stm.setFloat(3, s.getPrice());
                stm.setInt(4, 1);
                stm.setDate(5, s.getCreatedDate());
                stm.setString(6, s.getTypeID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public List<Service> getListService(String search) throws SQLException {
        List<Service> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + " FROM Services "
                        + " WHERE serviceName like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String serviceId = rs.getString("serviceId");
                    String serviceName = rs.getString("serviceName");
                    Date createdDate = rs.getDate("date");
                    String typeId = rs.getString("typeId");
                    int status = rs.getInt("status");
                    float price = rs.getFloat("servicePrice");
                    list.add(new Service(serviceId, serviceName, createdDate, status, typeId, price));
                }
            }
        } catch (Exception e) {
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

    public Service getService(String id) throws SQLException {
        Service s = new Service();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + " FROM Services "
                        + " WHERE serviceId = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String serviceId = rs.getString("serviceId");
                    String serviceName = rs.getString("serviceName");
                    Date createdDate = rs.getDate("date");
                    int status = rs.getInt("status");
                    float price = rs.getFloat("servicePrice");
                    String typeId = rs.getString("typeId");
                    s = new Service(serviceId, serviceName, createdDate, status, typeId, price);
                }
            }
        } catch (Exception e) {
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
        return s;
    }

    public boolean updateService(Service s) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Services "
                        + " SET serviceName=?, createdDate=?, price=? "
                        + " WHERE serviceId=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, s.getServiceName());
                stm.setDate(2, s.getCreatedDate());
                stm.setFloat(3, s.getPrice());
                stm.setString(4, s.getServiceId());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
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
    public List<ServiceTypes> getListServiceType() throws SQLException {
        List<ServiceTypes> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + " FROM ServiceTypes ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String typeId = rs.getString("typeId");
                    String typeName = rs.getString("typeName");
                    list.add(new ServiceTypes(typeId, typeName));
                }
            }
        } catch (Exception e) {
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

    public boolean checkServiceHasDetail(String serviceId) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                String sql = "SELECT serviceId "
                        + " FROM ServiceDetails "
                        + " WHERE serviceId=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, serviceId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return check;
    }
    public boolean deleteService(String serID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                String sql = " DELETE Services "
                        + " WHERE serviceId=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, serID);
                int value = stm.executeUpdate();
                result = value > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public boolean addSerDetail(ServiceDetail sd) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO ServiceDetails "
                        + " VALUES(?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, sd.getServiceDetailId());
                stm.setInt(2, sd.getOldIndex());
                stm.setInt(3, sd.getNewIndex());
                stm.setInt(4, sd.getUsagaIndex());
                stm.setDate(5, sd.getDate());
                stm.setString(6, sd.getServiceId());
                stm.setFloat(7, sd.getPrice());
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


    public static void main(String[] args) throws SQLException, ParseException {
        ServiceDAO d = new ServiceDAO();
        
        //System.out.println(d.getService("E1-101").toString());
//        SimpleDateFormat sdf = new SimpleDateFormat("mm-dd-yyyy");
//        java.util.Date date = sdf.parse("02-28-2022");
//        java.sql.Date sqlDate = new Date(date.getTime());
//        Service s = new Service("E1-101", "tien dien", sqlDate, 1, (float) 100.5);
//        d.updateService(s);
//        List<Service> list = d.getListService("");
//        list.stream().forEach((service) -> {
//            System.out.println(service.toString());
//        });
    }
}

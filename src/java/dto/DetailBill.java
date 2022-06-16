/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import entity.Service;
import java.sql.Date;

/**
 *
 * @author Nhat Linh
 */
public class DetailBill extends Service {

    private String serviceDetailId;
    private int newIndex;
    private int oldIndex;
    private int usageIndex;
    private Date date;

    public String getServiceDetailId() {
        return serviceDetailId;
    }

    public void setServiceDetailId(String serviceDetailId) {
        this.serviceDetailId = serviceDetailId;
    }

    public int getNewIndex() {
        return newIndex;
    }

    public void setNewIndex(int newIndex) {
        this.newIndex = newIndex;
    }

    public int getOldIndex() {
        return oldIndex;
    }

    public void setOldIndex(int oldIndex) {
        this.oldIndex = oldIndex;
    }

    public int getUsageIndex() {
        return usageIndex;
    }

    public void setUsageIndex(int usageIndex) {
        this.usageIndex = usageIndex;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public DetailBill(String serviceDetailId, int newIndex, int oldIndex, int usageIndex, Date date) {
        this.serviceDetailId = serviceDetailId;
        this.newIndex = newIndex;
        this.oldIndex = oldIndex;
        this.usageIndex = usageIndex;
        this.date = date;
    }

    public DetailBill() {
    }

    public DetailBill(String serviceDetailId, int newIndex, int oldIndex, int usageIndex, Date date, String serviceId, String serviceName, Date createdDate, int status, String typeID, float price) {
        super(serviceId, serviceName, createdDate, status, typeID, price);
        this.serviceDetailId = serviceDetailId;
        this.newIndex = newIndex;
        this.oldIndex = oldIndex;
        this.usageIndex = usageIndex;
        this.date = date;
    }

}

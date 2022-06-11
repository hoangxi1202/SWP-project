/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.Date;

/**
 *
 * @author Nhat Linh
 */
public class TroubleDTO {

    private String troubleId;
    private String apartment;
    private String ownerName;
    private String date;
    private String typeName;
    private String detail;
    private String solution;
    private boolean status;

    public TroubleDTO() {
    }

    public TroubleDTO(String troubleId, String apartment, String ownerName, String date, String typeName, String detail, String solution, boolean status) {
        this.troubleId = troubleId;
        this.apartment = apartment;
        this.ownerName = ownerName;
        this.date = date;
        this.typeName = typeName;
        this.detail = detail;
        this.solution = solution;
        this.status = status;

    }


    public String getTroubleId() {
        return troubleId;
    }

    public void setTroubleId(String troubleId) {
        this.troubleId = troubleId;
    }

    public String getApartment() {
        return apartment;
    }

    public void setApartment(String apartment) {
        this.apartment = apartment;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}

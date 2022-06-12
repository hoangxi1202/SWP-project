/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nhat Linh
 */
public class RequestDTO {

    private String requestId;
    private String ownerId;
    private String fullName;
    private boolean status;
    private List<ResidentDTO> listRes;

    public RequestDTO(String requestId, String ownerId, String fullName, boolean status) {
        this.requestId = requestId;
        this.ownerId = ownerId;
        this.fullName = fullName;
        this.status = status;
        this.listRes = new ArrayList<>();
    }

    public List<ResidentDTO> getListRes() {
        return listRes;
    }
    
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public RequestDTO() {
    }

    public String getRequestId() {
        return requestId;
    }

    public void setRequestId(String requestId) {
        this.requestId = requestId;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setListRes(List<ResidentDTO> listRes) {
        this.listRes = listRes;
    }


}

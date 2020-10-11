package org.example.exhibitionsapp.entity.dto;

import org.example.exhibitionsapp.entity.ExhibitionStatus;
import org.example.exhibitionsapp.entity.HallSchedule;

import java.util.List;

public class ExhibitionDTO {
//    private Long id;
    private String exNameEng;
    private String exNameNative;
//    private List<HallSchedule> hallScheduleList;
    private String openTime;
    private String closeTime;
    private String descriptionEng;
    private String descriptionNative;
    private String themesEng;
    private String themesNative;
    private Long ticketPrice;
//    private ExhibitionStatus exhibitionStatus;

    public ExhibitionDTO(String exNameEng, String exNameNative,
                         String openTime, String closeTime,
                         String descriptionEng, String descriptionNative,
                         String themesEng, String themesNative,
                         Long ticketPrice) {
    this.exNameEng = exNameEng;
    this.exNameNative = exNameNative;
    this.openTime = openTime;
    this.closeTime = closeTime;
    this.descriptionEng = descriptionEng;
    this.descriptionNative = descriptionNative;
    this.themesEng = themesEng;
    this.themesNative=themesNative;
    this.ticketPrice = ticketPrice;}

    public String getExNameEng() {
        return exNameEng;
    }

    public void setExNameEng(String exNameEng) {
        this.exNameEng = exNameEng;
    }

    public String getExNameNative() {
        return exNameNative;
    }

    public void setExNameNative(String exNameNative) {
        this.exNameNative = exNameNative;
    }

    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    public String getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(String closeTime) {
        this.closeTime = closeTime;
    }

    public String getDescriptionEng() {
        return descriptionEng;
    }

    public void setDescriptionEng(String descriptionEng) {
        this.descriptionEng = descriptionEng;
    }

    public String getDescriptionNative() {
        return descriptionNative;
    }

    public void setDescriptionNative(String descriptionNative) {
        this.descriptionNative = descriptionNative;
    }

    public String getThemesEng() {
        return themesEng;
    }

    public void setThemesEng(String themesEng) {
        this.themesEng = themesEng;
    }

    public String getThemesNative() {
        return themesNative;
    }

    public void setThemesNative(String themesNative) {
        this.themesNative = themesNative;
    }

    public Long getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(Long ticketPrice) {
        this.ticketPrice = ticketPrice;
    }
}

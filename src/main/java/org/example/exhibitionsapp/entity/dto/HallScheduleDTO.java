package org.example.exhibitionsapp.entity.dto;

import lombok.extern.slf4j.Slf4j;
import org.example.exhibitionsapp.entity.Exhibition;
import org.example.exhibitionsapp.entity.HallName;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
@Slf4j
public class HallScheduleDTO {
    Logger logger = LoggerFactory.getLogger(HallScheduleDTO.class);

    private HallName hallName;
    private Exhibition exhibition;
    private Calendar startDate;
    private Calendar endDate;
    private String startDateAsString;
    private String endDateAsString;



    public HallScheduleDTO(HallName hallName, Exhibition exhibition, String startDateAsString, String endDateAsString) {
        this.hallName = hallName;
        this.exhibition = exhibition;
        this.startDateAsString = startDateAsString;
        this.endDateAsString = endDateAsString;

        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            c1.setTime(sdf.parse(startDateAsString));
            c2.setTime(sdf.parse(endDateAsString));
        } catch (ParseException e) {
            logger.error("Error during parsing dates.", e);
        }
        this.startDate = c1;
        this.endDate = c2;
    }

    public Logger getLogger() {
        return logger;
    }

    public void setLogger(Logger logger) {
        this.logger = logger;
    }

    public HallName getHallName() {
        return hallName;
    }

    public void setHallName(HallName hallName) {
        this.hallName = hallName;
    }

    public Exhibition getExhibition() {
        return exhibition;
    }

    public void setExhibition(Exhibition exhibition) {
        this.exhibition = exhibition;
    }

    public Calendar getStartDate() {
        return startDate;
    }

    public void setStartDate(Calendar startDate) {
        this.startDate = startDate;
    }

    public Calendar getEndDate() {
        return endDate;
    }

    public void setEndDate(Calendar endDate) {
        this.endDate = endDate;
    }

    public String getStartDateAsString() {
        return startDateAsString;
    }

    public void setStartDateAsString(String startDateAsString) {
        this.startDateAsString = startDateAsString;
    }

    public String getEndDateAsString() {
        return endDateAsString;
    }

    public void setEndDateAsString(String endDateAsString) {
        this.endDateAsString = endDateAsString;
    }
}

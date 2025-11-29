package com.pack.tmf.dto;
public class Seat { private int seatId; private int showId; private String seatNumber; private boolean booked;
 public int getSeatId(){return seatId;} public void setSeatId(int id){seatId=id;}
 public int getShowId(){return showId;} public void setShowId(int id){showId=id;}
 public String getSeatNumber(){return seatNumber;} public void setSeatNumber(String s){seatNumber=s;}
 public boolean isBooked(){return booked;} public void setBooked(boolean b){booked=b;}
}

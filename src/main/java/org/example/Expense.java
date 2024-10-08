package org.example;

public class Expense {
    private String name;
    private double amount;
    private String date;

    public Expense(String name, double amount, String date) {
        this.name = name;
        this.amount = amount;
        this.date = date;
    }

    public String getName() {
        return name;
    }
    public double getAmount() {
        return amount;
    }
    public String getDate() {
        return date;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setAmount(double amount) {
        this.amount = amount;
    }
    public void setDate(String date) {
        this.date = date;
    }

}

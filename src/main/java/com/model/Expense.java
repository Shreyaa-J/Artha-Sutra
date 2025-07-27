package com.model;

import java.time.LocalDate;

public class Expense {
    private String username;
    private String title;
    private String category;
    private double amount;
    private LocalDate date;

    public Expense() {}

    public Expense(String username, String title, String category, double amount, LocalDate date) {
        this.username = username;
        this.title = title;
        this.category = category;
        this.amount = amount;
        this.date = date;
    }

    public String getUsername() { return username; }
    public String getTitle() { return title; }
    public String getCategory() { return category; }
    public double getAmount() { return amount; }
    public LocalDate getDate() { return date; }

    public void setUsername(String username) { this.username = username; }
    public void setTitle(String title) { this.title = title; }
    public void setCategory(String category) { this.category = category; }
    public void setAmount(double amount) { this.amount = amount; }
    public void setDate(LocalDate date) { this.date = date; }
}


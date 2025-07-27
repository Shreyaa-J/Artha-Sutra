package com.model;

public class Budget {
    private String username;
    private double salary;
    private double saving;
    private double expense;
    private double remaining;
    private String monthYear;

    // Getters and Setters
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public double getSalary() { return salary; }
    public void setSalary(double salary) { this.salary = salary; }

    public double getSaving() { return saving; }
    public void setSaving(double saving) { this.saving = saving; }

    public double getExpense() { return expense; }
    public void setExpense(double expense) { this.expense = expense; }

    public double getRemaining() { return remaining; }
    public void setRemaining(double remaining) { this.remaining = remaining; }

    public String getMonthYear() { return monthYear; }
    public void setMonthYear(String monthYear) { this.monthYear = monthYear; }
}


package com.marvell.code;

import com.marvellConsultancy.client.Cand;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author Oyinkansola
 */
public class Controller {

    private Connection conn;

    /**
     * creates a connection
     *
     * @return Connection
     */
    public Connection getConnection() {
        Properties dbConfig = new Properties();
        try{
            FileInputStream file = new FileInputStream("./marvellconsultancy.properties");
            dbConfig.load(file);
            file.close();
        } catch(IOException e){
            System.err.println(e);
        }
        String database = dbConfig.getProperty("database", "marvell_db");
        String port = dbConfig.getProperty("database_port", "3306");
        String username = dbConfig.getProperty("database_username", "root");
        String password = dbConfig.getProperty("database_password", "P@$$word/1");
        
        if (conn == null) {
            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:"+port+"/"+database, username, password);
                return conn;
            } catch (SQLException ex) {
                ex.printStackTrace();

            }
        }
        return conn;

    }

    public void insert(String table, String email, String name, String location, String skill, String vacancy, String salary) {
        try { //inserts into the table

            String query = "INSERT INTO " + table + " (email,company_name, location, skill_required, vacancy, salary) VALUES('" + email + "','" + name + " ','" + location + "','" + skill + "','" + vacancy + "','" + salary + "')";
            executeQuery(query, "inserted"); //executes the query and brings up a popup message

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insert(String table, String company, int noOfCandidates, double amount) {
        try { //inserts into the table

            String query = "INSERT INTO " + table + " (Company_Name , No_Of_Candidates, Amount) VALUES('" + company + "','" + noOfCandidates + " ','" + amount + "')";
            executeQuery(query, "inserted"); //executes the query and brings up a popup message

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insert(String table, String firstName, String lastName, String address, String phoneNo, String dOB, String email, String qualification, String experience, String course) {
        try { //inserts into the table

            String query = "INSERT INTO " + table + " (first_Name,last_Name, address, phone_No,DOB,email, qualification, experience,courseOfStudy) VALUES('" + firstName + "','" + lastName + " ','" + address + "','" + phoneNo + "','" + dOB + "','" + email + "','" + qualification + "','" + experience + "','"+course+ "')";
            executeQuery(query, "inserted"); //executes the query and brings up a popup message
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(String table, String email, String name, String location, String skill, String vacancy, String salary) {
        try {  //updates the table
            String query = "UPDATE " + table + " SET company_name = '" + name + "',location='" + location + "',skill_required='" + skill + "',vacancy='" + vacancy + "',salary='" + salary + "' WHERE email='" + email + "'";
            executeQuery(query, "updated"); //executes the query and brings up a popup message
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(String table, String firstName, String lastName, String address, String phoneNo, String dOB, String email, String qualification, String experience, String course) {
        try {  //updates the table
            String query = "UPDATE " + table + " SET first_Name = '" + firstName + "',last_Name='" + lastName + "',address='" + address + "',phone_No='" + phoneNo + "',DOB='" + dOB + "',qualification='" + qualification + "',experience='" + experience + "',courseOfStudy='"+course+  "' WHERE email='" + email + "'";
            executeQuery(query, "updated"); //executes the query and brings up a popup message
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(String table, String email) {
        String query = "DELETE from " + table + " WHERE email='" + email + "'";
        Controller control = new Controller();
        control.executeQuery(query, "deleted");  //executes the query and brings up a popup message
    }

    public void deleteAllRows(String table) {
        String query = "TRUNCATE TABLE " + table;
        executeQuery(query, "deleted");
    }

    /**
     * executes queries
     *
     * @param query
     * @param message
     */
    public void executeQuery(String query, String message) {

        try {
            try (Connection connection = getConnection()) {
                PreparedStatement stm = connection.prepareStatement(query);
                int i = stm.executeUpdate();
                if (i > 0) {
                    JOptionPane.showMessageDialog(null, "Data " + message + " Successfully");
                    connection.close();

                } else {
                    JOptionPane.showMessageDialog(null, "Data not " + message);
                    connection.close();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    public double calculatePayment(String condition, String numberOfCandidates, String salary) {
        double amount = 0;
        switch (condition) {

            case "1-30": {
                int number = Integer.parseInt(numberOfCandidates);
                double candSalary = Float.parseFloat(salary);
                double equation = (0.5 * candSalary);
                amount = number * equation;
            }
            break;

            case "30-100": {
                int number = Integer.parseInt(numberOfCandidates);
                double candSalary = Float.parseFloat(salary);
                double equation = (0.8 * candSalary);
                amount = number * equation;
            }
            break;
            case "100-250": {
                int number = Integer.parseInt(numberOfCandidates);
                double candSalary = Float.parseFloat(salary);
                double equation = (0.1 * candSalary);
                amount = number * equation;
            }
            break;
            case "250-500": {
                int number = Integer.parseInt(numberOfCandidates);
                double candSalary = Float.parseFloat(salary);
                double equation = (0.15 * candSalary);
                amount = number * equation;
            }
            break;
            case "500 and above": {
                int number = Integer.parseInt(numberOfCandidates);
                double candSalary = Float.parseFloat(salary);
                double equation = (0.2 * candSalary);
                amount = number * equation;
            }
            break;
            default: {
                JOptionPane.showMessageDialog(null, "Incorrect input");
                break;
            }

        }
        return amount;
    }

}

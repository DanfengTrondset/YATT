package model;

public class Customer  implements java.io.Serializable {


     private String email;
     private String userName;
     private String password;

    public Customer() {
    }

    public Customer(String email, String userName, String password) {
       this.email = email;
       this.userName = userName;
       this.password = password;
    }
   
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }




}



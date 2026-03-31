// src/main/java/my/util/User.java
package my.util;

public class User{

    // 사용자 정보를 저장하기 위한 클래스
    private String userID;
    private String password;
    private String userName;
    private String address;

    public User(){} // 기본 생성자

    // 매개변수 생성자
    public User(String userID, String password, String userName, String address) {
        super();
        this.userID = userID;
        this.password = password;
        this.userName = userName;
        this.address = address;
    }
    // getter/setter
    public String getUserID() {
        return userID;
    }
    public void setUserID(String userID) {
        this.userID = userID;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }  
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

}

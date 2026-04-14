package my.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
    public static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/web?serverTimezone=UTC";
        String user = "root";
        String password = ""; // 비밀번호 없음

        return DriverManager.getConnection(url, user, password);
    }
}
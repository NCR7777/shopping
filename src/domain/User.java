package domain;

public class User {
    private int user_id;
    private String user_username;
    private String user_password;
    private String user_nickname;
    private String user_phoneNumber;
    private String user_sex;

    public User(int user_id, String user_username, String user_password, String user_nickname, String user_phoneNumber, String user_sex) {
        this.user_id = user_id;
        this.user_username = user_username;
        this.user_password = user_password;
        this.user_nickname = user_nickname;
        this.user_phoneNumber = user_phoneNumber;
        this.user_sex = user_sex;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public User() {
    }

    public String getUser_username() {
        return user_username;
    }

    public void setUser_username(String user_username) {
        this.user_username = user_username;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_nickname() {
        return user_nickname;
    }

    public void setUser_nickname(String user_nickname) {
        this.user_nickname = user_nickname;
    }

    public String getUser_phoneNumber() {
        return user_phoneNumber;
    }

    public void setUser_phoneNumber(String user_phoneNumber) {
        this.user_phoneNumber = user_phoneNumber;
    }

    public String getUser_sex() {
        return user_sex;
    }

    public void setUser_sex(String user_sex) {
        this.user_sex = user_sex;
    }
}

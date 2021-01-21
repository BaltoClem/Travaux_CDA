package org.afpa.listepersonne;

public class UserAccount {

    private final String userName;
    private final String userType;
    private final Boolean active;

    public UserAccount(String userName, String userType, Boolean active) {
        this.userName = userName;
        this.userType = userType;
        this.active = active;
    }

    @Override
    public String toString(){
        return this.userName+"("+this.userType+")";
    }

    public String getUserName() {
        return userName;
    }

    public String getUserType() {
        return userType;
    }

    public Boolean getActive() {
        return active;
    }
}

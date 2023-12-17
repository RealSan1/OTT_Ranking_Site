package ex;
public class user_info {
	private String User_ID;
    private String User_PW;
    private String User_Name;

    
    public user_info(String User_ID, String User_PW, String User_Name){
        this.User_ID = User_ID;
        this.User_PW = User_PW;
        this.User_Name = User_Name;

    }
    public String getUser_ID(){
        return User_ID;
    }
    
    public String getUser_PW(){
        return User_PW;
    }
    
    public String getUser_Name(){
        return User_Name;
    }

}

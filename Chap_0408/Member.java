//package my.info;
// cd DynamicWebProject\src\main\java\my\info
public class Member {

	String memberid;
	String name;
	String password;
	String email;
	
	public Member(){}
	public Member( String memberid, String name, String password, String email){
		this.memberid = memberid;
		this.name = name;
		this.password = password;
		this.email = email;	
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}

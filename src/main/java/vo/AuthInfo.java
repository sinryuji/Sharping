package vo;

public class AuthInfo {
	private String id;
	private String email;
	private String name;
	private String phone;
	
	
	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public AuthInfo(String id, String email, String name, String phone) {
		this.id = id;
		this.email = email;
		this.name = name;
		this.phone = phone;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
	
}

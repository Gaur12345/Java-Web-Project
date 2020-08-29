package connDAO;

import com.google.gson.Gson;



public class JsonMyClass
{
	private String name;
	private String email;
	private String gender; 
	private String mobile; 
	private String product_number;
	private String regDate;
	public JsonMyClass(String name, String email, String gender, String product_number, String mobile, String regDate)
	{ 
		super(); 
		this.name = name;
		this.email = email;
		this.gender = gender; 
		this.mobile = mobile; 
		this.product_number = product_number;
		this.regDate = regDate;
	}
	
}





package my.info;

public class Student {
    private String studName;
    private String studId;
    private int age;
	private String depart;
	private String hobby[];
	private String address;

    public Student(){}

    public Student(String studName, String studId, int age, String depart, String[] hobby, String address) {
        this.studName = studName;
        this.studId = studId;
        this.age = age;
		this.depart = depart;
		this.hobby = hobby;
		this.address = address;

    }

	public String getStudName() {
		return studName;
	}

	public void setStudName(String studName) {
		this.studName = studName;
	}

	public String getStudId() {
		return studId;
	}

	public void setStudId(String studId) {
		this.studId = studId;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}


	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

}

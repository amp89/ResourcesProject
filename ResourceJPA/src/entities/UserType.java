package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Table(name="user_type")
@Entity
public class UserType {

	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String typeName;
	
	@Column(name="access_level")
	private int accessLevel;
	
//	@Column(name="userId")
	//SENDS ENTIRE LIST TO JSON STRING if you use this as a managed reference, with userTYpe as a back reference
	@JsonIgnore
	@OneToMany(mappedBy="userType", fetch=FetchType.EAGER)
	private List<User> users;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public int getAccessLevel() {
		return accessLevel;
	}

	public void setAccessLevel(int accessLevel) {
		this.accessLevel = accessLevel;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}


	
	


}

package com.vector.vo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class User {
	private Integer id;
	private String nickName;
	private String password;
	private String email;
	private String gender;
	private String description;
	private String headImage;
    private Set<Blogs> blogs=new HashSet<Blogs>();

	public String getHeadImage() {
		return headImage;
	}

	public void setHeadImage(String headImage) {
		this.headImage = headImage;
	}

	public Set<Blogs> getBlogs() {
        return blogs;
    }

    public void setBlogs(Set<Blogs> blogs) {
        this.blogs = blogs;
    }

    public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}

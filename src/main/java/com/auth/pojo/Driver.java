package com.auth.pojo;

// default package
// Generated 2014-3-24 18:52:51 by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;

/**
 * Driver generated by hbm2java
 */
public class Driver implements java.io.Serializable {

	private Integer id;
	private String numcode;
	private String sex;
	private String status;
	private String name;
	private String post;
	private String phone;
	private String nativePlace;
	private String nation;
	private String culture;
	private String birthday;
	private String employtime;
	private String addr;
	private String carnum;
	private String cartype;
	private String getdate;
	private String memo;
	private String idcard;
	private Set carInformations = new HashSet(0);

	public Driver() {
	}

	public Driver(String numcode, String sex, String status, String name,
			String post, String phone, String nativePlace, String nation,
			String culture, String birthday, String employtime, String addr,
			String carnum, String cartype, String getdate, String memo,
			String idcard, Set carInformations) {
		this.numcode = numcode;
		this.sex = sex;
		this.status = status;
		this.name = name;
		this.post = post;
		this.phone = phone;
		this.nativePlace = nativePlace;
		this.nation = nation;
		this.culture = culture;
		this.birthday = birthday;
		this.employtime = employtime;
		this.addr = addr;
		this.carnum = carnum;
		this.cartype = cartype;
		this.getdate = getdate;
		this.memo = memo;
		this.idcard = idcard;
		this.carInformations = carInformations;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNumcode() {
		return this.numcode;
	}

	public void setNumcode(String numcode) {
		this.numcode = numcode;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPost() {
		return this.post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNativePlace() {
		return this.nativePlace;
	}

	public void setNativePlace(String nativePlace) {
		this.nativePlace = nativePlace;
	}

	public String getNation() {
		return this.nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getCulture() {
		return this.culture;
	}

	public void setCulture(String culture) {
		this.culture = culture;
	}

	public String getBirthday() {
		return this.birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmploytime() {
		return this.employtime;
	}

	public void setEmploytime(String employtime) {
		this.employtime = employtime;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getCarnum() {
		return this.carnum;
	}

	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}

	public String getCartype() {
		return this.cartype;
	}

	public void setCartype(String cartype) {
		this.cartype = cartype;
	}

	public String getGetdate() {
		return this.getdate;
	}

	public void setGetdate(String getdate) {
		this.getdate = getdate;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getIdcard() {
		return this.idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public Set getCarInformations() {
		return this.carInformations;
	}

	public void setCarInformations(Set carInformations) {
		this.carInformations = carInformations;
	}

}

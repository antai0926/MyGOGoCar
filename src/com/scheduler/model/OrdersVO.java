package com.scheduler.model;


import java.sql.Timestamp;

public class OrdersVO  implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer ord_id;
	private Integer ord_status;
	private Integer com_id;
	private Integer mem_id;
	private Timestamp ord_time;
	private Timestamp ord_getday;
	private Timestamp ord_reday;
	private Timestamp ord_cancelTime;
	private Integer item_total;
	
	public Integer getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(Integer ord_id) {
		this.ord_id = ord_id;
	}
	public Integer getOrd_status() {
		return ord_status;
	}
	public void setOrd_status(Integer ord_status) {
		this.ord_status = ord_status;
	}
	public Integer getCom_id() {
		return com_id;
	}
	public void setCom_id(Integer com_id) {
		this.com_id = com_id;
	}
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public Timestamp getOrd_time() {
		return ord_time;
	}
	public void setOrd_time(Timestamp ord_time) {
		this.ord_time = ord_time;
	}
	public Timestamp getOrd_getday() {
		return ord_getday;
	}
	public void setOrd_getday(Timestamp ord_getday) {
		this.ord_getday = ord_getday;
	}
	public Timestamp getOrd_reday() {
		return ord_reday;
	}
	public void setOrd_reday(Timestamp ord_reday) {
		this.ord_reday = ord_reday;
	}
	public Timestamp getOrd_cancelTime() {
		return ord_cancelTime;
	}
	public void setOrd_cancelTime(Timestamp ord_cancelTime) {
		this.ord_cancelTime = ord_cancelTime;
	}
	public Integer getItem_total() {
		return item_total;
	}
	public void setItem_total(Integer item_total) {
		this.item_total = item_total;
	}

}

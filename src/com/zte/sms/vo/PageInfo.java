package com.zte.sms.vo;

import java.io.Serializable;
import java.util.List;

import com.github.pagehelper.Page;

public class PageInfo<T>  implements Serializable {
	
	//总记录数
	private long total;
	
	//每一页的记录
	private List<T> rows;
	
	
    //包装Page对象
	public PageInfo(List<T> list) {
		if(list instanceof Page){
			Page page = (Page)list;
			this.rows=page;
			this.total=page.getTotal();
		}
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
	
	
	
	
	
	
	

}

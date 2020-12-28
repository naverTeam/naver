package hok;

import java.util.Hashtable;

public class CartMgr {
	private Hashtable<Integer, OrderBean> hCart=new Hashtable<Integer, OrderBean>();
	
	//세션에 기존의 값이 있는지 없는지 검사 -> 있다면 합침, 없다면 추가
	public void addCart(OrderBean order) {
		int proNum = order.getProNum();
		int ordAm = order.getOrdAm();
		if(ordAm > 0) {
			if(hCart.containsKey(proNum)){
				OrderBean temp = hCart.get(proNum);
				ordAm += temp.getOrdAm();
				order.setOrdAm(ordAm);
				hCart.put(proNum,order);
			}else {
				hCart.put(proNum,order);
			}
		}
	}
	
	//기존 hCart에 값이 있더라도 덮어쓰기 됨.
	public void updateCart(OrderBean order) {
		hCart.put(order.getProNum(),order);
	}
	
	//hCart Delete
	public void deleteCart(OrderBean order) {
		hCart.remove(order.getProNum());
	}
	
	//hCart List
	public Hashtable<Integer, OrderBean> getCartList() {
		return hCart;
	}
}

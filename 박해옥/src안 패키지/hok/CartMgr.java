package hok;

import java.util.Hashtable;

public class CartMgr {
	private Hashtable<Integer, OrderBean> hCart=new Hashtable<Integer, OrderBean>();
	
	//���ǿ� ������ ���� �ִ��� ������ �˻� -> �ִٸ� ��ħ, ���ٸ� �߰�
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
	
	//���� hCart�� ���� �ִ��� ����� ��.
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

package com.amor.storePayment.model;

import java.util.*;

public interface StorePaymentDAO {
	public int allAll(Map map);
	public int allStore(Map map);
	public List<StorePaymentDTO> dayAll(Map map);
	public int dayAllTotal(Map map);
	public List<StorePaymentDTO> dayStore(Map map);
	public int dayStoreTotal(Map map);
	public List<StorePaymentDTO> monthAll(Map map);
	public int monthAllTotal(Map map);
	public List<StorePaymentDTO> monthStore(Map map);
	public int monthStoreTotal(Map map);
	//수민
	public List<MyPageStorePaymentDTO> mypageStorePaymentList(int useridx);
	public int mypageStoreCancell(int paymentidx);
	public List<MyPageStorePaymentDTO> mypageStoreCancellList(int useridx);

	public int storeListTotalCnt();
	public List<StorePaymentDTO> storeList(Map map);
	public int storeListSubmit(Map map);

}
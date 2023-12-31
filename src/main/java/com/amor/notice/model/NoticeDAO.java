package com.amor.notice.model;

import java.util.*;

public interface NoticeDAO {
	
	public List<NoticeDTO> noticeList(Map map);
	public int noticeTotalCnt();
	public int noticeAdd(NoticeDTO dto);
	public NoticeDTO noticeContent(int idx);
	public NoticeDTO noticeUpdateForm(int idx);
	public int noticeUpdate(NoticeDTO dto);
	public int noticeDelete(int idx);
	public List<NoticeDTO> userNoticeList(Map map);
	public int userNoticeTotalCnt();
	public NoticeDTO userNoticeContent(int idx);
	public int noticeReadNumUpdate(int notice_idx);
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/amor/resources/css/admin/adminAll.css">
<body>
<div class="top">
	<div class="logo"><a href="/amor/admin/adminIndex.do"><img src="/amor/resources/img/main_logo.png" class="mainLogoImg"></a></div>
	<c:if test="${!empty sessionScope.data || !empty cookie.autologin}">
		<div class="logout"><input type="button" value="로그아웃" onclick = "adminLogout()"></div>
	</c:if>
</div>
<div class="sideDiv">
	<div class="side">
		<div class="sidemenu">
			<div class="menu" onclick="toggleSubmenu(this)">
				<div class="menutext"><a href="#" data-submenu="submenu-1">회원 관리</a></div>
			</div>
			<div class="submenu" id="submenu-1"> 
				<div class="menutext" ><a href="/amor/admin/member/memberList.do" data-submenu="submenu-1">회원 조회</a></div>
				<div class="menutext"><a href="/amor/admin/ticketing/ticketingList.do">회원 예매 목록</a></div>
			</div>
			
			<div class="menu" onclick="toggleSubmenu(this)">
				<div class="menutext"><a href="#" data-submenu="submenu-2">상영관 관리</a></div>
			</div>
			<div class="submenu" id="submenu-2"> 
				<div class="menutext"><a href="/amor/admin/theater/theaterList.do">상영관 등록</a></div>
				<div class="menutext"><a href="/amor/admin/playMovie/playingMovieList.do">상영영화 목록</a></div>
				<div class="menutext"><a href="/amor/admin/playMovie/playingMovieAdd.do">상영시간 등록</a></div>
			</div>
			
			<div class="menu" onclick="toggleSubmenu(this)">
				<div class="menutext"><a href="#" data-submenu="submenu-3">영화 관리</a></div>
			</div>
			<div class="submenu" id="submenu-3"> 
				<div class="menutext"><a href="/amor/admin/movie/movieList.do">영화 목록</a></div>
				<div class="menutext"><a href="/amor/admin/movie/movieAdd.do">영화 등록</a></div>
			</div>
			
			<div class="menu" onclick="toggleSubmenu(this)">
				<div class="menutext"><a href="#" data-submenu="submenu-4">배너 관리</a></div>
			</div>	
			<div class="submenu" id="submenu-4"> 
				<div class="menutext"><a href="/amor/admin/banner/bannerList.do">배너 등록</a></div>
				
			</div>			
			
			<div class="menu" onclick="toggleSubmenu(this)">
				<div class="menutext"><a href="#" data-submenu="submenu-5">광고 관리</a></div>
			</div>	
			<div class="submenu" id="submenu-5"> 
				<div class="menutext"><a href="/amor/admin/ads/adsList.do">광고 등록</a></div>
				
			</div>
			
			<div class="menu" onclick="toggleSubmenu(this)">
				<div class="menutext"><a href="#" data-submenu="submenu-6">관람평 관리</a></div>
			</div>
			<div class="submenu" id="submenu-6"> 
				<div class="menutext"><a href="/amor/admin/review/reviewList.do">관람평 목록</a></div>
			</div>		
			
			<div class="menu" onclick="toggleSubmenu(this)">
				<div class="menutext"><a href="#" data-submenu="submenu-7">1:1문의 관리</a></div>
			</div>
			<div class="submenu" id="submenu-7"> 
				<div class="menutext"><a href="/amor/admin/inquiry/inquiryList.do">1:1문의 목록</a></div>
			</div>	
						
			<div class="menu" onclick="toggleSubmenu(this)">
				<div class="menutext"><a href="#" data-submenu="submenu-8">공지 / FAQ 관리</a></div>
			</div>	
			<div class="submenu" id="submenu-8"> 
				<div class="menutext"><a href="/amor/admin/notice/noticeList.do">공지사항 목록</a></div>
				<div class="menutext"><a href="/amor/admin/notice/noticeWrite.do">공지사항 등록</a></div>
				<div class="menutext"><a href="/amor/admin/faq/faqList.do">FAQ 목록</a></div>
				<div class="menutext"><a href="/amor/admin/faq/faqWrite.do">FAQ 등록</a></div>
			</div>
			
			<div class="menu" onclick="toggleSubmenu(this)">
				<div class="menutext"><a href="/amor/admin/sales/sales.do" data-submenu="submenu-9">매출 관리</a></div>
			</div>
			<div class="submenu" id="submenu-9"> 
				<div class="menutext"><a href="/amor/admin/sales/sales.do">매출 관리</a></div>
			</div>	
			
			<div class="menu" onclick="toggleSubmenu(this)">
				<div class="menutext"><a href="#" data-submenu="submenu-10">스토어</a></div>
			</div>
			<div class="submenu" id="submenu-10"> 
				<div class="menutext"><a href="/amor/admin/inventory/inventoryList.do">재고 목록</a></div>
				<div class="menutext"><a href="/amor/admin/inventory/inventoryWrite.do">재고 등록</a></div>
				<div class="menutext"><a href="/amor/admin/product/productList.do">판매상품 목록</a></div>
				<div class="menutext"><a href="/amor/admin/product/productAdd.do">판매상품 등록</a></div>
				<div class="menutext"><a href="/amor/admin/store/storeList.do">결제내역 관리</a></div>
			</div>			
		</div>
		
<script>
// 페이지가 로드될 때 실행되는 함수
window.addEventListener('DOMContentLoaded', function () {
    // 현재 페이지의 URL을 가져오기
    var currentPage = window.location.href;

    // 모든 메뉴 아이템을 가져오기
    var menuItems = document.querySelectorAll('.menu');

    // 현재 선택된 메뉴 정보를 로컬 스토리지에서 가져오기
    var selectedMenu = localStorage.getItem('selectedMenu');
    var selectedSubmenu = localStorage.getItem('selectedSubmenu');

    // 각 메뉴 아이템을 순회하면서 현재 페이지와 일치하는지 확인
    menuItems.forEach(function (menuItem) {
        var link = menuItem.querySelector('a');
        var submenuId = link.getAttribute('data-submenu');
        var submenu = document.getElementById(submenuId);

        // 현재 페이지와 메뉴의 링크가 일치하면 해당 메뉴를 선택 상태로 만듭니다.
        if (link.getAttribute('href') === currentPage || submenuId === selectedSubmenu) {
            menuItem.classList.add('selected');
            submenu.style.display = 'block';
        }
    });
});

// 메뉴 토글 함수
function toggleSubmenu(menu) {
    var submenuId = menu.querySelector('a').getAttribute('data-submenu');
    var submenu = document.getElementById(submenuId);

    // 다른 서브 메뉴를 숨김
    var allSubmenus = document.querySelectorAll('.submenu');
    allSubmenus.forEach(function (sub) {
        if (sub !== submenu) {
            sub.style.display = 'none';
        }
    });

    // 모든 메뉴에서 'selected' 클래스 제거
    var allMenus = document.querySelectorAll('.menu');
    allMenus.forEach(function (item) {
        item.classList.remove('selected');
    });

    // 현재 클릭한 메뉴에 'selected' 클래스 추가
    menu.classList.add('selected');

    // 현재 클릭한 메뉴의 서브 메뉴를 토글
    if (submenu.style.display === 'block') {
        submenu.style.display = 'none';
        menu.classList.remove('selected'); // 서브 메뉴가 닫혔을 때 'selected' 클래스 제거
    } else {
        submenu.style.display = 'block';
    }

    // 선택된 메뉴 정보를 로컬 스토리지에 저장
    localStorage.setItem('selectedMenu', submenuId);
    localStorage.setItem('selectedSubmenu', submenuId); // 서브메뉴 정보도 저장
}

function adminLogout(){
	
	location.href = '/amor/admin/adminlogout.do';
}
</script>			
	</div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아모르 관리자 : 영화 수정</title>
<link rel="styleSheet" type="text/css" href="/amor/resources/css/admin/movieUpdate.css">
<script type="text/javascript">
function moviePreview(input,num){
	let movieImgId = 'moviePreview'+num;
	
	if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	    	document.getElementById(movieImgId).src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById(movieImgId).src = "";
	  }
}
//러닝타임 숫자만 입력받게
function checkNumber(event) {
	if(event.key >= 0 && event.key <= 9) {
	    return true;
	}
	return false;
}

//포스터 업로드
function checkFileUpload() {
           var fileInput = document.getElementById('btn_movieposter');
           if (!fileInput.files || fileInput.files.length == 0) {
               alert('파일을 선택해주세요.');
               return false; // 업로드를 막습니다.
           }
           return true; // 파일이 선택되었으므로 업로드를 허용합니다.
       }

</script> 
</head>
<body>
<%@include file="../admin_header.jsp" %><!-- 질문 -->
<div class="content">
<div class="content-title"><label class="titletext">영화 수정</label>
</div>
<div class="contentMain">

<div class="movieUpdatebox">
	<form name="movieUpdate" action="movieUpdate.do" class="movieUpdateform" method="post" enctype="multipart/form-data" onsubmit="return checkFileUpload()">
		<div class="movieUpdateImgDiv">
			<div id="moviePosterDiv">
				<div class="moviePosterImg"><img id="moviePreview0"></div>
				<label for="btn_movieposter"><div class="btn_moviePimg">이미지 선택</div></label><input id="btn_movieposter" type="file" name="movie_poster" onchange="moviePreview(this,0);">
			</div>
			<div id="movieStillCutDiv">
				<div id="movieStillCutDivPart1">
					<div class="movieStillCutImgandbutton"><div class="movieStillCutImg"><img id="moviePreview1"></div><label for="btn_movieSt1"><div class="btn_movieSimg">스틸컷1</div></label><input id="btn_movieSt1" type="file" name="movie_stillcut1" onchange="moviePreview(this,1);"></div>
					<div class="movieStillCutImgandbutton"><div class="movieStillCutImg"><img id="moviePreview2"></div><label for="btn_movieSt2"><div class="btn_movieSimg">스틸컷2</div></label><input id="btn_movieSt2" type="file" name="movie_stillcut2" onchange="moviePreview(this,2);"></div>
					<div class="movieStillCutImgandbutton1"><div class="movieStillCutImg"><img id="moviePreview3"></div><label for="btn_movieSt3"><div class="btn_movieSimg">스틸컷3</div></label><input id="btn_movieSt3" type="file" name="movie_stillcut3" onchange="moviePreview(this,3);"></div>
				</div>
				<div id="movieStillCutDivPart2">
					<div class="movieStillCutImgandbutton"><div class="movieStillCutImg"><img id="moviePreview4"></div><label for="btn_movieSt4"><div class="btn_movieSimg">스틸컷4</div></label><input id="btn_movieSt4" type="file" name="movie_stillcut4" onchange="moviePreview(this,4);"></div>
					<div class="movieStillCutImgandbutton"><div class="movieStillCutImg"><img id="moviePreview5"></div><label for="btn_movieSt5"><div class="btn_movieSimg">스틸컷5</div></label><input id="btn_movieSt5" type="file" name="movie_stillcut5" onchange="moviePreview(this,5);"></div>
				</div>
			</div>
		</div>
		<div class="movieUpdateTextDiv">
			<table id="movieUpdateTextDivTable">
				<tr>
					<th>영화제목</th><td><input type="text" name="movie_name" required="required" value="${dto.movie_name}"></td>
				</tr>
				<tr>
					<th>장르</th>
					<td><select name="movie_genre"><option value="공포">공포</option>
						<option value="로맨스">로맨스</option>
						<option value="뮤지컬">뮤지컬</option>
						<option value="스포츠">스포츠</option>
						<option value="액션">액션</option>
						<option value="전쟁">전쟁</option>
						<option value="코미디">코미디</option>
						<option value="판타지">판타지</option>
						<option value="SF">SF</option>
						<option value="드라마">드라마</option>
						<option value="미스터리">미스터리</option>
						<option value="애니메이션">애니메이션</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>감독</th><td><input type="text" name="movie_god"  required="required" value="${dto.movie_god}" ></td>
				</tr>
				<tr>
					<th>배우</th><td><input type="text" name="movie_actor" required="required" value="${dto.movie_actor}" ></td>
				</tr>
				<tr>
					<th>연령제한</th>
					<td><select name="movie_maxage">
						<option value="0" <c:if test="${dto.movie_maxage == 0}">selected</c:if>>ALL</option>
						<option value="1" <c:if test="${dto.movie_maxage == 1}">selected</c:if>>12세 이상 시청</option>
						<option value="2" <c:if test="${dto.movie_maxage == 2}">selected</c:if>>15세 이상 시청</option>
						<option value="3" <c:if test="${dto.movie_maxage == 3}">selected</c:if>>18세 이상 시청</option></select></td>
				</tr>
				<tr>
					<th>개봉날짜</th><td><input type="date" name="movie_opendate"  required="required" value="${dto.movie_opendate}"></td>
				</tr>
				<tr>	
					<th>러닝타임</th><td><input type="text" name="movie_runningtime" placeholder="러닝타임을 입력해주세요(단위 : 분)" required="required" value="${dto.movie_runningtime}" onkeypress="return checkNumber(event)"></td>
				</tr>
				<tr>
					<th>국적</th><td><input type="text" name="movie_country"  required="required" value="${dto.movie_country}"></td>
				</tr>
				<tr>
					<th>줄거리</th><td><textarea name="movie_content" rows="15" cols="40" required="required">${dto.movie_content }</textarea></td>
				</tr>
				<tr>
					<td colspan="3" class="movieUpdateSumit"><input type="hidden" name="movie_idx" value="${dto.movie_idx }"> <input type="hidden" name="movie_state" value="${dto.movie_state }"> <input type="button" value="취소" onclick="location.href='/amor/admin/movie/movieList.do'"> &nbsp;<input type="submit" value="수정"> </td>
				</tr>
			
			</table>
		</div>
	</form>
</div>


</div>
</div>
</body>
</html>
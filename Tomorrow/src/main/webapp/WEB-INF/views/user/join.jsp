<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="joinDiv">
	<h2>Tomorrow에 오신 걸 환영합니다</h2>
	<div style="color: red;">${msg}</div>
	<div id="joinContainer">
		<form id="frm" class="frm" action="/user/join" method="post">
			<div id="idChkResult" class="msg"></div>
			<div>
				<input type="text" name="user_id" placeholder="아이디">
				<button type="button" onclick="chkId()">아이디 중복체크</button>
			</div>
			<div>
				<input type="password" name="user_pw" placeholder="비밀번호">
			</div>
			<div>
				<input type="password" name="user_pwre" placeholder="비밀번호 확인">
			</div>
			<div>
				<input type="text" name="nm" placeholder="이름">
			</div>
			<div>
				<input type="text" name="nick_nm" placeholder="닉네임">
			</div>
			<div>
				<input class="input_btn" name="zipcode" id="zip" type="text" maxlength="6" title="우편번호" value="" placeholder="우편번호" readonly="readonly"/> 
				<a href="javascript:execDaumPostcode();" class="btn">주소찾기</a><br> 
				<input name="l_addr" id="addr1" type="text" value="" placeholder="주소" /><br> 
				<input name="s_addr" id="addr2" type="text" value="" placeholder="상세주소" />
			</div>
			<div>
				<input type="submit" value="회원가입">
			</div>
		</form>
		<div>
			<a href="/user/login">로그인으로</a>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function chkId() {
		const user_id = frm.user_id.value
		console.log(user_id)
		axios.post('/user/ajaxIdChk', {
			user_id : user_id
		}).then(function(res) {
			console.log(res)
		})
	}
	
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('addr1').value = fullRoadAddr;
				document.getElementById('addr2').focus();
			}
		}).open();
	}
	function chkJoin() {
		const user_id = frm.user_id.value
		const checkedId = frm.checkedId.value
		const user_pw = frm.user_pw.value
		const pwre = frm.user_pwre.value
		const nm = frm.nm.value
		const nick_nm = frm.nick_nm.value
		const addr2 = frm.addr2.value
		//			console.log(typeof(checkedId) + ":" + checkedId)

		if (user_id == '') {
			alert('아이디를 입력해주세요')
			frm.user_id.focus()
			return false
		}
		if (checkedId != 0) {
			switch (checkedId) {
			case '1':
				alert('아이디 중복검사를 먼저 진행해주세요.')
				frm.user_id.focus()
				return false
			case '2':
				alert('중복된 아이디로는 가입하실 수 없습니다.')
				frm.user_id.focus()
				return false
			}
		}
		if (user_pw == '') {
			alert('비밀번호를 입력해주세요')
			frm.user_pw.focus()
			return false
		}
		if (pwre == '') {
			alert('비밀번호를 다시 입력해주세요')
			frm.user_pwre.focus()
			return false
		}
		if (user_pw != pwre) {
			alert('비밀번호가 같지 않습니다. 다시 확인해주세요.')
			frm.user_pwre.focus()
			return false
		}
		if (nm == '') {
			alert('이름을 입력해주세요')
			frm.nm.focus()
			return false
		}
		return true
	}
</script>

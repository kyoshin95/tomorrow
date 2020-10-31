<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
	<title>Tomorrow</title>
	<link rel="stylesheet" href="/res/css/login.css">
</head>
<body>
	<div class="wrapper">
		<form class="login">
		  <p class="title">Tomorrow</p>
		  <input type="text" name="user_id" placeholder="아이디" autofocus/>
		  <i class="fa fa-user"></i>
		  <input type="password" name="user_pw" placeholder="비밀번호" />
		  <i class="fa fa-key"></i>
		  <a href="#">비밀번호를 잃어버리셨나요?</a>
		  <button>
		    <i class="spinner"></i>
		    <span class="state">로그인</span>
		  </button>
		</form>
		<footer><span>회원이 아니신가요? </span><a href="/user/join">회원가입</a></footer>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
var working = false;
$('.login').on('submit', function(e) 
{
    e.preventDefault();
    if (working) return;
    working = true;
 
    var $this = $(this),
    $state = $this.find('button > .state');
    $this.addClass('loading');
    $state.html('Authenticating');
  
    setTimeout(function() 
    {
        $this.addClass('ok');
        $state.html('Welcome back!');
        setTimeout(function() 
        {
            $state.html('Log in');
            $this.removeClass('ok loading');
            working = false;
        }, 4000);
    }, 3000);
});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">
    
    <!-- Loading Bootstrap -->
    <link href="dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom JS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- Loading Flat UI -->
    <link href="dist/css/flat-ui.css" rel="stylesheet">

    
    <title>图书基本信息管理模块</title>
  </head>
  
  
  <body>
    <!-- HEADER -->
    <div class="header header-color">
        <div class="container">
            <center><font style="color:#ffffff;font-size:50px;font-family:微软雅黑">图书基本信息管理模块</font></center>
        </div>
    </div>
    <!-- HEADER END -->

    <!--Login Form-->
    <div class="container">
      <div class="row">
        <div class="login-control">
          <form name="loginform" action="LoginServlet" method="post" role="form" onsubmit="return validate(this);">
            <div class="login-form">
            <!--Username-->
              <div class="form-group">
                <input type="text" class="form-control login-field" placeholder="用户名" name="username" id="username" />
                <label class="login-field-icon fui-user" for="username"></label>
              </div>
              <!--Username END-->

              <!--Password-->
              <div class="form-group">
                <input type="password" class="form-control login-field" placeholder="密码" name="pwd" id="pwd" />
                <label class="login-field-icon fui-lock" for="pwd"></label>
              </div>
              <!--Password END-->

              <!-- Login button -->
              <button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>
              <!-- Login button END -->
              <a class="login-link" href="#">管理员登录</a>
            </div>
          </form>
        </div>
      </div>
    </div>
	<!-- Login form END -->
	
    <!--Footer-->
    <div class="footer">
        <div class="container">
           <center>
            <p>
                Powered by <a href="http://v3.bootcss.com/" target="_Blank">Bootstrap</a> | Designed by <a href="http://ten-min.com" target="_Blank">Moressette</a> | <a href="http://blog.csdn.net/wangcong9614/" target="_Blank">blog</a> & <a href="http://github.com/Moressette" target="_Blank">Github</a> <br>
                Special thanks to <a href="http://glyphicons.com/">glyphicons</a> | Promote <a href="https://developer.mozilla.org/zh-CN/" target="_Blank">MDN</a> | <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh_TW" target="_Blank">Creative Commons</a>
            </p>
            </center>
        </div>
    </div>
    <!--Footer END-->
    
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalTitle" style="font-family:微软雅黑"></h4>
          </div>
          <div class="modal-body" style="font-family:微软雅黑">
          	<span id="myModalContainer"></span>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal END -->
    
    <!-- Custom JS -->
    <script type="text/javascript">
    <%String title = "用户名错误";%>
    <%String container = "用户名不能为空";%>
		function validate(registerform) {
			if (registerform.username.value == "") {
				document.getElementById("myModalTitle").innerHTML = "登录失败";
				document.getElementById("myModalContainer").innerHTML = "用户名不能为空";
                $("#myModal").modal();
				return false;
			}
			if (registerform.password.value == "") {
				document.getElementById("myModalTitle").innerHTML = "登录失败";
				document.getElementById("myModalContainer").innerHTML = "密码错不能为空";
				$("#myModal").modal();
				return false;
			}      
			return true;
		}
	</script>
    <!-- Custom JS END -->
    <!-- Loading JS -->
    <script src="dist/js/vendor/jquery.min.js"></script>
    <script src="dist/js/flat-ui.min.js"></script>
    <script src="dist/js/application.js"></script>
    <!-- Loading JS -->
  </body>
</html>
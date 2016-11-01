<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
session.getAttribute("book");
response.setContentType("text/html;charset=utf-8");
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8"); 
if((String)session.getAttribute("username") == null){    
	out.println("<script type='text/javascript'>alert('您还没有登录，请先登录');window.location.href='login.jsp'; </script>");
}
%>
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
  
  
  <body style="overflow-x:hidden;">
    <!-- HEADER -->
    <div class="header header-color">
        <div class="container">
            <center><font style="color:#ffffff;font-size:50px;font-family:微软雅黑">图书基本信息管理模块</font></center>
        </div>
    </div>
    <!-- HEADER END -->

	<!-- Navbar -->
    <div class="collapse navbar-default navbar-collapse" id="navbar-collapse-5">
      <ul class="nav navbar-nav">
        <li><a href="AdminServlet" style="font-family:微软雅黑;font-weight:400;font-size:18px;">所有图书</a></li>
        <li><a href="addbooks.jsp" style="font-family:微软雅黑;font-weight:400;font-size:18px;">添加新图书</a></li>
      </ul>
      <form class="navbar-form navbar-left" action="SearchBookServlet" method="post" role="search" id="searchform" onsubmit="return validateSearch(this);">
        <div class="form-group">
          <div class="input-group">
            <input class="form-control" id="search" name="search" type="search" placeholder="图书检索">
            <span class="input-group-btn">
              <button type="submit" class="btn">
                <span class="fui-search"></span>
              </button>
            </span>
          </div>
        </div>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%= session.getAttribute("username")%> <b class="caret"></b></a>
          <ul class="dropdown-menu" style="width:100px;">
            <li><a href="ModifyUserServlet">用户信息修改</a></li>
            <li class="divider"></li>
            <li><a href="LogoutServlet">用户注销</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- Navbar END -->
    
    <!-- ModifyUser form -->
    <div class="container">
        <div class="row">
        <div class="col-md-12" style="margin-top:80px">
            <font style="font-family:微软雅黑;font-size:30px;font-weight:500;"><center>图书信息修改</center></font>
          <form class="form-horizontal modifyuser-control" role="form" id="modifybookForm" name="modifybookForm" action="ModifyBookServlet" method="post" onsubmit="return validate(this);">
            <!-- ISBN -->
            <div class="form-group">
              <label for="isbn" class="col-lg-3 control-label">ISBN</label>
              <div class="col-lg-7">
                <input type="text" class="form-control" id="isbn" name="isbn" value="${book.isbn}">
              </div>
            </div>
            <!-- ISBN END -->
            <!-- bookname -->
            <div class="form-group">
              <label for="bookname" class="col-lg-3 control-label">书名</label>
              <div class="col-lg-7">
                <input type="text" class="form-control" id="bookname" name="bookname" value="${book.bookname}">
              </div>
            </div>
            <!-- bookname END -->
            <!-- author -->
            <div class="form-group">
              <label for="author" class="col-lg-3 control-label">作者</label>
              <div class="col-lg-7">
                <input type="text" class="form-control" id="author" name="author" value="${book.author}">
              </div>
            </div>
            <!-- author END -->
            <!-- press -->
            <div class="form-group">
              <label for="press" class="col-lg-3 control-label">出版社</label>
              <div class="col-lg-7">
                <input type="text" class="form-control" id="press" name="press" value="${book.press}">
              </div>
            </div>
            <!-- press END -->
            <!-- price -->
            <div class="form-group">
              <label for="price" class="col-lg-3 control-label">价格</label>
              <div class="col-lg-7">
                <input type="text" class="form-control" id="price" name="price" value="${book.price}">
              </div>
            </div>
            <!-- price END -->
            <div class="form-group">
              <div class="col-lg-offset-1">
                <button type="submit" class="btn btn-primary">确认修改</button>
                <button type="reset" class="btn btn-primary" style="margin-left:90px">重置修改</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- ModifyUser form END -->
    
    <!--Footer-->
    <div class="admin-footer">
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
	function validate(modifybookForm) {
		if (modifybookForm.isbn.value == "") {
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "ISBN不能为空";
               $("#myModal").modal();
			return false;
		}
		if(isNaN(modifybookForm.isbn.value)) {
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "ISBN必须为数字";
               $("#myModal").modal();
			return false;
		}
		if(modifybookForm.isbn.value.length != 13){
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "ISBN的长度必须为13位";
               $("#myModal").modal();
			return false;
		}
		if (modifybookForm.bookname.value == "") {
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "书名不能为空";
               $("#myModal").modal();
			return false;
		}
		if (modifybookForm.author.value == "") {
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "作者不能为空";
               $("#myModal").modal();
			return false;
		}
		if (modifybookForm.press.value == "") {
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "出版社不能为空";
               $("#myModal").modal();
			return false;
		} 
		if (modifybookForm.price.value == "") {
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "价格不能为空";
               $("#myModal").modal();
			return false;
		}
		if(isNaN(modifybookForm.price.value)) {
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "价格必须为数字";
               $("#myModal").modal();
			return false;
		}
		if((modifybookForm.isbn.value=="${book.isbn}")&&(modifybookForm.bookname.value=="${book.bookname}")&&(modifybookForm.author.value=="${book.author}")&&(modifybookForm.press.value=="${book.press}")&&(modifybookForm.price.value=="${book.price}")){
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "未修改图书信息";
            $("#myModal").modal();
			return false;
		}
		return true;
	}
	</script>
	
	<script type="text/javascript">
	function validateSearch(searchform) {
		if (searchform.search.value == "") {
			document.getElementById("myModalTitle").innerHTML = "检索失败";
			document.getElementById("myModalContainer").innerHTML = "请输入要查找的ISBN或书名";
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
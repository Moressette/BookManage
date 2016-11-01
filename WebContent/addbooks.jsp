<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
        <li class="active"><a href="addbooks.jsp" style="font-family:微软雅黑;font-weight:400;font-size:18px;">添加新图书</a></li>
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
    
    <!-- Add order -->
    <form class="form-horizontal col-md-offset-3 col-md-11 addbookform-control" role="addbookform" id="addbookform" method="post" action="AddBookServlet" onsubmit="return validate(this);">
      <div class="form-group">
        <label for="isbn" class="col-sm-2 control-label" style="font-size: 20px">ISBN</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="isbn" placeholder="在此输入13位ISBN">
        </div>
      </div>

      <div class="form-group">
        <label for="bookname" class="col-sm-2 control-label" style="font-size: 20px">书名</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="bookname" placeholder="在此输入书名">
        </div>
      </div>

      <div class="form-group">
        <label for="author" class="col-sm-2 control-label" style="font-size: 20px">作者</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="author" placeholder="在此输入作者">
        </div>
      </div>

      <div class="form-group">
        <label for="press" class="col-sm-2 control-label" style="font-size: 20px">出版社</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="press" placeholder="在此输入出版社">
        </div>
      </div>

      <div class="form-group">
        <label for="price" class="col-sm-2 control-label" style="font-size: 20px">图书价格</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="price" placeholder="在此输入图书价格">
        </div>
      </div>
      
      <div class="form-group">
        <label for="order_price" class="col-sm-2 control-label" style="font-size: 20px"></label>
        <div class="col-sm-2">
          <button type="submit" class="btn btn-primary btn-lg">添加</button>
        </div>
        <div class="col-sm-2">
          <button type="reset" class="btn btn-primary btn-lg">重置</button>
        </div>
      </div>
       
    </form>
    <!-- Add order END-->
    
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
	function validate(addorderform) {
		if (addbookform.isbn.value == "") {
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "ISBN不能为空";
               $("#myModal").modal();
			return false;
		}
		if(isNaN(addbookform.isbn.value)) {
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "ISBN必须为数字";
               $("#myModal").modal();
			return false;
		}
		if(addbookform.isbn.value.length != 13){
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "ISBN的长度必须为13位";
               $("#myModal").modal();
			return false;
		}
		if (addbookform.bookname.value == "") {
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "书名不能为空";
               $("#myModal").modal();
			return false;
		}
		if (addbookform.author.value == "") {
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "作者不能为空";
               $("#myModal").modal();
			return false;
		}
		if (addbookform.press.value == "") {
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "出版社不能为空";
               $("#myModal").modal();
			return false;
		} 
		if (addbookform.price.value == "") {
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "价格不能为空";
               $("#myModal").modal();
			return false;
		}
		if(isNaN(addbookform.price.value)) {
			document.getElementById("myModalTitle").innerHTML = "添加失败";
			document.getElementById("myModalContainer").innerHTML = "价格必须为数字";
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
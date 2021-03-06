<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav style="position:fixed;z-index: 999;width: 100%;background-color: #25c6fc" class="navbar navbar-default"
     role="navigation">
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
            <a class="navbar-brand" href="admin_main.html" style="font-family: 华文行楷; font-size: 250%; color: white">图书管理系统</a>
        </div>
        <div class="collapse navbar-collapse navbar-top" >
            <ul class="nav navbar-nav navbar-left ">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white">
                        图书管理
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="admin_books.html">全部图书</a></li>
                        <li class="divider"></li>
                        <li><a href="book_add.html">增加图书</a></li>
                    </ul>
                </li>
                 <li class="dropdown">
                                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white">
                                         读者管理
                                         <b class="caret"></b>
                                     </a>
                                     <ul class="dropdown-menu">
                                         <li><a href="allreaders.html">全部读者</a></li>
                                         <li class="divider"></li>
                                         <li><a href="reader_add.html">增加读者</a></li>
                                     </ul>
                                 </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white">
                        阅览室管理
                        <b class="caret"></b>
                    </a>
                         <ul class="dropdown-menu">
                          <li><a href="admin_room_list.html">阅览室</a></li>
                          <li class="dropdown">
                          <li><a href="room_add.html">增加阅览室</a></li>
                          </li>
                          <li class="divider"></li>
                          <li><a href="admin_seat_list.html">座位</a></li>
                          <li class="dropdown">
                          <li><a href="seat_add.html">增加座位</a></li>
                          </li>
                          <li class="divider"></li>
                          <li><a href="admin_all_moment_list.html">时刻表</a></li>
                          <li class="dropdown">
                          <li><a href="moment_add.html">增加时刻</a></li>
                           </li>
                          </ul>
                 </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white">
                        日志管理
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="lendlist.html">借还日志</a></li>
                        <li class="divider"></li>
                        <li><a href="admin_record_list.html">预定日志</a></li>
                    </ul>
                </li>
                <li >
                    <a href="admin_repasswd.html" style="color: white">
                        密码修改
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="login.html" style="color: white">${admin.username}, 已登录</a>
                </li>
                <li><a href="logout.html" style="color: white">退出</a></li>
            </ul>
        </div>
    </div>
</nav>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${readercard.name}的主页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/my.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        })
    </script>
    <style type="text/css">
        .panel{
            background-color: #ffffff63 !important;
        }
        .carousel-indicators{
            padding-left: 110 !important;
        }
        #myCarousel{
            margin-left: 20%;
            width: 60%;
            height: 0%;
            float: left;
            z-index: 100;
            display: inline;
        }
        html,body{
            height:100%;
        }
        body {
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #f17C58, #e94584, #24AADB, #27DBB1, #FFDC18, #FF3706);
            background-size: 600% 100%;
            animation: gradient 16s linear infinite;
            animation-direction: alternate;
        }


        @keyframes gradient {
            0%{
                background-position: 0%
            }
            100%{
                background-position: 100%;
            }
        }
    </style>
</head>
<body >


<div id="header"></div>

<div style="padding: 10px 550px 10px">


</div>
<div style="position: relative;top: 0%">
</div>

<div id="myCarousel" class="carousel slide">
    <ol class="carousel-indicators" style="bottom: -260px;left:45%">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
                <a href="reader_book_detail.html?bookId=14">
                    <img src="img/11.jpg" class="img-responsive center-block" alt="第一张">
                </a>
                </div>
                <div class="item">
                <a href="reader_book_detail.html?bookId=6">
                    <img src="img/6.jpg" class="img-responsive center-block" alt="第二张">
                </a>
                </div>
                <div class="item">
                <a href="reader_book_detail.html?bookId=2">
                    <img src="img/9.jpg" class="img-responsive center-block" alt="第三张">
                    </a>
                </div>

    </div>
    <a class="carousel-control left" href="#myCarousel"
       data-slide="prev">&lsaquo;
    </a>
    <a class="carousel-control right" href="#myCarousel"
       data-slide="next">&rsaquo;
    </a>
</div>
<center>
   <div class="panel panel-default" style="position:relative;top: 258px;width: 53%;margin-left: 0%">
       <div class="panel-heading">
           <h3 class="panel-title">
               公告栏
           </h3>
       </div>
    <div class="panel-body">
        <table class="table table-hover">
            <tbody>
            <c:forEach items="${announcements}" var="announcement">
            <tr>
                <td><a href="reader_announcement_detail.html?announcement_id=<c:out value="${announcement.id}"></c:out>"><c:out value="${announcement.title}"></c:out></td>
                <td><c:out value="${announcement.time}"></c:out></td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</center>
</body>
</html>



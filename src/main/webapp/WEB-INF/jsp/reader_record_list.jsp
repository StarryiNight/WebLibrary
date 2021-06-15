<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>记录</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/my.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
    <style type="text/css">

        html,body{
            height:100%;
        }
        body{
            margin: 0;
            padding: 0;
            font-family: "montserrat";
            background-image: linear-gradient(125deg,#2c3e50,#27ae60,#2980b9,#e74c3c,#8e44ad);
            background-size: 400%;
            animation: bganimation 15s infinite;
        }


        @keyframes bganimation {
            0%{
                background-position: 0% 50%;
            }
            50%{
                background-position: 100% 50%;
            }
            100%{
                background-position: 0% 50%;
            }
        }
    </style>
</head>
<body>
<div id="header"></div>
<c:if test="${!empty info}">
    <script>alert("${info}");window.location.href="roomlist.html"</script>
</c:if>

<div style="position: relative;top: 15%">
<c:if test="${!empty succ}">
    <div class="alert alert-success alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
            ${succ}
    </div>
</c:if>
<c:if test="${!empty error}">
    <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
            ${error}
    </div>
</c:if>
</div>


<div class="panel panel-default" style="position:relative;top: 80px;width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            记录 ${detail.record_id}
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>开始时间</th>
                <th>结束时间</th>
            </tr>
            </thead>
            <tbody>
             <c:set var="flag" value="false"/>
                                <c:forEach var="record" items="${myRecordList}">
                                    <c:if test="${record eq record.record_id}">
                                        <c:set var="flag" value="true"/>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${flag}">
                                    <td><a href="return.html?record_id=<c:out value="${record.record_id}"></c:out>">
                                        <button type="button" class="btn btn-danger btn-xs">取消</button>
                                    </a></td>
                                </c:if>
                                <c:if test="${not flag}">
                                    <c:if test="${record.flag==1}">
                                        <td><a href="record.html?record_id=<c:out value="${record.record_id}"></c:out>">
                                            <button type="button" class="btn btn-primary btn-xs">预定</button>
                                        </a></td>
                                    </c:if>
                                    <c:if test="${record.flag==0}">
                                        <td>
                                            <button type="button" class="btn btn-defalut btn-xs" disabled="disabled">无法预定</button>
                                        </td>
                                    </c:if>
                                </c:if>

                            </tr>

                        </tbody>
        </table>
    </div>
</div>
</body>
</html>
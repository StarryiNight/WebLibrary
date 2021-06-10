<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑记录</title>
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
<body >

<div id="header" style="padding-bottom: 80px"></div>

<div class="col-xs-6 col-md-offset-3" style="position: relative;">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">编辑记录</h3>
        </div>
        <div class="panel-body">
            <form action="record_edit_do.html?seat_id=${detail.seat_id}" method="post" id="recordedit" >

                <div class="input-group">
                    <span  class="input-group-addon">时间段</span>
                    <input type="text" class="form-control" name="rec_id" id="room_id" value="${detail.record_id}">
                </div>
                 <div class="input-group">
                    <span  class="input-group-addon">是否可用</span>
                    <input type="text" class="form-control" name="room_id" id="room_id" value="${detail.room_id}">
                 </div>
                <input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left">
                <script>
                    $("#seatedit").submit(function () {
                        if($("#room_id").val()==''||$("#location").val()==''||$("#seat_sum").val()==''){
                            alert("请填入完整图书信息！");
                            return false;
                        }
                    })
                </script>
            </form>
        </div>
    </div>

</div>

</body>
</html>

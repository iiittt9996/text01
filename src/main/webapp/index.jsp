<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="http://localhost:8080/myweb/">
    <script src="static/jQuery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#btn').click(function () {
                $('#tab').empty();

                $.ajax({
                    url:"student/findStudents.do",
                    type:"post",
                    dataType:"json",
                    success:function (resp) {
                        $.each(resp, function (i, n) {
                            $('#tab').append("<tr><td>"+n.id+"</td><td>"+n.name+"</td><td>"+n.email+"</td><td>"+n.age+"</td></tr>")
                        })
                    }
                })
            })
        })
    </script>
</head>
<body>
    <form action="student/addStudent.do" method="post">
        编号：<input type="text" name="id"><br />
        姓名：<input type="text" name="name"><br />
        邮箱：<input type="text" name="email"><br />
        年龄：<input type="text" name="age"><br/>
        <input type="submit" value="提交"><input type="reset" value="重置">
    </form>

    <button id="btn">查看所有学生</button>
    <table id="tab" border="1">
        <tr><td>编号</td><td>姓名</td><td>邮箱</td><td>年龄</td></tr>
    </table>
</body>
</html>

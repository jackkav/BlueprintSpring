<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.4/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.4/css/bootstrap-theme.min.css"/>
</head>
<body>
<div class="container">
<table class="table table-bordered table-striped">
    <thead>
    <tr>
        <th>Title</th>
        <th>Author</th>
    </tr>
    </thead>
    <tbody>
    <#list resultSet as result>
    <tr>
        <td>${result.title!"Missing"}</td>
        <td>${result.author!"Missing"}</td>
    </tr>
    </#list>
    </tbody>
</table>
</div>
</body>
</html>
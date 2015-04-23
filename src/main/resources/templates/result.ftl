<html>
<body>
<table class="table table-bordered table-striped">
    <thead>
    <tr>
        <th>Title</th>
    </tr>
    </thead>
    <tbody>
    <#list resultSet as result>
    <tr>
        <td>${result.title!"Missing"}</td>
    </tr>
    </#list>
    </tbody>
</table>
</body>
</html>
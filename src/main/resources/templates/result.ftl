<#import "masterTemplate.ftl" as layout />

<@layout.masterTemplate title="Home Page">
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
</@layout.masterTemplate>
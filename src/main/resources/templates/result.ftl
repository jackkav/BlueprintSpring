<#import "masterTemplate.ftl" as layout />
<@layout.masterTemplate title="Home Page">
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
</@layout.masterTemplate>
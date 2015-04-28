<#import "masterTemplate.ftl" as layout />
<@layout.masterTemplate title="Admin Page">
    <h1>Admin Page</h1>
${user!}
<a  href="/logout">Logout</a>
</@layout.masterTemplate>
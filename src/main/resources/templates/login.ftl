<#import "masterTemplate.ftl" as layout />
<@layout.masterTemplate title="Home Page">
<#if error?exists >
<div>
    Invalid username and password.
</div>
</#if>
<#if logout?exists >
<div>
    You have been logged out.
</div>
</#if>
<form action="/login" method="post">
    <div><label> User Name : <input type="text" name="username"/> </label></div>
    <div><label> Password: <input type="password" name="password"/> </label></div>
    <div><input type="submit" value="Sign In"/></div>
    <#--<sec:csrfInput />-->
</form>
</@layout.masterTemplate>
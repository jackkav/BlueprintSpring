<#import "masterTemplate.ftl" as layout />
<@layout.masterTemplate title="Home Page">
<#if true >
<div>
    Invalid username and password.
</div>
</#if>
    <#if false >
    <div>
        You have been logged out.
    </div>
    </#if>

<form action="/login" method="post">
    <div class="control-group">
        <label class="control-label" for="username">User Name</label>
    </div>
    <div class="controls">
        <input type="text" name="username">
    </div>
    <div class="control-group">
        <label class="control-label" for="password">Password</label>
    </div>

    <div class="controls">
        <input type="password" name="password">
    </div>
    <div class="controls">
        <input type="submit" class="btn btn-primary" value="Sign In">
    </div>
    <#--<sec:csrfInput />-->
</form>
</@layout.masterTemplate>
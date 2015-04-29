<#import "masterTemplate.ftl" as layout />
<@layout.masterTemplate title="Registration">
<h1>Registration</h1>
<form name="userForm" action="addUser" method="post" role="form">
    <div class="form-group">
        <input type="text" name="username" class="form-control" placeholder="Username">
    </div>
<#--${errorLog!}-->
<#--<span id="helpBlock" class="help-block">${username_error!}</span>-->
    <#--<div class="form-group">-->
        <#--<input type="email" class="form-control" id="inputEmail" placeholder="Email">-->
    <#--</div>-->
    <#--<div class="form-group">-->
        <#--<input type="email" class="form-control" id="confirmEmail" placeholder="Email">-->
    <#--</div>-->
    <#--<div class="form-group">-->
        <#--<input type="password" class="form-control" id="inputPassword" placeholder="Password">-->
    <#--</div>-->
    <input type="submit" class="btn btn-primary">
</form>
</@layout.masterTemplate>
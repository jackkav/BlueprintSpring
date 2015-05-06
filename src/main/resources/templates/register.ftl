<#--<#assign ingenta=JspTaglibs["/WEB-INF/ingenta-taglib.tld"]>-->
<#--<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"]>-->
<#--<#import "spring.ftl" as spring />-->
<#import "masterTemplate.ftl" as layout />
<@layout.masterTemplate title="Registration">
<h1>Registration</h1>
<#--<@spring.form-->
<#--<form name="userForm" action="addUser" method="post" role="form">-->
    <#--<div class="form-group">-->
        <#--<input type="text" name="username" class="form-control" placeholder="Username">-->
        <#--&lt;#&ndash;<@spring.formInput "username"/>&ndash;&gt;-->
    <#--</div>-->
    <#--<#assign path = "userForm">-->
    <#--<#assign status = springMacroRequestContext.getBindStatus(path)>-->
<#--<#if errorLog?? >-->
    <#--<@spring.showErrors "<br/>"/>-->
<#--</#if>-->
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
    <#--<input type="submit" class="btn btn-primary">-->
<#--</form>-->

    <#--<@spring.showErrors "<br/>" />-->
</@layout.masterTemplate>
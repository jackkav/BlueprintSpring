<#import "login.ftl" as login />
<#macro sidebar>
<div class="col-sm-3 col-sm-offset-1">
    <div class="sidebar-module">
        <ul class="list-unstyled">
            <li>
                <span id="loginBoxToggledOff" class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span>
                <span id="loginBoxToggledOn" style="display: none;" class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
                <a onclick="showLogin()">Sign In</a></li>
            <li id="loginBox" style="display: none;"><@login.loginForm/></li>
            <li class="divider"></li>
            <li><a href="/register">Register</a></li>
            <li><a href="/admin">Admin</a></li>
        </ul>
    </div>
</div>
</#macro>
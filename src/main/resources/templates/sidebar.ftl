<#import "login.ftl" as login />
<#macro sidebar>
<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
    <#--<div class="sidebar-module sidebar-module-inset">-->
        <#--<form class="form-signin">-->
            <#--<h2 class="form-signin-heading">Please sign in</h2>-->
            <#--<label for="inputEmail" class="sr-only">Email address</label>-->
            <#--<input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>-->
            <#--<label for="inputPassword" class="sr-only">Password</label>-->
            <#--<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>-->
            <#--<div class="checkbox">-->
                <#--<label>-->
                    <#--<input type="checkbox" value="remember-me"> Remember me-->
                <#--</label>-->
            <#--</div>-->
            <#--<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>-->
        <#--</form>-->
    <#--</div>-->
    <div class="sidebar-module">
        <ol class="list-unstyled">
            <li>
                <span id="loginBoxToggledOff" class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span>
                <span id="loginBoxToggledOn" style="display: none;" class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
                <a onclick="showLogin()">Sign In</a></li>
            <li id="loginBox" style="display: none;"><@login.loginForm/></li>
            <li class="divider"></li>
            <li><a href="/register">Register</a></li>
        </ol>
    </div>
</div>
</#macro>
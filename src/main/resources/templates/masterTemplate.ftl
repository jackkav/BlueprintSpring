
<#import "nav.ftl" as nav />
<#macro masterTemplate title="defaultTitle">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${title}</title>
    <link rel="stylesheet" href="/webjarslocator/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/webjarslocator/bootstrap/css/bootstrap-theme.min.css"/>
<#--<link rel="stylesheet" href="/webjarslocator/bootswatch/css/bootswatch.min.css"/>-->
</head>
<body>
<div id="header">
<#--Hello ${user!}-->
                <#--<form action="/logout" method="post">-->
                    <#--<input type="submit" value="Sign Out"/>-->
                <#--</form>-->
                <@nav.navigation/>
</div>

<div id="content" class="container"><#nested /></div>

<footer class="footer container">
    <div class="row">
        <div class="col-lg-12">

            <ul class="list-unstyled">
                <li class="pull-right"><a href="#top">Back to top</a></li>
                <li><a href="https://github.com/jackkav/blueprintspring/">GitHub</a></li>
            </ul>
            <p>Made by Jack and 杨冬冬</p>
        </div>
    </div>
</footer>
<!-- JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/webjarslocator/jquery/jquery.min.js"></script>
<script src="/webjarslocator/bootstrap/bootstrap.min.js"></script>
</body>
</html>
</#macro>

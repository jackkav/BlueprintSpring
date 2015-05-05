
<#import "nav.ftl" as nav />
<#import "sidebar.ftl" as sidebar />
<#macro masterTemplate title="defaultTitle">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${title}</title>
    <link rel="stylesheet" href="/webjarslocator/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/non-responsive.css"/>
    <link rel="stylesheet" href="/webjarslocator/bootstrap/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="/webjarslocator/datatables/css/jquery.dataTables.css"/>
    <link rel="stylesheet" href="/css/new.css"/>
</head>
<body>
<div id="header">
    <h1 id="logo">
        <a href="/" title="Link to home page" id="homepagelink">
            <img src="/images/aip/aip_logo_transparent.gif" alt="aip"/>
        </a>
    </h1>
    <@nav.navigation/>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-8">
            <div id="content">
            ${something!}
                <#nested />
            </div>
        </div>
        <@sidebar.sidebar/>
    </div>
</div>
<footer class="footer">
    <div class="container">
        <p>&copy; Company 2014</p>
    </div>
</footer>

<!-- JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<#--<script src="/webjarsjs"></script>-->
<#--<script data-main="/js/app" src="/webjarslocator/requirejs/require.min.js"></script>-->
<script src="/webjarslocator/jquery/jquery.min.js"></script>
<script src="/webjarslocator/bootstrap/bootstrap.min.js"></script>
<script src="/webjarslocator/datatables/jquery.dataTables.min.js"></script>
<script src="/js/app.js"></script>

</body>
</html>
</#macro>

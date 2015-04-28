
<#import "nav.ftl" as nav />
<#import "sidebar.ftl" as sidebar />
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
    <link rel="stylesheet" href="/webjarslocator/datatables/css/jquery.dataTables.css"/>
    <link rel="stylesheet" href="/css/new.css"/>
</head>
<body>
<div id="header">
    <@nav.navigation/>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-8">
            <div id="content">
            ${something!}
            <#--<@spring.message something />-->
                <#nested />
            </div>
        </div>
        <@sidebar.sidebar/>
    </div>
    <!-- /.row -->



</div>
<footer class="footer">
    <div class="container">
        <p>&copy; Company 2014</p>
    </div>
</footer>
<!-- /.container -->

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

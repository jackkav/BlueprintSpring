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
</head>
<body>
<div id="header">
<#--${messages["layout.greeting"]}-->
    <@nav.navigation/>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-8">
            <div id="content"><#nested /></div>
        </div>
        <@sidebar.sidebar/>
    </div>
    <!-- /.row -->

<footer class="footer">
    <p>&copy; Company 2014</p>
</footer>

</div>
<!-- /.container -->

<!-- JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/webjarsjs"></script>
<script data-main="/js/app" src="/webjarslocator/requirejs/require.min.js"></script>

</body>
</html>
</#macro>

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
            <div id="footer">
                <footer>
                    <div class="row">
                        <div class="col-lg-12">

                            <ul class="list-unstyled">
                                <li class="pull-right"><a href="#top">Back to top</a></li>
                                <li><a href="http://news.bootswatch.com" onclick="pageTracker._link(this.href); return false;">Blog</a></li>
                                <li><a href="http://feeds.feedburner.com/bootswatch">RSS</a></li>
                                <li><a href="https://twitter.com/bootswatch">Twitter</a></li>
                                <li><a href="https://github.com/thomaspark/bootswatch/">GitHub</a></li>
                                <li><a href="../help/#api">API</a></li>
                                <li><a href="../help/#support">Support</a></li>
                            </ul>
                            <p>Made by PT</p>
                        </div>
                    </div>
                </footer>
            </div>
            <!-- JavaScript
            ================================================== -->
            <!-- Placed at the end of the document so the pages load faster -->
            <script src="/webjarslocator/jquery/jquery.min.js"></script>
            <script src="/webjarslocator/bootstrap/bootstrap.min.js"></script>
        </body>
    </html>
</#macro>

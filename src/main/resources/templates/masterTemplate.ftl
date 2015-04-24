<#macro masterTemplate title="defaultTitle">
<!DOCTYPE html
        PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
        <title>${title}</title>
        <link rel="stylesheet" href="webjars/bootstrap/3.3.4/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="webjars/bootstrap/3.3.4/css/bootstrap-theme.min.css"/>
    </head>
    <body>
        <div id="header">Hello User
            <form action="/logout" method="post">
                <input type="submit" value="Sign Out"/>
            </form>
        </div>
        <div id="content"><#nested /></div>
        <div id="footer">Footer</div>
    </body>
</html>
</#macro>

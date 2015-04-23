<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.4/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.4/css/bootstrap-theme.min.css"/>
</head>
<body>

<div class="container">
    <h1>HomePage</h1>
    <form action="/saveXML" method="post" enctype="multipart/form-data">
        <div class="control-group">
            <label class="control-label" for="file">XML File</label>
        </div>

        <div class="controls">
            <input type="file" name="file" multiple="multiple">
        </div>
        <div class="controls">
            <input type="submit" class="btn btn-primary">
        </div>
    </form>
</div>
</body>
</html>
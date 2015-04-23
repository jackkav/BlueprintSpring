<html xmlns:form="http://www.w3.org/1999/html">
<head>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.4/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.4/css/bootstrap-theme.min.css"/>
</head>
<body>

<div class="container">
    <h1>HomePage</h1>
    <form name="search" action="search" method="post">
        <div class="control-group">
            <label class="control-label" for="search">Search</label>
        </div>

        <div class="controls">
            <input type="text" name="query">
        </div>
        <div class="controls">
            <input type="submit" class="btn btn-primary">
        </div>
    </form>
</div>
</body>
</html>
<!DOCTYPE HTML>
<html>
<head>
    <title>Spring Freemarker</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <!--<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet"/>-->
</head>
<body>
<div class="container">
    <div class="control-group">
        <h2 class="muted">Article</h2>

        <form name="article" action="addArticle" method="post">

            <div class="control-group">
                <label class="control-label" for="author">Author</label>
            </div>
            <div class="controls">
                <input type="text" name="author">
            </div>
            <div class="control-group">
                <label class="control-label" for="title">Title</label>
            </div>

            <div class="controls">
                <input type="text" name="title">
            </div>
            <div class="controls">
                <input type="submit" class="btn btn-primary">
            </div>
        </form>
    </div>
    <div>
    <#if articles?size != 0 >
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>Author</th>
                <th>Title</th>
            </tr>
            </thead>
            <tbody>
                <#list articles as article>
                <tr>
                    <td>${article.author!"Missing"}</td>
                    <td>${article.title!"Missing"}</td>
                </tr>
                </#list>
            </tbody>
        </table>
    </#if>
    </div>
</div>
</body>
</html>
<#import "masterTemplate.ftl" as layout />
<@layout.masterTemplate title="Home Page">
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
</@layout.masterTemplate>
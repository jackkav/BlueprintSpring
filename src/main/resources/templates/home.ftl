<#import "masterTemplate.ftl" as layout />

<@layout.masterTemplate title="Home Page">
<div class="container">
    <h1>Home Page</h1>
    <form name="search" action="search" method="post">
        <div class="control-group">
            <label class="control-label" for="query">Search</label>
        </div>

        <div class="controls">
            <input type="text" name="query">
        </div>
        <div class="controls">
            <input type="submit" class="btn btn-primary">
        </div>
    </form>
</div>
</@layout.masterTemplate>
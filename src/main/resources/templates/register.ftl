<#import "masterTemplate.ftl" as layout />
<@layout.masterTemplate title="Registration">
<form name="register" action="addUser" method="post">

    <div class="control-group">
        <label class="control-label" for="username">Username</label>
    </div>
    <div class="controls">
        <input type="text" name="username">
    </div>

    <div class="controls">
        <input type="submit" class="btn btn-primary">
    </div>
</form>
</@layout.masterTemplate>
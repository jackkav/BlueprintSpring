<#macro navigation>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
             <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                    </ul>
                </li>
                <li><a href="/upload">Publications</a></li>
                <li><a href="/wip">Topics</a></li>
                <li><a href="/wip">Collections</a></li>
                <li><a href="/wip">Librarian</a></li>
                <li><a href="/wip">Author</a></li>
            </ul>
            <form class="navbar-form navbar-right" role="search" name="search" action="search" method="post">
                <div class="form-group">
                    <input class="form-control" placeholder="Search" type="text" name="query">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div>
    </div>
</nav>
</#macro>
<#import "masterTemplate.ftl" as layout />
<@layout.masterTemplate title="Home Page">

${greeting!}
${something!}
<div class="row">
    <div class="col-sm-6">
        <img src="http://scitation.aip.org/upload/Scitation/images/particle_detection.jpg">
    </div>
    <div class="col-sm-6">
        <dl>
            <dt>
                New Chip Architecture May Provide Foundation for Quantum Computer
            </dt>
            <dd>
                Researchers at the Georgia Tech Research Institute have developed a microfabricated ion trap architecture...
            </dd>
        </dl>
        <dl>
            <dt>
                New Chip Architecture May Provide Foundation for Quantum Computer
            </dt>
            <dd>
                Researchers at the Georgia Tech Research Institute have developed a microfabricated ion trap architecture...
            </dd>
        </dl>
        <dl>
        <dt>
            New Chip Architecture May Provide Foundation for Quantum Computer
        </dt>
        <dd>
            Researchers at the Georgia Tech Research Institute have developed a microfabricated ion trap architecture...
        </dd>
    </dl>
    </div>
</div>
<div class="row">
    <div class="col-sm-6">
        <h2>Most Recent</h2>
    </div>
    <div class="col-sm-6">
        <h2>Most Read</h2>
    </div>
</div>
<div class="row">
    <div class="col-sm-6">
        <h2>Most Cited</h2>
    </div>
</div>
<h2>Topics</h2>

<div class="row">
    <div class="col-sm-4">
        <ul class="list-unstyled">
            <li>Acoustics</li>
            <li>Astronomy and astrophysics</li>
            <li>Atomic and molecular physics</li>
            <li>Biological physics</li>
            <li>Condensed matter physics</li>
            <li>Energy</li>
            <li>General physics</li>
        </ul>
    </div>
    <div class="col-sm-4">
        <ul class="list-unstyled">
            <li>Geophysics</li>
            <li>Interdisciplinary physics</li>
            <li>Materials science</li>
            <li>Mathematical physics</li>
            <li>Nanotechnology</li>
            <li>Nuclear physics</li>
            <li>Optics and optical physics</li>
        </ul>
    </div>
    <div class="col-sm-4">
        <ul class="list-unstyled">
            <li>Particle physics</li>
            <li>Physical chemistry</li>
            <li>Plasma physics</li>
            <li>Quantum mechanics</li>
            <li>Rheology and fluid dynamics</li>
            <li>Society and organization</li>
            <li>Statistical physics</li>
        </ul>
    </div>
</div>
</@layout.masterTemplate>
<div id="topheader">
  <div class="logo"><img src="${resource(dir:'images',file:'logo.png')}" alt="" /></div>
  <div class="login"><img src="${resource(dir:'images',file:'login_ico.png')}" alt="" width="33" height="28" align="absmiddle" />
    <g:if test="${session['userName'] && session['userName'] != null}">
      <span class="lognlink">Login as  :</span><span style="font-weight: bold"> ${session["userName"]}</span> | <g:link class="detail" style="color:green" controller="login" action="logout">Logout</g:link>
    </g:if>
    <g:else>
      <span class="lognlink">Login as  :</span><span> guest</span> | <g:link class="detail" style="color:green" controller="login" action="index">Login</g:link>
    </g:else></div>
  <div class="clear"></div>
</div> 

<div id="topmenu">
  <ul>
    <li style="padding-left:0px;"><g:link controller="home" class="bold" action="index">HOME</g:link></li>
    <li><img src="${resource(dir:'images',file:'topmenu_devider.jpg')}"/></li>
    <li><g:link controller="seller" class="bold" action="index">SELLER</g:link></li>
      <li><img src="${resource(dir:'images',file:'topmenu_devider.jpg')}"/></li>
      <li><g:link controller="admin" class="bold" action="index">ADMIN</g:link></li>
    <li><img src="${resource(dir:'images',file:'topmenu_devider.jpg')}"/></li>
    <li><g:link controller="food" class="bold" action="index">FOOD BAZAAR</g:link></li>
    <li><img src="${resource(dir:'images',file:'topmenu_devider.jpg')}"/></li>
    <li><g:link controller="bartar" class="bold" action="index">BARTAR</g:link></li>
    <li><img src="${resource(dir:'images',file:'topmenu_devider.jpg')}"/></li>
    <li><g:link controller="home" class="bold" action="orderHistory">ORDER HISTORY</g:link></li>
  </ul>
</div>
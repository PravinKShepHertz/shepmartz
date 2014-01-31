<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'dealbroker_style.css')}" />
    <title>Show Bartar</title>

  </head>

  <body>
    <!-- Start Main Wrapper -->
    <div id="wrapper">
      <!-- Start Top Header -->
      <div id="topheader">
        <div class="logo"><img src="${resource(dir:'images',file:'logo.png')}" alt="" /></div>
        <div class="login"><img src="${resource(dir:'images',file:'login_ico.png')}" alt="" width="33" height="28" align="absmiddle" /> <span class="lognlink">Login as  :</span><span>${login}</span> | <g:link class="detail" style="color:green" action="logout">Logout</g:link></div>
        <div class="clear"></div>
      </div>
      <!-- End Top Header -->

      <!-- Start Top Menu -->
      <div id="topmenu">
        <ul>
          <li style="padding-left:0px;"><a class="home" href="${request.getContextPath()}/home/index">Home</a></li>
          <li><img src="${resource(dir:'images',file:'topmenu_devider.jpg')}"/></li>
          <li><g:link controller="bartar" action="index">Create</g:link></li>
          <li><img src="${resource(dir:'images',file:'topmenu_devider.jpg')}"/></li>
          <li><g:link controller="bartar" action="show">Show</g:link></li>
        </ul>
      </div>
      <!-- End Top Menu -->
      
             
 <g:each in="${list}" status="i" var="category"><br/>
      <div id="content" align="center"><div class="graybox_topbg" align="center"></div>
        <div class="graybox">
          <div class="graybox_conbg">
            <div class="con1" >
                    <div style="float:left; padding-left: 90px;">
                      <g:link url="${category.get('image')}"><img src ="${category.get('image')}" width="175" height="175" align="left" class="img" /></g:link>
                    </div>
                    <div style="float:left; width:350px;"><g:link controller="admin" action="show" class="detail"><h1 style="color: green;"></h1></g:link>
                      <ul>
                        <!--                        <li><b style="color:green">Item Details</b></li>-->
                        <li><h1 style="color: green;"> Item to Sell</h1></li>
                        <li><b>Category Name:</b> ${category.get('catName')}</li>
                        <li><b>Item Name:</b> ${category.get('itemName')}</li>
                        <li><b>Item Description:</b> ${category.get('desc')}</li>
                        
                      </ul><hr/>
                      <ul>
                        <!--                        <li><b style="color:green">Item Details</b></li>-->
                        <li><h1 style="color: green;">Item for Bartar</h1></li>
                        <li><b>Category Name:</b> ${category.get('catName')}</li>
                        <li><b>Item Name:</b> ${category.get('itemName')}</li>
                        <li><b>Item Description:</b> ${category.get('desc')}</li>
                        
                      </ul>
                    </div><div style="clear:left;"></div>
                
            </div>

          </div>
          <div class="graybox_botbg"></div>
        </div>


      </div>
 </g:each>


      <div id="footer">Copyright �2011 ShepertzTecnologies Pvt. Ltd.</div>
    </div>
    <!-- End Main Wrapper -->
  </body>
</html>

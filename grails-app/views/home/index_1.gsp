
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'dealbroker_style.css')}" />
    <title>DealBroker Home</title>
  </head>

  <body>
    <!-- Start Main Wrapper -->
    <div id="wrapper">
      <!-- Start Top Header -->
      <div id="topheader">
        <div class="logo"><img src="${resource(dir:'images',file:'logo.png')}" alt="" /></div>
        <div class="login"><img src="${resource(dir:'images',file:'login_ico.png')}" alt="" width="33" height="28" align="absmiddle" /> <span class="lognlink">Login as  :</span><span>${name}</span> | <g:link class="detail" style="color:green" action="logout">Logout</g:link></div>
        <div class="clear"></div>
      </div>
      <!-- End Top Header -->

      <!-- Start Top Menu -->
     <g:render template="/home/templates/topMenu" />
      <!-- End Top Menu -->
      
<!-- Start Of Portal Menu -->
      <g:render template="/home/templates/portal" />
   <!-- End Of Portal Menu -->

      <div id="mid">
        <div class="graybox">
          <div class="graybox_topbg"><img src="images/arrow.png" width="8" height="10" /> MATCHED BUYER ACTIVITY</div>
          
          <div class="graybox_botbg"></div>
        </div>

        <div class="graybox1">
          <div class="graybox_topbg"><img src="images/arrow.png" width="8" height="10" /> MATCHED SELLER ACTIVITY</div>
          
          <div class="graybox_botbg"></div>
        </div>
      </div>

      <!-- Start Right -->
      <div id="right">
        <div class="sponsored_box">
          <div class="spons_top">SPONSORED</div>
          
          <div class="spons_bot"></div>
        </div>
      </div>
      <div class="clear"></div>

      <!-- Start Footer -->
      <div id="footer">Copyright ©2011 ShepertzTecnologies Pvt. Ltd.</div>
      <!-- End Footer -->
    </div>
    <!-- End Right -->



    <!-- End Main Wrapper -->
  </body>
</html>

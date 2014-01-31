
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'dealbroker_style.css')}" />
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.6.4.js')}"></script>
    <script type='text/javascript'>
    <!--
    (function(){
            document.forms['loginForm'].elements['userName'].focus();
    })();
    // -->
    </script>
    <style type='text/css' media='screen'>
      #login {
        margin:15px 0px; padding:0px;
        text-align:center;
      }
      #login .inner {
        width:260px;
        margin:0px auto;
        text-align:left;
        padding:10px;
        border-top:1px dashed #499ede;
        border-bottom:1px dashed #499ede;
        background-color:#EEF;
      }
      #login .inner .fheader {
        padding:4px;margin:3px 0px 3px 0;color:#2e3741;font-size:14px;font-weight:bold;
      }
      #login .inner .cssform p {
        clear: left;
        margin: 0;
        padding: 5px 0 8px 0;
        padding-left: 105px;
        border-top: 1px dashed gray;
        margin-bottom: 10px;
        height: 1%;
      }
      #login .inner .cssform input[type='text'] {
        width: 120px;
      }
      #login .inner .cssform label {
        font-weight: bold;
        float: left;
        margin-left: -105px;
        width: 100px;
      }
      #login .inner .login_message {color:red;}
      #login .inner .text_ {width:120px;}
      #login .inner .chk {height:12px;}
    </style>
    <script type="text/javascript">

     $(document).ready(function() {
       
      $('#submit').click(function(){
        var error = "false";
        $("#nameErr").hide();
        $("#passErr").hide();
        
       if($.trim($("#username").val()).length == 0){
         $("#nameErr").show();
         error = "true";
       }
        if($.trim($("#password").val()).length == 0){
         $("#passErr").show();
         error = "true";
       }
       
       if(error=="true")
        return false;
       else
        return true;
        
      });
      
      });
     
      
    </script>

    <title>ShepMartz Home</title>
  </head>

  <body>
    <!-- Start Main Wrapper -->
    <div id="wrapper">
      
      <!-- Start Top Menu -->
      <g:render template="/home/templates/topMenu" />
      <!-- End Top Menu -->

      <!-- Start Of Portal Menu -->
      <g:render template="/home/templates/portal" />
      <!-- End Of Portal Menu -->

      <div id="mid">
        <div class="graybox3">
          <div class="graybox_topbg3"><img src="images/arrow.png" width="8" height="10" />ShepMartz Login</div>
          <div class="graybox_conbg3">
            <div class="con3" >
              <div id='login'>
                <div class='inner'>
                  <g:if test='${flash.message}'>
                    <div class='login_message'>${flash.message}</div>
                  </g:if>
                  <div class='fheader'>
                    <div style="color: red; display: none; font-size: 10px;" id="nameErr">Please Enter Username</div>
                    <div style="color: red; display: none; font-size: 10px;" id="passErr">Please Enter Password</div>
                  </div>
                  <form action="save" method='POST' id='loginForm' class='cssform' autocomplete='on'>
                    <p>
                      <label for='username'>Username</label>
                      <input type='text' class='text_' value="${params?.userName}" name='userName' id='username' />
                    </p>
                    <p>
                      <label for='password'>Password</label>
                      <input type='password' class='text_' name='password' id='password' />
                    </p>
                    <p>
                      <input type='submit' value='Login' name="submit" id="submit"/> 
                      <g:link controller="register" class="details" action="index">Register</g:link>
                
                    </p>
                  </form>
                 </div>
              </div>
            </div>
          </div>
          <div class="graybox_botbg3"></div>
        </div>

<div class="graybox1">
                            <div class="graybox_topbg"><img src="images/arrow.png" width="8" height="10" /> Buy Products</div>
                            <div class="graybox_conbg">
                              <div class="con1" >
                                <g:each in="${catInstance.getCategoryList()}" status="i" var="buyer">
                                  <g:each in="${buyer.getItemList()}" status="j" var="item">
                                    <g:if test="${i<5 && j<5}">
                                      <div class="ml">
                                        <div style="float:left;">
                                          <g:link controller="home" action="show" id="${item.getItemId()}" params="[category: buyer.getName()]" class="detail">
                                          <g:if test="${(item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == 'jp') || (item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == 'pn')}">
                                            <img src ="${request.getContextPath()}/images/shepmartz/${item.getName()}/${item.getName()}.${item.getUrl().substring(item.getUrl().lastIndexOf(".")+1,item.getUrl().size())}g" width="75" height="75" align="left" class="img" />
                                          </g:if>
                                          <g:elseif test="${(item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == 'jpg') || (item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == 'png')}">
                                            <img src ="${request.getContextPath()}/images/shepmartz/${item.getName()}/${item.getName()}.${item.getUrl().substring(item.getUrl().lastIndexOf(".")+1,item.getUrl().size())}" width="75" height="75" align="left" class="img" />
                                          </g:elseif>
                                          <g:elseif test="${(item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == '') || (item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == '')}">
                                            <img src ="${request.getContextPath()}/images/shepmartz/${item.getName()}/${item.getName()}.jpg" width="75" height="75" align="left" class="img" />
                                          </g:elseif>
                                          <g:else>
                                            <img src ="${request.getContextPath()}/images/shepmartz/${item.getName()}/${item.getName()}.jpg" width="75" height="75" align="left" class="img" />
                                          </g:else>
                                          </g:link>
                                        </div>
                                        <div style="float:left; width:350px;"><g:link controller="home" action="show" id="${item.getItemId()}" params="[category: buyer.getName()]" class="detail"><h1>Category: <b style="color: green;">${buyer.getName()}</b></h1></g:link>
                                          <ul>
                                            <li><b style="color:green">Item Details</b></li>
                                            <li><b>Item Name:</b> ${item.getName()}</li>
                                            <li><b>Item Id:</b> ${item.getItemId()}</li>
                                            <li><b>Price:</b> ${item.getPrice()}</li>
                                          </ul>
                                        </div><br/>
                                        <div style="clear:left;"></div>
                                        <div><b>Description:</b>&nbsp;&nbsp; ${item.getDescription()}</div>
                                        <hr/><br/>

                                      </div>
                                    </g:if>                                         </g:each>
                                </g:each>
                              </div>
                            </div>
                            <div class="graybox_botbg"></div>
                          </div>
      </div>

      <!-- Start Right -->
      <div id="right">
        <div class="sponsored_box">
          <div class="spons_top">SPONSORED</div>
          <div class="spons_con">
            <g:each in="${catInstance.getCategoryList()}" status="i" var="buyer">
              <g:each in="${buyer.getItemList()}" status="j" var="item">
                <g:if test="${item.getPrice() > new BigDecimal(10000)}">
                  <div class="con" >
                    <div style="float:left;">
                      <g:link controller="home" action="show" id="${item.getItemId()}" params="[category: buyer.getName()]" class="detail">
                        <g:if test="${(item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == 'jp') || (item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == 'pn')}">
                          <img src ="${request.getContextPath()}/images/shepmartz/${item.getName()}/${item.getName()}.${item.getUrl().substring(item.getUrl().lastIndexOf(".")+1,item.getUrl().size())}g" width="75" height="75" align="left" class="img" />
                        </g:if>
                        <g:elseif test="${(item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == 'jpg') || (item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == 'png')}">
                          <img src ="${request.getContextPath()}/images/shepmartz/${item.getName()}/${item.getName()}.${item.getUrl().substring(item.getUrl().lastIndexOf(".")+1,item.getUrl().size())}" width="75" height="75" align="left" class="img" />
                        </g:elseif>
                        <g:elseif test="${(item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == '') || (item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == '')}">
                          <img src ="${request.getContextPath()}/images/shepmartz/${item.getName()}/${item.getName()}.jpg" width="75" height="75" align="left" class="img" />
                        </g:elseif>
                        <g:else>
                          <img src ="${request.getContextPath()}/images/shepmartz/${item.getName()}/${item.getName()}.jpg" width="75" height="75" align="left" class="img" />
                        </g:else>
                      </g:link>
                    </div>
                    <div style="float:left; width:100px;"><g:link controller="home" action="show" id="${item.getItemId()}" params="[category: buyer.getName()]" class="detail"><h1>Category: <b style="color: green;">${buyer.getName()}</b></h1></g:link>
                      <b>Item Name: </b>${item.getName()}</div>
                    <b>price: </b>${item.getPrice()}<div style="clear:left;"></div>
                  </div>
                </g:if>
              </g:each>
            </g:each>
          </div>
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

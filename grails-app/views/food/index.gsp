<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'dealbroker_style.css')}" />
    <g:set var="entityName" value="${message(code: 'portal.label', default: 'Portal')}" />
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.6.4.js')}"></script>
    <title>Shephertz Market</title>
    <script type="text/javascript">
      function numbersonly(e, decimal) {

                var key;
                var keychar;

                if (window.event) {
                   key = window.event.keyCode;
                }
                else if (e) {
                   key = e.which;
                }
                else {
                   return true;
                }
                keychar = String.fromCharCode(key);

                if ((key==null) || (key==0) || (key==8) ||  (key==9) || (key==13) || (key==27) ) {
                   return true;
                }

                else if ((("0123456789").indexOf(keychar) > -1)) {
                   return true;
                }
                else if (decimal && (keychar == ".")) {
                  return true;
                }
                else
                   return false;
                }
                
    </script>
  </head>

  <body>
    <!-- Start Main Wrapper -->
    <div id="wrapper">
       <!-- Start Top Menu -->
      <g:render template="/home/templates/topMenu" />
      <!-- End Top Menu -->
      <g:if test="${flash.message}">
        <div class="message" style=" color:red" align="center">${flash.message}</div><br/>
      </g:if>
      <g:else>
        <h1 style="font-family: Ubuntu; font-size: 20px; color:green" align="center">FOOD BAZAAR</h1><br/>
        <img src="${resource(dir:'images',file:'poster2.jpg')}" width="1020" height="400"/><!-- End Top Menu -->
        <br/><br/><g:each in="${itemList.getCategoryList()}" var="collect">
          <g:each in="${collect.getItemList()}" var="item">
            <div id="content">

              <div id="dialog" >


                <div>
                  <g:if test="${(item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == 'jp') || (item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == 'pn')}">
                    <img src ="${request.getContextPath()}/images/shepmartz/${item.getName()}/${item.getName()}.${item.getUrl().substring(item.getUrl().lastIndexOf(".")+1,item.getUrl().size())}g" width="175" height="75" align="left" class="img" />
                  </g:if>
                  <g:elseif test="${(item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == 'jpg') || (item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == 'png')}">
                    <img src ="${request.getContextPath()}/images/shepmartz/${item.getName()}/${item.getName()}.${item.getUrl().substring(item.getUrl().lastIndexOf(".")+1,item.getUrl().size())}" width="175" height="175" align="left" class="img" />
                  </g:elseif>
                  <g:elseif test="${(item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == '') || (item.getUrl().substring(item.getUrl().lastIndexOf('.')+1,item.getUrl().size()) == '')}">
                    <img src ="${request.getContextPath()}/images/shepmartz/${item.getName()}/${item.getName()}.jpg" width="175" height="175" align="left" class="img" />
                  </g:elseif>
                  <g:else>
                    <img src ="${request.getContextPath()}/images/shepmartz/${item.getName()}/${item.getName()}.jpg" width="175" height="175" align="left" class="img" />
                  </g:else>
                </div>
                <br/>

                <br/> <label><span class="name">Item Name</span></label>
                <div>${item.getName()}</div>

                <br/>   <label><span class="name">Item Id</span></label>
                <div>${item.getItemId()}</div>

                <br/>  <label><span class="name">Description </span></label>
                <div>${item.getDescription()}</div>

                <br/>  <label><span class="name">Price </span></label>
                <div style="font-size: 18px;">${item.getPrice()}<span style="font-size: 12px;">/kg</span></div>

                <br/>  
                <g:form controller="home" action="addItemToCart">
                  <label><span class="name">Quantity </span></label>
                  <div style="font-size: 18px;">
                    <input type="hidden" name="category" value="food" />
                    <input type="hidden" name="catalogue" value="food" />
                    <input type="hidden" name="id" value="${item.getItemId()}" />
                    <input type="text" id="quantity" style="width: 50px;" name="quantity" value="1" onkeypress="return numbersonly(event, false);"/>
                 </div>
                 <div align="right">
                <g:submitButton name="createItem" id="createItem" class="save1 submit_btn" style="width:380px" value="" />
              </div>
                </g:form>

                <div class="spacer"></div>

              </div>

            </div><br/>
          </g:each>
        </g:each>
      </g:else>
      <div id="footer">Copyright �2011 ShepertzTecnologies Pvt. Ltd.</div>
    </div>
    <!-- End Main Wrapper -->
  </body>
</html>

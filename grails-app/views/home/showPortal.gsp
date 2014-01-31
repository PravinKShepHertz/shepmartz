<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'dealbroker_style.css')}" />
    <g:set var="entityName" value="${message(code: 'portal.label', default: 'Portal')}" />
    <title>Show Portal</title>

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
        <h1 style="font-family: Ubuntu; font-size: 20px; color:green" align="center">Portal List</h1><br/>
        <!-- End Top Menu -->
        <g:each in="${itemList.getCategoryList()}" var="collect">
          <g:each in="${collect.getItemList()}" var="item">
            <div id="content">

              <div id="dialog" class="myform">

                <br/> <label><span class="name">Item Name</span></label>
                <div>${item.getName()}</div>

                <br/>   <label><span class="name">Item Id</span></label>
                <div>${item.getItemId()}</div>

                <br/>  <label><span class="name">Description </span></label>
                <div>${item.getDescription()}</div>

                <br/>  <label><span class="name">Price </span></label>
                <div>${item.getPrice()}</div>

                <br/>  <label><span class="name">Item Image </span></label>
                <div>
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
                </div>

                <br/>  
                <div><g:link controller="home" action="addItemToCart" params="[catalogue: 'shepmart', category: itemList.getCategoryList()[0].getName(), id: item.getItemId()]"> <img src="${resource(dir:'images',file:'buy_now.png')}" width="130" height="130"/></g:link></div>

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

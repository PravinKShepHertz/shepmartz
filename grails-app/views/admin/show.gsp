<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'dealbroker_style.css')}" />
    <title>Show Category</title>

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
          <li><g:link controller="admin" action="index">Add Category</g:link></li>
          <li><img src="${resource(dir:'images',file:'topmenu_devider.jpg')}"/></li>
          <li><g:link controller="admin" action="item">Add Item</g:link></li>
          <li><img src="${resource(dir:'images',file:'topmenu_devider.jpg')}"/></li>
          <li><g:link controller="admin" action="show">Show Category</g:link></li>
        </ul>
      </div>
      <!-- End Top Menu -->

      <div id="content">
        <div class="graybox">
          <div class="graybox_conbg">
            <div class="con1" >
              <g:each in="${catalogueList.getCategoryList()}" status="i" var="category"><br/>
                <h1 style="color: black;"> ${i}) Category: <b style="color: green;">${category.getName().toUpperCase()}</b></h1><br/>
                <g:if test="${category.getItemList().size() != 0}">
                  <g:each in="${category.getItemList()}" status="j" var="item">
                    <div style="float:left;">
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
                    <div style="float:left; width:350px;"><g:link controller="admin" action="show" class="detail"><h1 style="color: green;"></h1></g:link>
                      <ul>
                        <!--                        <li><b style="color:green">Item Details</b></li>-->
                        <li><b>Item Name:</b> ${item.getName()}</li>
                        <li><b>Item Id:</b> ${item.getItemId()}</li>
                        <li><b>Item Description:</b> ${item.getDescription()}</li>
                        <li><b>Item Price:</b> ${item.getPrice()}</li><br/>
                        <hr/>
                      </ul>
                    </div><div style="clear:left;"></div>
                  </g:each>
                </g:if>
                <g:else>
                  No Items found in this category
                  <br/>
                </g:else>
              </g:each>
            </div>

          </div>
          <div class="graybox_botbg"></div>
        </div>


      </div>



      <div id="footer">Copyright �2011 ShepertzTecnologies Pvt. Ltd.</div>
    </div>
    <!-- End Main Wrapper -->
  </body>
</html>

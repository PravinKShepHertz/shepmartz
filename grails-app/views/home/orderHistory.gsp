<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" href="${resource(dir:'css',file:'dealbroker_style.css')}" />
    <g:set var="entityName" value="Payment History" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.min.js')}"></script>
    <!-- Table Styeling script -->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script>
                            $(document).ready(function()
                            {
                                    //set the color of the row based on rowindex

                                    $(".report-table-horizontal tr:even").css("background-color", "#c1dded");

                                    $(".report-table-horizontal tr:odd").css("background-color", "#f0f0f6");

                                    //highlight the table titles by selecting the first row

                                    $(".report-table-horizontal tr:first").css("background-color", "#7f7f7f");

                            });
    </script>

    <!-- Table Styeling script -->
  </head>

  <body>
    <!-- Start Main Wrapper -->
    <div id="wrapper">
      <!-- Start Top Menu -->
      <g:render template="/home/templates/topMenu" />
      <!-- End Top Menu -->

      <div id="content">
        <g:if test="${flash.message}">
          <div class="message" style="color:red">${flash.message}</div>
        </g:if><br/>
        <div class="list">
          <g:if test="${items.size() != 0}">
          <h1 align="center" style="font-size:16px; color:green">Payment History</h1><br/>
          <!--          <table class="report-table-horizontal"  width="800" align="center">-->
          <table width="800" align="center">
            <tr style="background-color: rgb(1273, 122, 127);">


              <td>Item Image</td>
              
              <td>Item Name</td>
              
              <td>Item Id</td>

              <td>Price(Rs)</td>

              <td>Quantity</td>

              <td>Status</td>

              <td>Total Amount(Rs)</td>


            </tr>


            <g:each in="${items}" status="i" var="item">
              <tr>
                <td>
                  <g:if test="${(item.get('itemImage').substring(item.get('itemImage').lastIndexOf('.')+1,item.get('itemImage').size()) == 'jp') || (item.get('itemImage').substring(item.get('itemImage').lastIndexOf('.')+1,item.get('itemImage').size()) == 'pn')}">
                    <img src ="${request.getContextPath()}/images/shepmartz/${item.get('itemName')}/${item.get('itemName')}.${item.get('itemImage').substring(item.get('itemImage').lastIndexOf(".")+1,item.get('itemImage').size())}g" width="100" height="100" align="left" class="img" />
                  </g:if>
                  <g:elseif test="${(item.get('itemImage').substring(item.get('itemImage').lastIndexOf('.')+1,item.get('itemImage').size()) == 'jpg') || (item.get('itemImage').substring(item.get('itemImage').lastIndexOf('.')+1,item.get('itemImage').size()) == 'png')}">
                    <img src ="${request.getContextPath()}/images/shepmartz/${item.get('itemName')}/${item.get('itemName')}.${item.get('itemImage').substring(item.get('itemImage').lastIndexOf(".")+1,item.get('itemImage').size())}" width="100" height="100" align="left" class="img" />
                  </g:elseif>
                  <g:elseif test="${(item.get('itemImage').substring(item.get('itemImage').lastIndexOf('.')+1,item.get('itemImage').size()) == '') || (item.get('itemImage').substring(item.get('itemImage').lastIndexOf('.')+1,item.get('itemImage').size()) == '')}">
                    <img src ="${request.getContextPath()}/images/shepmartz/${item.get('itemName')}/${item.get('itemName')}.jpg" width="100" height="100" align="left" class="img" />
                  </g:elseif>
                  <g:else>
                    <img src ="${request.getContextPath()}/images/shepmartz/${item.get('itemName')}/${item.get('itemName')}.jpg" width="100" height="100" align="left" class="img" />
                  </g:else>
                </td> 
                <td> ${item.get('itemName')} </td> 
                <td> ${item.get('itemId')} </td> 
                <td> ${item.get("price")} </td> 
                <td> ${item.get("quantity")} </td> 
                <td> ${item.get("status")} </td> 
                <td> ${item.get("totalPrice")} </td> 
               </tr>
            </g:each>
            <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td> </tr>
            <tr><td></td><td></td><td></td><td></td><td></td><td></td><td style="font-weight: bolder;">Total: ${items[0].get("grandTotal")}</td></tr>
          </table>
          </g:if>
          <g:else>
            <div align="center" style="color: red; font-size: 14px;">No history found yet</div><br/>
          </g:else>
           <div class="spacer"></div>
        </div>

      </div>
    </div>



    <div id="footer">Copyright ©2011 ShepertzTecnologies Pvt. Ltd.</div>
    </div>
    <!-- End Main Wrapper -->
  </body>
</html>

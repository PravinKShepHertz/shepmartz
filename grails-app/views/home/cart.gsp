<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" href="${resource(dir:'css',file:'dealbroker_style.css')}" />
    <g:set var="entityName" value="Cart" />
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
          <g:if test="${items != null}">
          
          <h1 align="center" style="font-size:16px; color:green">Shopping Cart</h1><br/>
          <!--          <table class="report-table-horizontal"  width="800" align="center">-->
          <table width="800" align="center">
            <tr style="background-color: rgb(1273, 122, 127);">


              <td>Item Image</td>

              <td>Category Name</td>

              <td>Item Name</td>

              <td>Item Id</td>

              <td>Price(Rs)</td>

              <td>Quantity</td>

              <td>Total Price(Rs)</td>


            </tr>

          
            <g:each in="${items}" status="i" var="item">
              <tr>
                <td>
                  <g:if test="${(item.get('Item Image').substring(item.get('Item Image').lastIndexOf('.')+1,item.get('Item Image').size()) == 'jp') || (item.get('Item Image').substring(item.get('Item Image').lastIndexOf('.')+1,item.get('Item Image').size()) == 'pn')}">
                    <img src ="${request.getContextPath()}/images/shepmartz/${item.get('Item Name')}/${item.get('Item Name')}.${item.get('Item Image').substring(item.get('Item Image').lastIndexOf(".")+1,item.get('Item Image').size())}g" width="75" height="75" align="left" class="img" />
                  </g:if>
                  <g:elseif test="${(item.get('Item Image').substring(item.get('Item Image').lastIndexOf('.')+1,item.get('Item Image').size()) == 'jpg') || (item.get('Item Image').substring(item.get('Item Image').lastIndexOf('.')+1,item.get('Item Image').size()) == 'png')}">
                    <img src ="${request.getContextPath()}/images/shepmartz/${item.get('Item Name')}/${item.get('Item Name')}.${item.get('Item Image').substring(item.get('Item Image').lastIndexOf(".")+1,item.get('Item Image').size())}" width="75" height="75" align="left" class="img" />
                  </g:elseif>
                  <g:elseif test="${(item.get('Item Image').substring(item.get('Item Image').lastIndexOf('.')+1,item.get('Item Image').size()) == '') || (item.get('Item Image').substring(item.get('Item Image').lastIndexOf('.')+1,item.get('Item Image').size()) == '')}">
                    <img src ="${request.getContextPath()}/images/shepmartz/${item.get('Item Name')}/${item.get('Item Name')}.jpg" width="75" height="75" align="left" class="img" />
                  </g:elseif>
                  <g:else>
                    <img src ="${request.getContextPath()}/images/shepmartz/${item.get('Item Name')}/${item.get('Item Name')}.jpg" width="75" height="75" align="left" class="img" />
                  </g:else>
                </td> 
                <td> ${item.get("Category")} </td> 
                <td> ${item.get('Item Name')} </td> 
                <td> ${item.get("Item Id")} </td> 
                <td> ${item.get("Item Price")} </td> 
                <td> ${item.get("Quantity")} </td> 
                <td style="font-weight: bolder;"> ${new BigDecimal(item.get("Item Price") * (item.get("Quantity")))} </td> 
              </tr>
            </g:each>
            <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td> </tr>
            <tr><td></td><td></td><td></td><td></td><td></td><td></td><td style="font-weight: bolder;">Total: ${total}</td></tr>
          </table>
          <br/><br/> <div style="padding-left: 500px;"><g:link class="detail" style="font-size: 20px;" action="index"> Continue shopping </g:link> | <g:link class="detail" style="font-size: 20px;" id="${cartId}" params="[total: total, catalogue: params.catalogue]" action="details">checkout</g:link>
          </div>
          </g:if>
          <g:else>
            <div align="center" style="color: red; font-size: 14px;">No item found in the cart</div>
          </g:else>
        </div>
      </div>



      <div id="footer">Copyright ©2011 ShepertzTecnologies Pvt. Ltd.</div>
    </div>
    <!-- End Main Wrapper -->
  </body>
</html>

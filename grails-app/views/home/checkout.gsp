<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'dealbroker_style.css')}" />
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.6.4.js')}"></script>
    <title>Checkout</title>
    <script>
      function checkBox(name){
       
      }
      
      $(document).ready(function() {
       var error = "false";
      $('#payment').click(function(){
     
      $("#dialog").show();
      error = false;
      
      if(error=="true")
        return false;
       else
        return true;
      
      });
      });
      
    </script>
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
                
     $(document).ready(function() {
       
      $('#createItem').click(function(){
        var error = "false";
        $("#itemErr").hide();
        $("#itemDescErr").hide();
        $("#itemIdErr").hide();
        $("#fileErr").hide();
        $("#priceErr").hide();
        
       if($.trim($("#itemName").val()).length == 0){
         $("#itemErr").show();
         error = "true";
       }
         if($.trim($("#itemId").val()).length == 0){
         $("#itemIdErr").show();
         error = "true";
       }
       
       if($.trim($("#itemDesc").val()).length == 0){
         $("#itemDescErr").show();
         error = "true";
       }
         
       if(error=="true")
        return false;
       else
        return true;
        
      });
      
      });
     
      
    </script>
  </head>

  <body>
    <!-- Start Main Wrapper -->
    <div id="wrapper">
       <!-- Start Top Menu -->
      <g:render template="/home/templates/topMenu" />
      <!-- End Top Menu -->

      <div id="content">
        <div class="graybox">
          <div class="graybox_conbg">
            <div class="con1" >
              <g:each in="${items}" status="i" var="category"><br/>
                <h1 style="color: black;"> ${i+1}) Category: <b style="color: green;">${category.get("Category").toUpperCase()}</b></h1><br/>
                <div style="float:left;">
                  <g:if test="${(category.get('Item Image').substring(category.get('Item Image').lastIndexOf('.')+1,category.get('Item Image').size()) == 'jp') || (category.get('Item Image').substring(category.get('Item Image').lastIndexOf('.')+1,category.get('Item Image').size()) == 'pn')}">
                    <img src ="${request.getContextPath()}/images/shepmartz/${category.get('Item Name')}/${category.get('Item Name')}.${category.get('Item Image').substring(category.get('Item Image').lastIndexOf(".")+1,category.get('Item Image').size())}g" width="75" height="75" align="left" class="img" />
                  </g:if>
                  <g:elseif test="${(category.get('Item Image').substring(category.get('Item Image').lastIndexOf('.')+1,category.get('Item Image').size()) == 'jpg') || (category.get('Item Image').substring(category.get('Item Image').lastIndexOf('.')+1,category.get('Item Image').size()) == 'png')}">
                    <img src ="${request.getContextPath()}/images/shepmartz/${category.get('Item Name')}/${category.get('Item Name')}.${category.get('Item Image').substring(category.get('Item Image').lastIndexOf(".")+1,category.get('Item Image').size())}" width="75" height="75" align="left" class="img" />
                  </g:elseif>
                  <g:elseif test="${(category.get('Item Image').substring(category.get('Item Image').lastIndexOf('.')+1,category.get('Item Image').size()) == '') || (category.get('Item Image').substring(category.get('Item Image').lastIndexOf('.')+1,category.get('Item Image').size()) == '')}">
                    <img src ="${request.getContextPath()}/images/shepmartz/${category.get('Item Name')}/${category.get('Item Name')}.jpg" width="75" height="75" align="left" class="img" />
                  </g:elseif>
                  <g:else>
                    <img src ="${request.getContextPath()}/images/shepmartz/${category.get('Item Name')}/${category.get('Item Name')}.jpg" width="75" height="75" align="left" class="img" />
                  </g:else>
                </div>
                <div style="float:left; width:350px;"><g:link controller="admin" action="show" class="detail"><h1 style="color: green;"></h1></g:link>
                  <ul>
                    <!--                        <li><b style="color:green">Item Details</b></li>-->
                    <li><b>Item Name:</b> ${category.get("Item Name")}</li>
                    <li><b>Item Id:</b> ${category.get("Item Id")}</li>
                    <li><b>Item Description:</b> ${category.get("Item Description")}</li>
                    <li><b>Item Price:</b> ${category.get("Item Price")}</li>
                    <li><b>Quantity:</b> ${category.get("Quantity")}</li><br/>
                   </ul>
                </div><div style="clear:left;"></div>
              </g:each>
            </div>

          </div>
          <div class="graybox_botbg"></div>
        </div>
        <br/><br/>
        <div><span style="font-weight: bolder; font-size: 36px; color: black;">Grand Total:</span><b style="font-size: 30px; color: green;"> Rs ${total}</b></div>

        <br/><br/>
        <div class="list">
          <h1 align="center" style="font-size:16px; color:green">Shipping Address</h1><br/>
          <!--          <table class="report-table-horizontal"  width="800" align="center">-->
          <table width="800" align="center">
            <tr style="background-color: rgb(1273, 122, 127);">



              <td>Full name</td>

              <td>Address</td>

              <td>Country</td>

              <td>State</td>

              <td>City</td>

              <td>Pincode</td>

              <td>Mobile</td>

              <td>Select Address</td>


            </tr>


            <g:each in="${address}" status="i" var="category">
              <tr>
                <td> ${category.get("name")} </td> 
                <td> ${category.get("address")} </td> 
                <td> ${category.get("country")} </td> 
                <td> ${category.get("state")} </td> 
                <td> ${category.get("city")} </td> 
                <td> ${category.get("pin")} </td> 
                <td> ${category.get("mobile")} </td> 
                <td><input name="check" type="radio" id="check" onclick="checkBox()"/></td>
              </tr>
            </g:each>
          </table></div>
        <br/><br/>
        <div style="padding-left: 370px;">
          <a href="#" id="payment" class="details"><img src="${resource(dir:'images',file:'payment.jpg')}"/></a>
        </div>
<br/><br/>
        <div id="dialog" class="myform" style="display: none;">
          <div id="itemBox" >
            <g:form id="form" name="form" action="makePayment" >
              <h1 style="font-size:16px; color:green">Add Card Details</h1>
              <p>&nbsp;</p>

              <g:if test="${flash.message}">
                <div class="message" style="color:red">${flash.message}</div>
              </g:if>
              <div style="color: red; display: none;" id="itemErr">Please Enter Card Number</div>
              <div style="color: red; display: none;" id="itemDescErr" >Please Enter Name on Card</div>
              <div style="color: red; display: none;" id="itemIdErr" >Please Enter CVV number</div><br/>

              <label><span class="name">Card Type</span></label>
              <div valign="top">
               &nbsp;&nbsp;&nbsp;<img src="https://secure.payu.in/images/visa-master_card.gif" />
              </div>
              <input type="hidden" name="total" value="${total}" />
              <input type="hidden" name="cartId" value="${cartId}" />
              <br/><label><span class="name">Name on Card </span></label>
              <div valign="top">
                <g:textField name="name" value="" id="itemDesc"/>
              </div>

              <label><span class="name">Card Number</span></label>
              <div valign="top" >
                <g:textField name="cardNumber" value="" id="itemName" onkeypress="return numbersonly(event, false);"/>
              </div>

              <label><span class="name">CVV Number</span></label>
              <div valign="top" >
                <g:textField name="cvv" value="" id="itemId" onkeypress="return numbersonly(event, false);"/>
              </div>

              <label><span class="name">Expiry Date</span></label>
              <div valign="top" >
                <g:select name="month" from="${month}" value="" />&nbsp;&nbsp;
                <g:select name="year" from="${year}" value="" />
              </div>

              <div align="right">
                <g:submitButton name="createItem" id="createItem" class="save submit_btn" style="width:380px" value="Make Payment" />
              </div>

              <div class="spacer"></div>

            </g:form>
          </div>

          <br/>
        </div>

      </div>

    </div>



    <div id="footer">Copyright �2011 ShepertzTecnologies Pvt. Ltd.</div>
    </div>
    <!-- End Main Wrapper -->
  </body>
</html>

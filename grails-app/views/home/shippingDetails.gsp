<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'dealbroker_style.css')}" />
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.6.4.js')}"></script>
    <title>Admin</title>
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
        if($.trim($("#price").val()).length == 0){
         $("#priceErr").show();
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
       
       if($.trim($("#file").val()).length == 0){
         $("#fileErr").show();
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

        <div id="dialog" class="myform">
          <div id="itemBox" >
            <g:form id="form" name="form" action="saveAddress">
              <h1 style="font-size:16px; color:green">Add New Shipping Address</h1>
              <p>&nbsp;</p>

              <g:if test="${flash.message}">
                <div class="message" style="color:red">${flash.message}</div>
              </g:if>
              <br/>
              <div style="color: red; display: none;" id="itemErr">Please Enter Your Name</div>
              <div style="color: red; display: none;" id="itemDescErr" >Please enter your mobile</div>
              <div style="color: red; display: none;" id="itemIdErr" >Please Enter your address</div>
              <div style="color: red; display: none;" id="fileErr" >Please enter your city</div>
              <div style="color: red; display: none;" id="priceErr" >Please enter your pincode</div><br/>


              <label><span class="name">Full Name</span></label>
              <div valign="top" >
                <g:textField name="name" value="" id="itemName"/>
              </div>

              <label><span class="name">Address</span></label>
              <div valign="top" >
                <g:textArea name="address" value="" id="itemId"/>
              </div>

              <label><span class="name">City</span></label>
              <div valign="top" >
                <g:textField name="city" value="" id="file"/>
              </div>

              <label><span class="name">Country</span></label>
              <div valign="top">
                <select name="country">
                  <option value="india">India</option>
                </select>
              </div>

              <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><label><span class="name">State</span></label>
              <div valign="top">
                <g:select name="state" from="${list}" value="" />
              </div>

              <label><span class="name">Pincode</span></label>
              <div valign="top" >
                <g:textField name="pin" value="" id="price" onkeypress="return numbersonly(event, false);"/>
              </div>

              <label><span class="name">Mobile</span></label>
              <div valign="top" >
                <g:textField name="mobile" value="" id="itemDesc" onkeypress="return numbersonly(event, false);"/>
              </div>


              <div align="right">
                <g:submitButton name="createItem" id="createItem" class="save submit_btn" style="width:380px" value="Ship to this Address" />
              </div>
              <input type="hidden" name="catalogue" value="${params.catalogue}" />
              <input type="hidden" name="cartId" value="${params.cartId}" />
<div class="spacer"></div>

            </g:form>
<!--            <g:link action="checkout" params="[catalogue: params.catalogue]"><g:submitButton name="skip" id="skip" class="save submit_btn" style="width:380px" value="Already Have one" /></g:link>
            -->
          </div>


        </div>

      </div>



      <div id="footer">Copyright �2011 ShepertzTecnologies Pvt. Ltd.</div>
    </div>
    <!-- End Main Wrapper -->
  </body>
</html>

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
          <li style="padding-left:0px;"><a class="home" href="${request.getContextPath()}/admin/index">Add Category</a></li>
          <li><img src="${resource(dir:'images',file:'topmenu_devider.jpg')}"/></li>
          <li><a class="back" href="${request.getContextPath()}/admin/item">Add Item</a></li>
          <li><img src="${resource(dir:'images',file:'topmenu_devider.jpg')}"/></li>
          <li><g:link controller="admin" action="show">Show Category</g:link></li>
        </ul>
      </div>
      <!-- End Top Menu -->

      <div id="content">

        <div id="dialog" class="myform">
          <div id="itemBox" >
            <g:form id="form" name="form" action="saveItem" enctype="multipart/form-data">
              <h1 style="font-size:16px; color:green">Add Item</h1>
              <p>&nbsp;</p>

                <g:if test="${flash.message}">
                  <div class="message" style="color:red">${flash.message}</div>
                </g:if>
                <br/>
                <div style="color: red; display: none;" id="itemErr">Please Enter Item Name</div>
                <div style="color: red; display: none;" id="itemDescErr" >Please Enter Item Description</div>
                <div style="color: red; display: none;" id="itemIdErr" >Please Enter Item Id</div>
                <div style="color: red; display: none;" id="fileErr" >Please upload a file</div>
                <div style="color: red; display: none;" id="priceErr" >Please enter item price</div><br/>

                <label><span class="name">Category </span></label>
                <div valign="top">
                  <g:select name="categoryName" from="${categoryList}" value="${params?.categoryName}" />
                </div>

                <label><span class="name">Item Name</span></label>
                <div valign="top" >
                  <g:textField name="itemName" value="${params?.itemName}" id="itemName"/>
                </div>

                <label><span class="name">Item Id</span></label>
                <div valign="top" >
                  <g:textField name="itemId" value="${params?.itemId}" id="itemId"/>
                </div>

                <label><span class="name">Price</span></label>
                <div valign="top" >
                  <g:textField name="price" value=${params?.price}"" id="price" onkeypress="return numbersonly(event, false);"/>
                </div>
                
                <label><span class="name">Item Description </span></label>
                <div valign="top" >
                  <g:textArea name="itemDesc" value="${params?.itemDesc}" id="itemDesc"/>
                </div>

                <label><span class="name">Item Image </span></label>
                <div valign="top" >
                  <input type="file" name="file" id="file">
                </div>


              <div align="right">
                <g:submitButton name="createItem" id="createItem" class="save submit_btn" style="width:380px" value="Add Item" />
              </div>

              <div class="spacer"></div>

            </g:form>
          </div>


        </div>

      </div>



      <div id="footer">Copyright �2011 ShepertzTecnologies Pvt. Ltd.</div>
    </div>
    <!-- End Main Wrapper -->
  </body>
</html>

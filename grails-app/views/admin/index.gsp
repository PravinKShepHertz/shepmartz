<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'dealbroker_style.css')}" />
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.6.4.js')}"></script>
    <title>Admin</title>
<script type="text/javascript">
      function showItem(){
         
         $("#category").hide();
         $("#itemBox").show();
         $("#itemShow").show();
         
       }
     $(document).ready(function() {
       
      $('#create').click(function(){
        var error = "false";
        $("#nameErr").hide();
        $("#descErr").hide();
        
       if($.trim($("#catName").val()).length == 0){
         $("#nameErr").show();
         error = "true";
       }
       
       if($.trim($("#catDesc").val()).length == 0){
         $("#descErr").show();
         error = "true";
       }
       
//       if(($.trim($("#catName").val()).length != 0) && ($.trim($("#catDesc").val()).length != 0))
//         {
//           
//           addCategory($.trim($("#catName").val()), $.trim($("#catDesc").val()))
//           error = "true"
//         }
      
       if(error=="true")
        return false;
       else
        return true;
        
      });
      
      });
     
      
    </script>
    
    
    <script type="text/javascript" language="javascript">
   var contextPath = "${request.getContextPath()}"
   function addCategory(name, desc){
       var error = 'false';
       $.ajax({
        type: "POST",
        async: false,
        dataType: 'json',
        url: contextPath+'/admin/addCategory',
        data:"name="+name+"&desc="+desc,
        complete: function(data){
          if(data.responseText=="true"){
           $('#category').show();
           $("#catName").val() = "";
           $("#catDesc").val() = "";
          // $('#itemBox').show();
          // $('#itemShow').show();
           error = "true";
          //  error = "true";
          }
          else{
            error = "true"
            var errorMsg = "Category Name already exists";
            $("#nameErr").show();
            $("#nameErr").html(errorMsg);
          }
        }
       });
       if(error=="true")
       {
          return false;
       }
       else{
       return true;
       }
    }
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
          <li><a class="back"  href="${request.getContextPath()}/admin/item">Add Item</a></li>
          <li><img src="${resource(dir:'images',file:'topmenu_devider.jpg')}"/></li>
          <li><g:link controller="admin" action="show">Show Category</g:link></li>
        </ul>
      </div>
      <!-- End Top Menu -->

      <div id="content">
  
        <div id="dialog" class="myform">
           <div id="category" >
          <g:form id="form" name="form" action="save">
            <h1 style="font-size:16px; color:green">Add Category</h1>
            <p>&nbsp;</p>
            <g:if test="${flash.message}">
            <div class="message" style="color:red">${flash.message}</div>
            </g:if>
            <br/>
            <div style="color: red; display: none;" id="nameErr">Please Enter Category Name</div>
            <div style="color: red; display: none;" id="descErr" >Please Enter Category Description</div>
            <br/>
            
            <label><span class="name">Category Name</span></label>
              <div valign="top" >
                <g:textField name="categoryName" value="" id="catName"/>
              </div>

            <label><span class="name">Category Description </span></label>
              <div valign="top" >
                <g:textArea name="catDescription" value="" id="catDesc"/>
              </div>
             <div align="right">
              <g:submitButton name="create" class="save submit_btn" style="width:380px" value="${message(code: 'default.button.create.label', default: 'Create')}" />
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

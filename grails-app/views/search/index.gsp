



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" href="${resource(dir:'css',file:'dealbroker_style.css')}" />
    <title>Search</title>
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
    <script >
          function showSearch(){
          var search = $("#advancedSearch");
          search.show();
        }
    </script>
    <!-- Table Styeling script -->
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
          <li style="padding-left:0px;"><a class="home" href="${request.getContextPath()}/home">Home</a></li>
        </ul>
      </div>
      <!-- End Top Menu -->

      <div id="content">
        <g:if test="${flash.message}">
          <div class="message" style="color:red">${flash.message}</div>
        </g:if>
        <g:form controller="search" action="searchResult">
          <table border="1" align="center" width="150">
            <tr><td> <input type="text" name="search"/>
                <g:submitButton name="Search" />
                <div class="nav">   &nbsp; <a href="#" onclick="showSearch();"> Advanced Search</a></div>
              </td></tr>
          </table></g:form>
        <g:if test="${flash.message1}">
          <div class="message" style="color:red">${flash.message1}</div>
        </g:if>

        <div>
          <g:form controller="search" class="detail" action="advanceSearch">
            <div id="advancedSearch" style="display: none;">
              <div class="list">
                <table class="report-table-horizontal" width="800" align="center" >
                  <tr>
                    <td valign="top" bgcolor="#f0f0f6" >
                      Search For 
                      <br/> <br/>Category &nbsp;&nbsp;&nbsp;<g:select style="width:141px" name="t1" from="${list}" value="${params.category}" />
                        <br/><br/> Location  &nbsp;&nbsp;&nbsp; <input type="text" name="t3"/>
                        <br/><br/> <g:submitButton name="Find"/>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
          </g:form>
        </div>

      </div>
      <div id="footer">Copyright ©2011 ShepertzTecnologies Pvt. Ltd.</div>
    </div>
    <!-- End Main Wrapper -->
  </body>
</html>

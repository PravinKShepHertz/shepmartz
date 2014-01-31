
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'dealbroker_style.css')}" />
    <script type="text/javascript" src="${resource(dir:'js/bazaar',file:'jquery-1.6.1.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js/bazaar',file:'bazaar.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js/bazaar',file:'topSlider1.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js/bazaar',file:'topSlider2.js')}"></script>
    <script type="text/javascript">
                            $(document).ready(function(){
                                    $('#slider1').bxSlider({
                                            infiniteLoop: true,
                                            auto: true,
                                            speed:2500,
                                            autoHover:true,
                                            pause: 5000,
                                            pager: false
                                    });
                            });
    </script>
    <link rel="stylesheet" href="${resource(dir:'css/bazaar',file:'carusol_style.css')}" />
    <script type="text/javascript" src="${resource(dir:'js/bazaar',file:'jquery.carouFredSel-4.0.2-packed.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js/bazaar',file:'mycarosuel.js')}"></script>
    <script type="text/javascript">
            function ShowHideImage1(flag)
            {
                if(flag)
                {
                    document.getElementById('imgPrev1').src = 'images/bazaar/prev.png';
                    document.getElementById('imgNext1').src = 'images/bazaar/next.png';
                }
                else
                {
                    document.getElementById('imgPrev1').src = 'images/bazaar/blank.png';
                    document.getElementById('imgNext1').src = 'images/bazaar/blank.png';
                }
            }
            function ShowHideImage2(flag)
            {
                if(flag)
                {
                    document.getElementById('imgPrev2').src = 'images/bazaar/prev.png';
                    document.getElementById('imgNext2').src = 'images/bazaar/next.png';
                }
                else
                {
                    document.getElementById('imgPrev2').src = 'images/bazaar/blank.png';
                    document.getElementById('imgNext2').src = 'images/bazaar/blank.png';
                }
            }
            function ShowHideImage3(flag)
            {
                if(flag)
                {
                    document.getElementById('imgPrev3').src = 'images/bazaar/prev.png';
                    document.getElementById('imgNext3').src = 'images/bazaar/next.png';
                }
                else
                {
                    document.getElementById('imgPrev3').src = 'images/bazaar/blank.png';
                    document.getElementById('imgNext3').src = 'images/bazaar/blank.png';
                }
            }
            function ShowHideImage4(flag)
            {
                if(flag)
                {
                    document.getElementById('imgPrev4').src = 'images/bazaar/prev.png';
                    document.getElementById('imgNext4').src = 'images/bazaar/next.png';
                }
                else
                {
                    document.getElementById('imgPrev4').src = 'images/bazaar/blank.png';
                    document.getElementById('imgNext4').src = 'images/bazaar/blank.png';
                }
            }

    </script>    
    <title>ShepMartz Home</title>
  </head>

  <body>
    <!-- Start Main Wrapper -->
    <div id="wrapper">
            <!-- Start Top Menu -->
      <g:render template="/home/templates/topMenu" />
      <!-- End Top Menu -->

      <!-- Start Of Portal Menu -->
      <g:render template="/home/templates/portal" />
      <!-- End Of Portal Menu -->

      <div id="mid">
        <div class="graybox">
          <div class="graybox_topbg"><img src="images/arrow.png" width="8" height="10" /> Top Products</div>
          <div class="graybox_conbg">
            <div class="con1" >
              <div class="slider_panel">
                <ul id="slider1">
                  <g:each in="${catInstance.getCategoryList()}" status="i" var="buyer">
                    <g:each in="${buyer.getItemList()}" var="item">
                      <li>
                        <div class="ml">
                          <div style="float:left;">
                            <g:link controller="home" action="show" id="${item.getItemId()}" params="[category: buyer.getName()]" class="detail">
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
                          </g:link>
                          </div>
                          <div style="float:left; width:350px;"><g:link controller="home" action="show" id="${item.getItemId()}" params="[category: buyer.getName()]" class="detail"><h1>Category: <b style="color: green;">${buyer.getName()}</b></h1></g:link>
                            <ul>
                              <li><b style="color:green">Item Details</b></li>
                              <li><b>Item Name:</b> ${item.getName()}</li>
                              <li><b>Item Id:</b> ${item.getItemId()}</li>
                              <li><b>Price:</b> ${item.getPrice()}</li>
                            </ul>
                          </div><br/>
                          <div style="clear:left;"></div>
                          <div><b>Description:</b>&nbsp;&nbsp; ${item.getDescription()}</div>

                        </div>
                        <li>

                          </g:each>
                          </g:each>
                          </u1>
                          </div>
                          </div>
                          </div>
                          <div class="graybox_botbg"></div>
                          </div>

                          <div class="graybox1">
                            <div class="graybox_topbg"><img src="images/arrow.png" width="8" height="10" /> Buy Products</div>
                            <div class="graybox_conbg">
                              <div class="con1" >
                                <g:each in="${catInstance.getCategoryList()}" status="i" var="buyer">
                                  <g:each in="${buyer.getItemList()}" status="j" var="item">
                                    <g:if test="${i<5 && j<5}">
                                      <div class="ml">
                                        <div style="float:left;">
                                          <g:link controller="home" action="show" id="${item.getItemId()}" params="[category: buyer.getName()]" class="detail">
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
                                          </g:link>
                                        </div>
                                        <div style="float:left; width:350px;"><g:link controller="home" action="show" id="${item.getItemId()}" params="[category: buyer.getName()]" class="detail"><h1>Category: <b style="color: green;">${buyer.getName()}</b></h1></g:link>
                                          <ul>
                                            <li><b style="color:green">Item Details</b></li>
                                            <li><b>Item Name:</b> ${item.getName()}</li>
                                            <li><b>Item Id:</b> ${item.getItemId()}</li>
                                            <li><b>Price:</b> ${item.getPrice()}</li>
                                          </ul>
                                        </div><br/>
                                        <div style="clear:left;"></div>
                                        <div><b>Description:</b>&nbsp;&nbsp; ${item.getDescription()}</div>
                                        <hr/><br/>

                                      </div>
                                    </g:if>                                         </g:each>
                                </g:each>
                              </div>
                            </div>
                            <div class="graybox_botbg"></div>
                          </div>
                          </div>

                          <!-- Start Right -->
                          <div id="right">
                            <div class="sponsored_box">
                              <div class="spons_top">SPONSORED</div>
                              <div class="spons_con">
                                <g:each in="${catInstance.getCategoryList()}" status="i" var="buyer">
                                  <g:each in="${buyer.getItemList()}" status="j" var="item">
                                    <g:if test="${item.getPrice() > new BigDecimal(10000)}">
                                  <div class="con" >
                                    <div style="float:left;">
                                      <g:link controller="home" action="show" id="${item.getItemId()}" params="[category: buyer.getName()]" class="detail">
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
                                      </g:link>
                                    </div>
                                    <div style="float:left; width:100px;"><g:link controller="home" action="show" id="${item.getItemId()}" params="[category: buyer.getName()]" class="detail"><h1>Category: <b style="color: green;">${buyer.getName()}</b></h1></g:link>
                                      <b>Item Name: </b>${item.getName()}</div>
                                    <b>price: </b>${item.getPrice()}<div style="clear:left;"></div>
                                  </div>
                                    </g:if>
                                </g:each>
                                </g:each>
                              </div>
                              <div class="spons_bot"></div>
                            </div>
                          </div>
                          <div class="clear"></div>

                          <!-- Start Footer -->
                          <div id="footer">Copyright ©2011 ShepertzTecnologies Pvt. Ltd.</div>
                          <!-- End Footer -->
                          </div>
                          <!-- End Right -->



                          <!-- End Main Wrapper -->
                          </body>
                          </html>

 <div id="content">

        <div id="left">
          <div id="leftnav_container">
            <div id="topbg">Portal Main Sections</div>
            <div id="navbg">
              <div id="menu">
                <ul><g:each in="${catInstance.getCategoryList()}" status="i" var="category">
                  <li><g:link controller="home" params="[category:category.getName()]" action="showPortal" class="activemenu">${category.getName()}</g:link></li>
                  </g:each>
                </ul>
              </div>
            </div>
            <div class="leftnav_footer"></div>
          </div>
        </div>
      </div>
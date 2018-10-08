<%--
    Mango - Open Source M2M - http://mango.serotoninsoftware.com
    Copyright (C) 2006-2011 Serotonin Software Technologies Inc.
    @author Matthew Lohbihler
    
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see http://www.gnu.org/licenses/.
--%>
<%@ include file="/WEB-INF/jsp/include/tech.jsp" %>
<tag:page onload="setFocus">
  <script type="text/javascript">
    compatible = false;
     
    function setFocus() {
        $("username").focus();
        BrowserDetect.init();
        
        $set("browser", BrowserDetect.browser +" "+ BrowserDetect.version +" <fmt:message key="login.browserOnPlatform"/> "+ BrowserDetect.OS);
        
        if (checkCombo(BrowserDetect.browser, BrowserDetect.version, BrowserDetect.OS)) {
            $("browserImg").src = "images/accept.png";
            show("okMsg");
            compatible = true;
        }
        else {
            $("browserImg").src = "images/thumb_down.png";
            show("warnMsg");
        }
    }
    
    function nag() {
        if (!compatible)
            alert('<fmt:message key="login.nag"/>');
    }
  </script>
  <main>
      <div class="login-box">
      <form action="login.htm" method="post" onclick="nag()">
        <div class="help-box">
          <tag:help id="welcomeToMango"/>
        </div>
        <div class="form-box">
          <label><fmt:message key="login.userId"/></label>
          <input id="username" type="text" name="username" value="${login.username}"/>
        </div>

        <div class="form-box">
          <label><fmt:message key="login.password"/></label>
          <input id="password" type="password" name="password" value="${login.password}"/>
        </div>

        <div class="form-button">
          <input type="submit" value="<fmt:message key='login.loginButton'/>"/>
        </div>
      
      </form>
      <div class="browser-box">
        <span id="browser"><fmt:message key="login.unknownBrowser"/></span>
        <img id="browserImg" src="images/magnifier.png"/>
        <span id="okMsg" style="display:none"><fmt:message key="login.supportedBrowser"/></span>
        <span id="warnMsg" style="display:none"><fmt:message key="login.unsupportedBrowser"/></span>          
      </div>
      </div>

  </main>

</tag:page>
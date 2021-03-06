<%-- 
Page:   	configAlerts.jsp
Gear:  	 	Calendar Gear
gearmode: 	instanceConfig
displayMode: 	full

Author:      	Jeff Banister
Description: 	This page is included by instanceConfig.jsp, and renders and handles a form to 
      		set configuration options for gear alerts
--%>

<%@ taglib uri="/core-taglib" prefix="core" %>
<%@ taglib uri="/paf-taglib" prefix="paf" %>
<%@ taglib uri="/dsp" prefix="dsp" %>
<%@ taglib uri="/jakarta-i18n-1.0" prefix="i18n" %>

<dsp:page>
<i18n:bundle baseName="atg.portal.gear.calendar.CalendarResources" localeAttribute="userLocale" changeResponseLocale="false" />
<i18n:message id="alertsConfigPageTitle" key="alertsConfigPageTitle"/>
<i18n:message id="backtogearadminLink" key="backtogearadmin-link"/>
<i18n:message id="alertOptionsLabel" key="alertOptionsLabel"/>
<i18n:message id="alertNoOptionDesc" key="alertNoOptionDesc"/>
<i18n:message id="alertLockedOptionDesc" key="alertLockedOptionDesc"/>
<i18n:message id="alertOpenedOptionDesc" key="alertOpenedOptionDesc"/>
<i18n:message id="saveButtonLabel" key="save-button-label"/>

<paf:InitializeGearEnvironment id="pafEnv">
<%

   String NO_VALUE="no";
   String YES_LOCKED_VALUE="yes_locked";
   String YES_OPENED_VALUE="yes_opened";

   String origURI=pafEnv.getOriginalRequestURI();
   String gearID=pafEnv.getGear().getId();
   String pageID = request.getParameter("paf_page_id");
   String pageURL = request.getParameter("paf_page_url");
   String pageURLEncoded = atg.servlet.ServletUtil.escapeURLString(pageURL);
   String successURL = request.getParameter("paf_success_url");
   String communityID = request.getParameter("paf_community_id");
   String gearName=pafEnv.getGear().getName(response.getLocale());
   String thisConfigPage="alerts";
   String clearGif = response.encodeURL("/gear/calendar/images/clear.gif");
   String infoGif = response.encodeURL("/gear/calendar/images/info.gif");
   String errorGif = response.encodeURL("/gear/calendar/images/error.gif");


%>


<jsp:useBean id="alertFormInput" scope="request" class="atg.portal.admin.AlertConfigBean">
  <jsp:setProperty name="alertFormInput" property="*"/>
</jsp:useBean>



<!-- handle the form if it was filled in -->
<core:If value="<%= alertFormInput.getHandleForm() %>" >
  <paf:handleAlertConfig id="alertConfResult" 
                    formData="<%= alertFormInput %>" 
		    gearEnv="<%= pafEnv %>">
    <core:ExclusiveIf>
       <core:If value="<%= alertConfResult.getSuccess() %>" >
      <font class="info">
      <br>&nbsp;<img src="<%=infoGif%>">&nbsp;&nbsp;<i18n:message key="alertConfigFeedbackMsg"/> <br> <br></font>
       </core:If>
      <%-- if not, display errors --%>
      <core:DefaultCase>
      <font class="error">
      <br>&nbsp;<img src="<%=infoGif%>">&nbsp;&nbsp;
       <%=alertConfResult.getErrorMessage()%> <br> <br></font>
      </core:DefaultCase>
    </core:ExclusiveIf>
  </paf:handleAlertConfig>
</core:If>

<% String globalAlertMode = pafEnv.getGearInstanceParameter("globalAlertMode"); %>

<i18n:message id="i18n_quote" key="html_quote"/>
<table cellpadding="1" cellspacing="0" border="0" bgcolor="#666666" width="98%"><tr><td>
<table cellpadding="4" cellspacing="0" border="0" bgcolor="#BAD8EC" width="100%"><tr><td>
<font class="pageheader_edit">
<i18n:message key="alertsConfigPageTitle">
  <i18n:messageArg value="<%=i18n_quote%>"/>
  <i18n:messageArg value="<%=pafEnv.getGear().getName(response.getLocale())%>"/>
 </i18n:message>
</td></tr></table>
</td></tr></table>

<table cellpadding="2" cellspacing="0" border="0" bgcolor="#EAEEF0" width="98%"><tr><td>
 <font class="smaller"><i18n:message key="alertConfigHelperText"/>
</font></td></tr></table>
<img src="<%=clearGif%>" height="1" width="1" border="0"><br>

<table cellpadding="4" cellspacing="0" border="0" bgcolor="#BAD8EC" width="98%">
<tr><td>

<core:CreateUrl id="formURL" url="<%= origURI%>">
<form ACTION="<%= formURL.getNewUrl() %>" METHOD="POST">


<%--
 Sets form encoding to the same as the encoding of this response.
 This hidden field will let the form processing code know what the character encoding of the POSTed data is. 
 --%>
<input type="hidden" name="_dyncharset" value="<%= response.getCharacterEncoding() %>">

<input type="hidden" name="handleForm" value="true">

<input type="hidden" name="paf_gear_id" value="<%= gearID %>">
<input type="hidden" name="paf_dm" value="full">
<input type="hidden" name="paf_gm" value="instanceConfig">
<input type="hidden" name="config_page" value="<%= thisConfigPage%>">
<input type="hidden" name="paf_page_id" value="<%= pageID %>"/>
<input type="hidden" name="paf_page_url" value="<%= pageURLEncoded %>"/>
<input type="hidden" name="paf_success_url" value="<%= successURL %>"/>
<input type="hidden" name="paf_community_id" value="<%= communityID %>"/>

<table cellpadding="1" cellspacing="0" border="0">




 <tr>
   <td colspan=2><font class="smaller"><%=alertOptionsLabel%></font></td>
 </tr>


  <tr>
    <td colspan=2> 
      <core:exclusiveIf>
        <core:if value='<%= NO_VALUE.equals(globalAlertMode) %>'>
          <input type="radio" name="gearAlertPref" value="<%=NO_VALUE%>" checked><font class="smaller">&nbsp;<%=alertNoOptionDesc%></font>
        </core:if>
        <core:defaultCase>
          <input type="radio" name="gearAlertPref" value="<%=NO_VALUE%>"><font class="smaller">&nbsp;<%=alertNoOptionDesc%></font>
        </core:defaultCase>
      </core:exclusiveIf>
    </td>
  </tr>

  <tr>
    <td colspan=2> 
      <core:exclusiveIf>
        <core:if value='<%= YES_LOCKED_VALUE.equals(globalAlertMode) %>'>
          <input type="radio" name="gearAlertPref" value="<%=YES_LOCKED_VALUE%>" checked><font class="smaller">&nbsp;<%=alertLockedOptionDesc%></font>
        </core:if>
        <core:defaultCase>
          <input type="radio" name="gearAlertPref" value="<%=YES_LOCKED_VALUE%>"><font class="smaller">&nbsp;<%=alertLockedOptionDesc%></font>
        </core:defaultCase>
      </core:exclusiveIf>
    </td>
  </tr>

<%-- not supporting this one just yet...
  <tr>
    <td colspan=2> 
    <input type="radio" name="gearAlertPref" value="yes_opened"><font class="smaller" color="#000000">&nbsp;<%=alertOpenedOptionDesc%></font>
    </td>
  </tr>
--%>


  <core:CreateUrl id="cancelURL" url="<%= origURI%>">
         <core:UrlParam param="paf_dm" value="full"/>
         <core:UrlParam param="paf_gm" value="instanceConfig"/>
	 <core:UrlParam param="paf_gear_id" value="<%= gearID %>"/>
         <core:UrlParam param="paf_page_id" value="<%= pageID %>"/>
         <paf:encodeUrlParam param="paf_page_url" value="<%= pageURL %>"/>
         <core:UrlParam param="paf_community_id" value="<%= communityID %>"/>
      <tr>
         <td><br><INPUT type="submit" value="<%=saveButtonLabel%>">&nbsp;</td>
         <td>&nbsp;</td>
  </core:CreateUrl>
  </tr>
</table>
</form>
</core:CreateUrl>
</td></tr></table><br><br>
</paf:InitializeGearEnvironment>
</dsp:page>
<%-- @version $Id: //app/portal/version/10.0.3/calendar/calendar.war/html/admin/configAlerts.jsp#2 $$Change: 651448 $--%>

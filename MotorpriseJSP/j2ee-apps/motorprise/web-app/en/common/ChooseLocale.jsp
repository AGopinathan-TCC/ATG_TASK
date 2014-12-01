<%@ taglib uri="dsp" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/ProfileErrorMessageForEach"/>

<!-- An update form needs to display current profile attributes; we will
     instruct the ProfileFormHandler to extract default values from the profile. -->
<dsp:setvalue bean="ProfileFormHandler.extractDefaultValuesFromProfile" value="true"/> 

<dsp:getvalueof id="thisPage" idtype="String" bean="/OriginatingRequest.requestURI">
<dsp:form action="<%=thisPage%>" method="POST">
  <dsp:select bean="/atg/userprofiling/Profile.locale">
     <dsp:option value="en_US"/>English
     <dsp:option value="de_DE"/>German
     <dsp:option value="ja_JP"/>Japanese
  </dsp:select>
  <br>
  <% String homePage = request.getContextPath() + "/en/home.jsp"; %>
  <dsp:input bean="ProfileFormHandler.updateSuccessURL" type="hidden" value="<%=homePage%>"/>
  <dsp:input bean="ProfileFormHandler.update" type="submit" value="Change Language"/>
</dsp:form>
</dsp:getvalueof>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/en/common/ChooseLocale.jsp#2 $$Change: 651448 $--%>

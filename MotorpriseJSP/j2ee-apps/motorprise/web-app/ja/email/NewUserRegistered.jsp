<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<!-- Title: NewUserRegisteredEmail -->
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/dynamo/droplet/Format"/>
<dsp:importbean bean="/atg/dynamo/Configuration"/>
<dsp:importbean bean="/atg/projects/b2bstore/profile/PersonLookup"/>


<dsp:setvalue value="��������Ⴂ�܂�" param="messageSubject"/>
<%-- 
<dsp:setvalue value="admin@example.com" param="messageFrom"/>
<dsp:setvalue value="admin@example.com" param="messageReplyTo"/>
--%>
<dsp:setvalue value="NewUserRegistered" param="mailingName"/>


<dsp:droplet name="PersonLookup">
  <dsp:param name="id" param="message.profileId"/>
  <dsp:param name="elementName" value="Person"/>
  <dsp:oparam name="output">

    <dsp:setvalue paramvalue="Person.email" param="messageTo"/>

    <p><dsp:valueof param="Person.lastName">���q</dsp:valueof>
    <dsp:valueof param="Person.firstName"/>�l�ցA

    <p>���̂��т� Motorprise �������p�����������肪�Ƃ��������܂��B���q�l�̂��΂ߐ�� <valueof param="Person.parentOrganization.name"> �Ƃ��āA�����O�����L�̃��[�U���ƂƂ��� Motorprise �E�F�u�T�C�g�ɓo�^�����Ă��������܂����B 

    <p>���O�C���F <dsp:valueof param="Person.login"/><br> 
    
    �p�X���[�h�͒S���҂ɂ��₢���킹���������B
    
    <%-- 
    Construct an absolute path to the Motorprise home page by looking up the
    site's HTTP server name and port number and the context path at which
    the application is deployed and formatting an appropriate URL.  This lets
    us avoid embedding assumptions about how and where the application is 
    deployed.
    --%>
    <dsp:droplet name="Format">
      <dsp:param name="format" value="http://{host}:{port,number,#}{path}/index.jsp"/>
      <dsp:param name="host" bean="Configuration.siteHttpServerName"/>
      <dsp:param name="port" bean="Configuration.siteHttpServerPort"/>
      <dsp:param name="path" value="<%=request.getContextPath()%>"/>
      <dsp:oparam name="output">
        <p>Motorprise �ւ�<a href="<dsp:valueof param='message'/>">�����炩��</a>�A�N�Z�X���������܂��B
      </dsp:oparam>
    </dsp:droplet>

    <p>�h��<br> 
    Motorprise, Inc.
  </dsp:oparam>
</dsp:droplet>


</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/NewUserRegistered.jsp#2 $$Change: 651448 $--%>

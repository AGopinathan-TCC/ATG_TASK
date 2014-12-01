<%@ taglib uri="/dspTaglib" prefix="dsp" %> <%@ page import="atg.servlet.*"%> <dsp:page>

<HTML> <HEAD>
<TITLE>Bienvenue chez Quincy Funds</TITLE>
</HEAD>

<dsp:importbean bean="/atg/userprofiling/Profile"/>

<dsp:setvalue value="S�minaire Quincy Funds" param="messageSubject"/>
<!-- 
Set the value of these parameters to valid email addresses

<dsp:setvalue value="Dynamo5Team@example.com" param="messageFrom"/>
<dsp:setvalue value="Dynamo5Team@example.com" param="messageReplyTo"/>
-->
<dsp:setvalue value="Welcome" param="mailingName"/>


<font face="verdana" size=2>Cher/Ch�re
<dsp:droplet name="/atg/dynamo/droplet/Switch">
  <dsp:param bean="Profile.firstname" name="value"/>
  <dsp:oparam name="unset">
     <dsp:droplet name="/atg/dynamo/droplet/Switch">
        <dsp:param bean="Profile.login" name="value"/>
          <dsp:oparam name="unset">
                 Monsieur ou Madame,
          </dsp:oparam>
          <dsp:oparam name="default">
             <dsp:valueof bean="Profile.login"/>,
          </dsp:oparam>
     </dsp:droplet>

   </dsp:oparam>
  <dsp:oparam name="default">
    <dsp:valueof bean="Profile.firstName"/>
    <dsp:valueof bean="Profile.lastName"/>,
  </dsp:oparam>
</dsp:droplet>

<p>
<p>
Nous avons le plaisir de vous informer que l'un de nos s�minaires se tiendra bient�t dans votre 
r�gion. Pour en savoir plus, cliquez sur ce lien : 
<dsp:a href='<%=ServletUtil.getRequestURL(request,"../login.jsp?offercode=seminar")%>'>Acc�der � Quincy Funds</dsp:a><p>
Cordialement,<br>
Joe B. Juan Canobe<br>
Pr�sident de Quincy Funds


</BODY> </HTML>

<%/* @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/fr/email/seminar.jsp#2 $$Change: 651448 $*/%> </dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/fr/email/seminar.jsp#2 $$Change: 651448 $--%>

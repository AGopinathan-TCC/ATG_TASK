<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page import="atg.servlet.*"%>
<dsp:page>

<HTML> <HEAD>
<TITLE>Quincy Funds �ւ悤����</TITLE>
</HEAD>

<dsp:importbean bean="/atg/userprofiling/Profile"/>

<dsp:setvalue value="Quincy Funds �ւ悤����" param="messageSubject"/>
<!-- 
Set the value of these parameters to valid email addresses

<dsp:setvalue value="DynamoTeam@example.com" param="messageFrom"/>
<dsp:setvalue value="DynamoTeam@example.com" param="messageReplyTo"/>
-->
<dsp:setvalue value="Welcome" param="mailingName"/>


<font face="verdana" size=2>�q�[
<dsp:droplet name="/atg/dynamo/droplet/Switch">
  <dsp:param bean="Profile.firstname" name="value"/>
  <dsp:oparam name="unset">
     <dsp:droplet name="/atg/dynamo/droplet/Switch">
        <dsp:param bean="Profile.login" name="value"/>
          <dsp:oparam name="unset">
                                    
          </dsp:oparam>
          <dsp:oparam name="default">
             <dsp:valueof bean="Profile.login"/>,
          </dsp:oparam>
     </dsp:droplet>

   </dsp:oparam>
  <dsp:oparam name="default">
    <dsp:valueof bean="Profile.lastName"/>
    <dsp:valueof bean="Profile.firstName"/>,
  </dsp:oparam>
</dsp:droplet>

<p>
Quincy Funds �ւ悤�����B���Q�����������A���肪�Ƃ��������܂����B�����Z���^�Ƃ��Ă���`���ł��邱�Ƃ����h�Ɏv���Ă���܂��B
<p>

Quincy Funds �́A��т��ăg�b�v�̃I�����C�������Z���^�Ƃ��ĕ]������Ă��Ă��܂��B
���q�l�𒆐S�Ƃ������Ђ̓������T�[�r�X�́A���ł͌����Ȃ����̂Ɗm�M���Ă���܂��B
<p>

Quincy Funds �ɂ��Q�����������A���肪�Ƃ��������܂����B

<p>
�h��<br>
Joe B. Juan Canobe<br>
��\������В��A <dsp:a href='<%=ServletUtil.getRequestURL(request,"../../index.jsp")%>'>Quincy Funds</dsp:a>

</BODY> </HTML>

</dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/ja/email/welcome.jsp#2 $$Change: 651448 $--%>

<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<!-- Title: OneMonthEmail -->
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>


<dsp:setvalue value="����̃I�[�_�[���� 10% �����ł��B" param="messageSubject"/>
<%-- 
<dsp:setvalue value="orders@example.com" param="messageFrom"/>
<dsp:setvalue value="orders@example.com" param="messageReplyTo"/>
--%>
<dsp:setvalue paramvalue="message.profile.email" param="messageTo"/>
<dsp:setvalue value="25% Over Average" param="mailingName"/>


<dsp:setvalue paramvalue="message.profile" param="recipient"/>


<p> <dsp:valueof param="recipient.firstName">���q�l��</dsp:valueof><dsp:valueof param="recipient.lastName"/>�A

<p>����́A����܂łɂ������đ����̂����������������A���肪�Ƃ��������܂����B������ς��ʂ����ڂ�����܂��悤�A����̂������ł� 10% �����Ƃ����Ă��������܂��B

<p>�h��<br>
Motorprise, Inc. 
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/25OverAverage.jsp#2 $$Change: 651448 $--%>

<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<!-- Title: GiftPurchasedEmail -->
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/commerce/inventory/InventoryLookup"/>
<dsp:importbean bean="/atg/commerce/pricing/PriceItem"/>

<dsp:setvalue value="���q�l�ւ̑����ł��B" param="messageSubject"/>
<%-- 
<dsp:setvalue value="DCS5Team@example.com" param="messageFrom"/>
<dsp:setvalue value="DCS5Team@example.com" param="messageReplyTo"/>
--%>
<dsp:setvalue paramvalue="message.profile.email" param="messageTo"/>
<dsp:setvalue value="GiftPurchased" param="mailingName"/>

<dsp:setvalue paramvalue="message.order" param="order"/>
<dsp:setvalue paramvalue="message.profile" param="recipient"/>
<dsp:setvalue paramvalue="message.item" param="item"/>

<p> <dsp:valueof param="recipient.lastName">���q</dsp:valueof>
<dsp:valueof param="recipient.firstName"/>�l��

<p> ���q�l�ւ̑�����<dsp:valueof bean="/atg/userprofiling/Profile.firstName">�s��</dsp:valueof><dsp:valueof bean="/atg/userprofiling/Profile.lastName">�s��</dsp:valueof>�l�ɂ��w�����������܂����B

<p> ���w�������������A�C�e���͎��̂Ƃ���ł��F

<p> ���肪�Ƃ��������܂����B 
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/fulfillment/GiftPurchased.jsp#2 $$Change: 651448 $--%>

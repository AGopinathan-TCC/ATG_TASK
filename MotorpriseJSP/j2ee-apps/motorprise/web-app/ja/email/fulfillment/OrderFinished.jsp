<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<!-- Title: FulfillmentEmail -->
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/commerce/pricing/PriceItem"/>

<dsp:setvalue value="�I�[�_�[���������܂����B" param="messageSubject"/>
<%-- 
<dsp:setvalue value="DCS5Team@example.com" param="messageFrom"/>
<dsp:setvalue value="DCS5Team@example.com" param="messageReplyTo"/>
--%>
<dsp:setvalue value="OrderShipped" param="mailingName"/>

<dsp:setvalue paramvalue="message.order" param="order"/>
<dsp:setvalue paramvalue="message.profile" param="profile"/>

<p> <dsp:valueof param="profile.firstName">���q�l��</dsp:valueof>
<dsp:valueof param="profile.lastName"/>�A

<p>���q�l�̃I�[�_�[�̏������������܂����B

<p>�I�[�_�[�̊m�F�ԍ��͎��̂Ƃ���ł��F
<dsp:valueof param="order.id">�i�J�X�^�}�T�[�r�X�ɂ��A�����������B�j</dsp:valueof>

<hr>

<!-- Itemized order -->
<br>
<dsp:getvalueof id="pval0" param="order"><dsp:include page="DisplayOrderSummary.jsp"><dsp:param name="order" value="<%=pval0%>"/><dsp:param name="displayStockStatus" value="false"/></dsp:include></dsp:getvalueof>

<!-- Shipping information -->
<dsp:getvalueof id="pval0" param="order"><dsp:include page="DisplayShippingInfo.jsp"><dsp:param name="order" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>

<!-- Payment information -->
<dsp:getvalueof id="pval0" param="order"><dsp:include page="DisplayPaymentInfo.jsp"><dsp:param name="order" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>

</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/fulfillment/OrderFinished.jsp#2 $$Change: 651448 $--%>

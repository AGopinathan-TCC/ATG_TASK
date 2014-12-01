<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<!-- Title: FulfillmentEmail -->
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/commerce/pricing/PriceItem"/>

<dsp:setvalue value="���q�l�̃I�[�_�[�ɒx�����������܂��B" param="messageSubject"/>
<%-- 
<dsp:setvalue value="DCS5Team@example.com" param="messageFrom"/>
<dsp:setvalue value="DCS5Team@example.com" param="messageReplyTo"/>
--%>
<dsp:setvalue value="OrderHasUnavailableItems" param="mailingName"/>

<dsp:setvalue paramvalue="message.order" param="order"/>
<dsp:setvalue paramvalue="message.shipItemRels" param="itemRels"/>
<dsp:setvalue paramvalue="message.profile" param="profile"/>

<p> <dsp:valueof param="profile.firstName">���q�l��</dsp:valueof>
<dsp:valueof param="profile.lastName"/>�A

<p>�I�[�_�[�̊m�F�ԍ��͎��̂Ƃ���ł��F
<dsp:valueof param="order.id">��`����Ă��܂���</dsp:valueof>

<p>���q�l�̃I�[�_�[�ɑ΂��鏈���́A���݂̎��_�ł܂������ł��Ă���܂���B

<!-- Shipping information -->
<table>
<tr valign=top>
  <td>
      <b>���̃A�C�e���͌��ݍ݌ɂ�����܂���F</b><br>
      <dsp:droplet name="ForEach">
	<dsp:param name="array" param="itemRels"/>
	<dsp:param name="elementName" value="itemRel"/>
	<dsp:oparam name="empty">
	  ���̓d�q���[���͖������Ă��������B
	</dsp:oparam>
	<dsp:oparam name="output">
	   <dsp:valueof param="itemRel.commerceItem.auxiliaryData.catalogRef.displayName">�\�����Ȃ��B</dsp:valueof> ��
	  <dsp:droplet name="Switch">
	    <dsp:param name="value" param="itemRel.state"/>
	    <dsp:oparam name="3">
	      PRE_ORDERED
	    </dsp:oparam>
	    <dsp:oparam name="4">
	      BACK_ORDERED
	    </dsp:oparam>	    
	    <dsp:oparam name="11">
	      OUT_OF_STOCK
	    </dsp:oparam>	    
	  </dsp:droplet>
	  <br>
       </dsp:oparam>
     </dsp:droplet>
 </td>
</tr>
<tr></tr>
</table>

<p>���̏����m�F���Ă��������B

<hr>

<!-- Itemized order -->
<br>
<dsp:getvalueof id="pval0" param="order"><dsp:include page="DisplayOrderSummary.jsp"><dsp:param name="order" value="<%=pval0%>"/><dsp:param name="displayStockStatus" value="false"/></dsp:include></dsp:getvalueof>

<!-- Shipping information -->
<dsp:getvalueof id="pval0" param="order"><dsp:include page="DisplayShippingInfo.jsp"><dsp:param name="order" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>

<!-- Payment information -->
<dsp:getvalueof id="pval0" param="order"><dsp:include page="DisplayPaymentInfo.jsp"><dsp:param name="order" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>

</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/fulfillment/OrderHasUnavailableItems.jsp#2 $$Change: 651448 $--%>

<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<!-- Title: FulfillmentEmail -->
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/commerce/pricing/PriceItem"/>

<dsp:setvalue value="���q�l�̃I�[�_�[�𔭑��������܂����B" param="messageSubject"/>
<%-- 
<dsp:setvalue value="DCS5Team@example.com" param="messageFrom"/>
<dsp:setvalue value="DCS5Team@example.com" param="messageReplyTo"/>
--%>
<dsp:setvalue value="OrderShipped" param="mailingName"/>

<dsp:setvalue paramvalue="message.order" param="order"/>
<dsp:setvalue paramvalue="message.shippingGroup" param="shippingGroup"/>
<dsp:setvalue paramvalue="message.profile" param="profile"/>

<p> <dsp:valueof param="profile.firstName">���q�l��</dsp:valueof>
<dsp:valueof param="profile.lastName"/>�A

<p>�I�[�_�[�̊m�F�ԍ��͎��̂Ƃ���ł��F
<dsp:valueof param="order.id">��`����Ă��܂���</dsp:valueof>

<p>�I�[�_�[�̓��A���̏��i�𔭑��������܂����B

<!-- Shipping information -->
<table>
<tr valign=top>
  <td>
      <b>���̃A�C�e���𔭑����܂����F</b><br>
      <dsp:droplet name="ForEach">
	<dsp:param name="array" param="shippingGroup.commerceItemRelationships"/>
	<dsp:param name="elementName" value="itemRel"/>
	<dsp:oparam name="empty">
	  ���̔z�B�O���[�v�ɂ̓A�C�e��������܂���B
	</dsp:oparam>
	<dsp:oparam name="output">
	  <dsp:droplet name="Switch">
	    <dsp:param name="value" param="itemRel.relationshipTypeAsString"/>
	    <dsp:oparam name="SHIPPINGQUANTITY">
	      ��<dsp:valueof param="itemRel.quantity">���ʂ��w�肳��Ă��܂���B</dsp:valueof>
	    </dsp:oparam> 
	    <dsp:oparam name="SHIPPINGQUANTITYREMAINING">
	      ���z�B���F 
	    </dsp:oparam> 
          </dsp:droplet>
	      <dsp:valueof param="itemRel.commerceItem.auxiliaryData.catalogRef.displayName">�\�����Ȃ��B</dsp:valueof>
	  <br>
       </dsp:oparam>
     </dsp:droplet>
 </td>
 <td>    
     <p><b>���̏����g�p�F</b><br>
     <dsp:droplet name="Switch">
       <dsp:param name="value" param="shippingGroup.shippingGroupClassType"/>
       <dsp:oparam name="hardgoodShippingGroup">
	 <dsp:valueof param="shippingGroup.shippingMethod">�z�B���@�̎w��Ȃ�</dsp:valueof>�ɂ��z�B��F<BR>
	 <dsp:valueof param="shippingGroup.shippingAddress.lastName"/> 
	 <dsp:valueof param="shippingGroup.shippingAddress.firstName"/><BR>
	 <dsp:valueof param="shippingGroup.shippingAddress.address1"/> 
	 <dsp:valueof param="shippingGroup.shippingAddress.address2"/><BR>
	 <dsp:valueof param="shippingGroup.shippingAddress.city"/>, 
	 <dsp:valueof param="shippingGroup.shippingAddress.state"/> 
	 <dsp:valueof param="shippingGroup.shippingAddress.postalCode"/><BR>
       </dsp:oparam>
       <dsp:oparam name="b2bHardgoodShippingGroup">
	 <dsp:valueof param="shippingGroup.shippingMethod">�z�B���@�̎w��Ȃ�</dsp:valueof>�ɂ��z�B��F<BR>
	 <dsp:valueof param="shippingGroup.shippingAddress.firstName"/> 
	 <dsp:valueof param="shippingGroup.shippingAddress.lastName"/><BR>
	 <dsp:valueof param="shippingGroup.shippingAddress.address1"/> 
	 <dsp:valueof param="shippingGroup.shippingAddress.address2"/><BR>
	 <dsp:valueof param="shippingGroup.shippingAddress.city"/>, 
	 <dsp:valueof param="shippingGroup.shippingAddress.state"/> 
	 <dsp:valueof param="shippingGroup.shippingAddress.postalCode"/><BR>
       </dsp:oparam>
       <dsp:oparam name="electronicShippingGroup">
	 �d�q���[���ɂ��z�B��F<BR>
	 <dsp:valueof param="shippingGroup.emailAddress">�s���ȓd�q���[���A�h���X</dsp:valueof><BR>
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
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/fulfillment/ShippingGroupShipped.jsp#2 $$Change: 651448 $--%>

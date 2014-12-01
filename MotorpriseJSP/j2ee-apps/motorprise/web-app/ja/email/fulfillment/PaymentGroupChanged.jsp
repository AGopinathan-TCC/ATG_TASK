<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<!-- Title: FulfillmentEmail -->
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/commerce/pricing/PriceItem"/>

<dsp:setvalue value="�x�����z�̍X�V" param="messageSubject"/>
<%-- 
<dsp:setvalue value="DCS5Team@example.com" param="messageFrom"/>
<dsp:setvalue value="DCS5Team@example.com" param="messageReplyTo"/>
--%>
<dsp:setvalue value="PaymentGroupChanged" param="mailingName"/>

<dsp:setvalue paramvalue="message.order" param="order"/>
<dsp:setvalue paramvalue="message.paymentGroups" param="paymentGroups"/>
<dsp:setvalue paramvalue="message.profile" param="profile"/>

<p> �q�[<dsp:valueof param="profile.lastName">���q</dsp:valueof>
<dsp:valueof param="profile.firstName"/>�l�A

<p>���̃I�[�_�[�̊m�F�ԍ��͎��̂Ƃ���ł��F
<dsp:valueof param="order.id">�i�J�X�^�}�T�[�r�X�ɂ��A�����������B�j</dsp:valueof>

<hr>

<p>
<dsp:droplet name="ForEach">
  <dsp:param name="array" param="paymentGroups"/>
  <dsp:param name="elementName" value="paymentGroup"/>
  <dsp:oparam name="outputStart">
    <dsp:droplet name="Switch">
      <dsp:param name="value" param="message.subType"/>
      <dsp:oparam name="PaymentGroupCredited">
	<dsp:setvalue value="���x���z�𐿋������Ă��������܂��B" param="messageSubject"/>
	���x�����̂�������F<br>
      </dsp:oparam>
      <dsp:oparam name="PaymentGroupDebited">
	<dsp:setvalue value="���x��������̂��܂����B" param="messageSubject"/>
	��̂������x�����z�F<br>
      </dsp:oparam>
      <dsp:oparam name="PaymentGroupDebitFailed">
	<dsp:setvalue value="���x���������[�ł��B" param="messageSubject"/>
	���[�̂��x�����z�F<br>
      </dsp:oparam>
      <dsp:oparam name="default">
	<dsp:setvalue value="���x�����z���X�V�����Ă��������܂����B" param="messageSubject"/>
	�X�V�������x�����z�F<br>	
      </dsp:oparam>
    </dsp:droplet>
  </dsp:oparam>
  <dsp:oparam name="output">
    <dsp:droplet name="Switch">
      <dsp:param name="value" param="paymentGroup.paymentMethod"/>
      <dsp:oparam name="creditCard">
	<dsp:valueof param="paymentGroup.creditCardType"/> # 
	<dsp:valueof param="paymentGroup.creditCardNumber" converter="creditcard" groupingsize="4">�ԍ��Ȃ�</dsp:valueof> :
	</dsp:oparam>
      <dsp:oparam name="giftCertificate">
	���i���ԍ� <dsp:valueof param="paymentGroup.giftCertificateNumber"/> : 
      </dsp:oparam>
    </dsp:droplet>
    <dsp:droplet name="Switch">
      <dsp:param name="value" param="message.subType"/>
      <dsp:oparam name="PaymentGroupCredited">
	    �����ς݋��z = <dsp:valueof converter="currency" locale="Profile.priceList.locale" param="paymentGroup.amountCredited"/><br>	
      </dsp:oparam>
      <dsp:oparam name="PaymentGroupDebited">
	    ���z = <dsp:valueof converter="currency" locale="Profile.priceList.locale" param="paymentGroup.amountDebited"/><br>	
      </dsp:oparam>
      <dsp:oparam name="PaymentGroupDebitFailed">
	    ���z = <dsp:valueof converter="currency" locale="Profile.priceList.locale" param="paymentGroup.amount"/><br>	
      </dsp:oparam>
      <dsp:oparam name="default">
	    �V�������z = <dsp:valueof converter="currency" locale="Profile.priceList.locale" param="paymentGroup.amount"/><br>	
      </dsp:oparam>
    </dsp:droplet>
  </dsp:oparam>
  <dsp:oparam name="empty">
    <dsp:setvalue value="���x�����z���X�V�����Ă��������܂����B" param="messageSubject"/>
    ���x�����z���X�V�����Ă��������܂����B<br>    
  </dsp:oparam>
</dsp:droplet>


<!-- Itemized order -->
<br>
<dsp:getvalueof id="pval0" param="order"><dsp:include page="DisplayOrderSummary.jsp"><dsp:param name="order" value="<%=pval0%>"/><dsp:param name="displayStockStatus" value="false"/></dsp:include></dsp:getvalueof>

<!-- Shipping information -->
<dsp:getvalueof id="pval0" param="order"><dsp:include page="DisplayShippingInfo.jsp"><dsp:param name="order" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>

<!-- Payment information -->
<dsp:getvalueof id="pval0" param="order"><dsp:include page="DisplayPaymentInfo.jsp"><dsp:param name="order" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>

</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/fulfillment/PaymentGroupChanged.jsp#2 $$Change: 651448 $--%>

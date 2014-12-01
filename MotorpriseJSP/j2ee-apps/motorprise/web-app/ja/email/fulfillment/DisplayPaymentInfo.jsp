<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<%/* A shopping cart-like display of order information  */%>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>

<dsp:droplet name="IsNull">
  <dsp:param name="value" param="order.paymentGroups"/>
  <dsp:oparam name="true">
   <p>���̃I�[�_�[�ɂ́A�x�����O���[�v������܂���B
  </dsp:oparam>
  <dsp:oparam name="false">
    <dsp:droplet name="ForEach">
      <dsp:param name="array" param="order.paymentGroups"/>
      <dsp:param name="elementName" value="pg"/>
      <dsp:oparam name="empty">
	�x�����O���[�v������܂���B<br>
      </dsp:oparam>
      <dsp:oparam name="output">
	<dsp:droplet name="Switch">
	  <dsp:param name="value" param="pg.paymentMethod"/>
	  <dsp:oparam name="creditCard">
            <p><b>�x�������F�N���W�b�g�J�[�h</b><br>
	    ���z = <dsp:valueof converter="currency" locale="Profile.priceList.locale" param="pg.amount"/><br>
	    �N���W�b�g�J�[�h�ԍ�<dsp:valueof param="pg.creditCardType"/>�F# 
	    <dsp:valueof param="pg.creditCardNumber" converter="creditcard" groupingsize="4">no number</dsp:valueof><BR>
	    �L�������F <dsp:valueof param="pg.expirationMonth"/>/ 
	    <dsp:valueof param="pg.expirationYear"/><br>
	    ������Z��<br>
	    <dsp:valueof param="pg.billingAddress.lastName"/> 
	    <dsp:valueof param="pg.billingAddress.firstName"/><BR>
	    <dsp:valueof param="pg.billingAddress.address1"/> 
	    <dsp:valueof param="pg.billingAddress.address2"/><BR>
	    <dsp:valueof param="pg.billingAddress.city"/>, 
	    <dsp:valueof param="pg.billingAddress.state"/> 
	    <dsp:valueof param="pg.billingAddress.postalCode"/><BR>
	  </dsp:oparam>
	  <dsp:oparam name="giftCertificate">
            <p><b>�x�������F <dsp:valueof param="pg.paymentMethod"/></b><br>
	    ���z = <dsp:valueof converter="currency" locale="Profile.priceList.locale" param="pg.amount"/><br>
	    ���i���Ŏx����<dsp:valueof param="pg.giftCertificateNumber"/>�F<br>
	  </dsp:oparam>
          <dsp:oparam name="default">
            <p><b>�x�������F <dsp:valueof param="pg.paymentMethod"/></b><br>
	    ���z = <dsp:valueof converter="currency" locale="Profile.priceList.locale" param="pg.amount"/><br>
          </dsp:oparam>
	</dsp:droplet>
      </dsp:oparam>
    </dsp:droplet>    
  </dsp:oparam>
</dsp:droplet>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/fulfillment/DisplayPaymentInfo.jsp#2 $$Change: 651448 $--%>

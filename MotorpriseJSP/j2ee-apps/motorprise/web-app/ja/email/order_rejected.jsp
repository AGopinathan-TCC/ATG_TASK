<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<!-- Title: OrderRejectedEmail -->
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>

<dsp:setvalue paramvalue="message.order" param="order"/>
<dsp:setvalue paramvalue="message.profile" param="profile"/>
<dsp:setvalue paramvalue="message.orderOwnerProfile" param="orderOwnerProfile"/>

<dsp:setvalue paramvalue="orderOwnerProfile.email" param="messageTo"/>    
<%-- 
<dsp:setvalue value="DCS5Team@example.com" param="messageFrom"/>
<dsp:setvalue value="DCS5Team@example.com" param="messageReplyTo"/>
--%>
<dsp:setvalue value="�I�[�_�[�s��" param="messageSubject"/>
<dsp:setvalue value="OrderRejected" param="mailingName"/>

<p><dsp:valueof param="orderOwnerProfile.firstName">���q�l��</dsp:valueof>
<dsp:valueof param="orderOwnerProfile.lastName"/>�A<br>

<p>���M���Ă��������܂����I�[�_�[�ԍ� <dsp:valueof param="order.id">�I�[�_�[ ID ������܂���</dsp:valueof> �͏��F����܂���ł����B<br> 

<b>���F�҃��b�Z�[�W</b>
<dsp:droplet name="ForEach">
  <dsp:param name="array" param="order.approverMessages"/>
  <dsp:param name="elementName" value="message"/>
  <dsp:oparam name="output">
    - <dsp:valueof param="message">���R�Ȃ�</dsp:valueof><br>
  </dsp:oparam>
  <dsp:oparam name="empty">
    ���b�Z�[�W�͂���܂���
  </dsp:oparam>
</dsp:droplet>

<br>

<b>�I�[�_�[���F���K�v�ȗ��R�F</b>
<dsp:droplet name="ForEach">
  <dsp:param name="array" param="order.approvalSystemMessages"/>
  <dsp:param name="elementName" value="message"/>
  <dsp:oparam name="output">
    - <dsp:valueof param="message">���R�Ȃ�</dsp:valueof><br>
  </dsp:oparam>
  <dsp:oparam name="empty">
    �V�X�e�����b�Z�[�W�͂���܂���
  </dsp:oparam>
</dsp:droplet>

<br>

<!-- Itemized order -->
<br>
<dsp:include page="fulfillment/DisplayOrderSummary.jsp">
  <dsp:param name="order" param="order"/>
  <dsp:param name="displayStockStatus" value="false"/>
</dsp:include>

<!-- Shipping information -->
<dsp:include page="fulfillment/DisplayShippingInfo.jsp">
  <dsp:param name="order" param="order"/>
</dsp:include>

<!-- Payment information -->
<dsp:include page="fulfillment/DisplayPaymentInfo.jsp">
  <dsp:param name="order" param="order"/>
</dsp:include>

</dsp:page>

<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/order_rejected.jsp#2 $$Change: 651448 $ --%>

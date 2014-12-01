<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<!-- Title: ApprovalRequiredEmail -->
<dsp:setvalue paramvalue="message.order" param="order"/>
<dsp:setvalue paramvalue="message.profile" param="profile"/>
<dsp:setvalue paramvalue="message.profile.approvers[0]" param="approver"/>

<dsp:setvalue paramvalue="approver.email" param="messageTo"/>
<%-- 
<dsp:setvalue value="DCS5Team@example.com" param="messageReplyTo"/>
<dsp:setvalue value="DCS5Team@example.com" param="messageFrom"/>
--%>
<dsp:setvalue value="�I�[�_�[���F���K�v�ł�" param="messageSubject"/>
<dsp:setvalue value="ApprovalRequired" param="mailingName"/>

<p> <dsp:valueof param="approver.firstName">�I�[�_�[���F�S���җl</dsp:valueof>
<dsp:valueof param="approver.lastName"/>�A

<p>����܂����I�[�_�[�̏��F�����肢�������܂��B<br>
<p>�I�[�_�[ ID�F <dsp:valueof param="order.id"/> <!-- Need link to order approval page.--> <br>
�w���ҁF<dsp:valueof param="profile.firstName">���q�l</dsp:valueof>
<dsp:valueof param="profile.lastName"/><br>

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
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/approval_required.jsp#2 $$Change: 651448 $ --%>

<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<!-- Title: GiftCertificate  -->
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

<%-- 
<dsp:setvalue value="DCS5Team@example.com" param="messageFrom"/>
<dsp:setvalue value="DCS5Team@example.com" param="messageReplyTo"/>
--%>
<dsp:setvalue value="���i�����͂��Ă��܂��B" param="messageSubject"/>
<dsp:setvalue value="GiftCertificate" param="mailingName"/>

<h3>����͓d�q���[�����i���̃T���v���ł��B��]�̃e���v���[�g���g�p�ł��܂��B
�ʂ̃e���v���[�g�ɕύX����ɂ́A
<code>/atg/commerce/fulfillment/SoftgoodFulfiller.giftCertificateEmailTemplate</code> ��
�ݒ���g�p���Ă��������B</h3><br>

<p>���̃e���v���[�g�ŁA���i���w���҂̃v���t�@�C���A
�w�����ꂽ���i���̐��A����я��i����
�z�ɃA�N�Z�X���܂��B<br>

<p><dsp:valueof param="purchaser.firstName"></dsp:valueof> <dsp:valueof param="purchaser.lastName">���q</dsp:valueof>
�l����� 
<dsp:droplet name="Switch">
  <dsp:param name="value" param="quantity"/>
  <dsp:oparam name="1">
    ���i�� 
  </dsp:oparam>
  <dsp:oparam name="default">
    <dsp:valueof param="quantity"/> ���i�� 
  </dsp:oparam>
</dsp:droplet>

�����a���肵�Ă��܂��B���z�͎��̂Ƃ���ł��F 
<dsp:valueof converter="currency" locale="Profile.priceList.locale" param="giftCertificate.amount"/> 
<br>

<p>�g�p���Ă��������N���[�� �R�[�h�́A
���i���� repositoryId �Ɠ����ł��B<br>

<p>���̃N���[���R�[�h���g�p���Ă��������F <dsp:valueof param="giftCertificate.repositoryId"/><br>
  
<p> ���肪�Ƃ��������܂����B 
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/fulfillment/GiftCertificate.jsp#2 $$Change: 651448 $--%>

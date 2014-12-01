<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<!-- Title: FulfillmentEmail -->
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/commerce/pricing/PriceItem"/>

<dsp:setvalue value="�A�C�e�������q�l�̃I�[�_�[����폜����܂����B" param="messageSubject"/>
<%-- 
<dsp:setvalue value="DCS5Team@example.com" param="messageFrom"/>
<dsp:setvalue value="DCS5Team@example.com" param="messageReplyTo"/>
--%>
<dsp:setvalue value="ItemRemoved" param="mailingName"/>

<dsp:setvalue paramvalue="message.order" param="order"/>
<dsp:setvalue paramvalue="message.profile" param="profile"/>

<p><dsp:valueof param="profile.lastName">���q</dsp:valueof>
<dsp:valueof param="profile.firstName"/>�l�ցA

<p>���̃A�C�e�������q�l�̃I�[�_�[����폜����Ă��܂��F
<table cellspacing=2 cellpadding=0 border=0>
  <tr valign=top>
    <td>
	<dsp:valueof param="message.commerceItem.quantity"/>
    </td>
    <td>
	<dsp:valueof param="message.product.displayName"/>
    </td>
    <td>&nbsp;&nbsp;</td>
    <td>
	<dsp:valueof param="message.catalogRef.displayName"/>
    </td>
  </tr>
</table>
<p>���̃I�[�_�[�̊m�F�ԍ��͎��̂Ƃ���ł��F
<dsp:valueof param="order.id">�i�J�X�^�}�T�[�r�X�ɂ��A�����������B�j</dsp:valueof>

<hr>

<!-- Itemized order -->
<br>
<table cellspacing=2 cellpadding=0 border=0>
<tr>
<td><b>����</b></td>
<td></td>
<td>&nbsp;&nbsp;</td>
<td><b>���i</b></td>
<td>&nbsp;&nbsp;</td>
<td><b>SKU</b></td>
<td>&nbsp;&nbsp;</td>
<td align=right><b>�\�����i</b></td>
<td>&nbsp;&nbsp;</td>
<td align=right><b>�������i</b></td>
<td>&nbsp;&nbsp;</td>
<td align=right><b>���v���i</b></td>
</tr>

<tr><td colspan=12><hr size=0></td></tr>


<dsp:droplet name="ForEach">
  <dsp:param name="array" param="order.commerceItems"/>
  <dsp:param name="elementName" value="item"/>
  <dsp:oparam name="output">
		<tr valign=top>
			<td>
				<dsp:valueof param="item.quantity">���ʂȂ�</dsp:valueof>
			</td>
			<td></td>
			<td>&nbsp;&nbsp;</td>
			<td>
			    <dsp:valueof param="item.auxiliaryData.productRef.displayName">�\�����Ȃ��B</dsp:valueof>
			</td>
			<td>&nbsp;&nbsp;</td>
			<td>
			    <dsp:valueof param="item.auxiliaryData.catalogRef.displayName"/>
			</td>
			<td>&nbsp;&nbsp;</td>
			<td align=right>
				<dsp:valueof converter="currency" locale="Profile.priceList.locale" param="item.priceInfo.listPrice">���i�Ȃ�</dsp:valueof>
			</td>
			<td>&nbsp;&nbsp;</td>
			<td align=right>
				<dsp:droplet name="Switch">
					<dsp:param name="value" param="item.priceInfo.onSale"/>
					<dsp:oparam name="true">
						<dsp:valueof converter="currency" locale="Profile.priceList.locale" param="item.priceInfo.salePrice"/>
					</dsp:oparam>
				</dsp:droplet>
			</td>
			<td>&nbsp;&nbsp;</td>
			<td align=right>
				<dsp:valueof converter="currency" locale="Profile.priceList.locale" param="item.priceInfo.amount">���i�Ȃ�</dsp:valueof>
			</td>
		</tr>
  </dsp:oparam>

  <dsp:oparam name="empty"><tr colspan=10 valign=top><td>�A�C�e���Ȃ�</td></tr></dsp:oparam>
</dsp:droplet>

<tr><td colspan=12><hr size=0></td></tr>
<tr>
<td colspan=11 align=right>���v</td>
<td align=right>
	<dsp:valueof converter="currency" locale="Profile.priceList.locale" param="order.priceInfo.amount">���i�Ȃ�</dsp:valueof>
</td>
</tr>

<tr>
<td colspan=11 align=right>�z�B</td>
<td align=right>
	<dsp:valueof converter="currency" locale="Profile.priceList.locale" param="order.priceInfo.shipping">���i�Ȃ�</dsp:valueof>
</td>
</tr>

<tr>
<td colspan=11 align=right>��</td>
<td align=right>
	<dsp:valueof converter="currency" locale="Profile.priceList.locale" param="order.priceInfo.tax">���i�Ȃ�</dsp:valueof>
</td>
</tr>
        
<tr>
<td colspan=11 align=right><b>���v</b></td>
<td align=right>
	<b><dsp:valueof converter="currency" locale="Profile.priceList.locale" param="order.priceInfo.total">���i�Ȃ�</dsp:valueof></b>
</td>
</tr>
</table>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/fulfillment/ItemRemovedFromOrder.jsp#2 $$Change: 651448 $--%>

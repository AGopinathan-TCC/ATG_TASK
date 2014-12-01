<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<%/* A shopping cart-like display of order information */%>

<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/commerce/inventory/InventoryLookup"/>
<dsp:importbean bean="/atg/commerce/pricing/PriceItem"/>
<dsp:importbean bean="/atg/dynamo/droplet/Compare"/>
<table cellspacing=2 cellpadding=0 border=0>
<tr>
<td><b>����</b></td>
<td></td>
<td>&nbsp;&nbsp;</td>
<td><b>���i</b></td>
<td>&nbsp;&nbsp;</td>
<td><b>SKU</b></td>
<td>&nbsp;&nbsp;</td>

<dsp:droplet name="Switch">
  <dsp:param name="value" param="displayStockStatus"/>
  <dsp:oparam name="true">    
    <td><b>�݌ɂ���H</b></td>
    <td>&nbsp;&nbsp;</td>
  </dsp:oparam>
</dsp:droplet>

<td align=right><b>�\�����i</b></td>
<td>&nbsp;&nbsp;</td>
<td align=right><b>�������i</b></td>
<td>&nbsp;&nbsp;</td>
<td align=right><b>���v���i</b></td>
</tr>

<dsp:droplet name="Switch">
  <dsp:param name="value" param="displayStockStatus"/>
  <dsp:oparam name="true">    
    <tr><td colspan=14><hr size=0></td></tr>
  </dsp:oparam>
  <dsp:oparam name="default">
    <tr><td colspan=12><hr size=0></td></tr>
  </dsp:oparam>
</dsp:droplet>

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
			    <dsp:valueof param="item.auxiliaryData.productRef.displayName">�s��</dsp:valueof>
			</td>
			<td>&nbsp;&nbsp;</td>
			<td>
			    <dsp:valueof param="item.auxiliaryData.catalogRef.displayName">�s��</dsp:valueof>
			</td>
			<td>&nbsp;&nbsp;</td>

			    <dsp:droplet name="Switch">
			      <dsp:param name="value" param="displayStockStatus"/>
			      <dsp:oparam name="true">    
				<td>
				    <dsp:droplet name="InventoryLookup">
				      <dsp:param name="itemId" param="item.catalogRefId"/>
				      <dsp:param name="useCache" value="true"/>
				      <dsp:oparam name="output">
					<dsp:droplet name="Switch">
					  <dsp:param name="value" param="inventoryInfo.availabilityStatus"/>
					  <dsp:oparam name="1000">
					    <b>�͂�</b>
					  </dsp:oparam>
					  <dsp:oparam name="default">
					    ������
					  </dsp:oparam>
				        </dsp:droplet>
				      </dsp:oparam>
				    </dsp:droplet>
				</td>
				<td>&nbsp;&nbsp;</td>
			      </dsp:oparam>
			    </dsp:droplet>

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
					<dsp:oparam name="false">
					        �̔����i�Ȃ�
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
<dsp:droplet name="/atg/dynamo/droplet/Compare">
<dsp:param name="obj1" param="order.priceInfo.amount"/>
<dsp:param name="obj2" param="order.priceInfo.rawSubtotal"/>
<dsp:oparam name="equal">
</dsp:oparam>
<dsp:oparam name="default">
  <dsp:droplet name="Switch">
  <dsp:param name="value" param="displayStockStatus"/>
  <dsp:oparam name="true">    
    <tr><td colspan=14><hr size=0></td></tr>
    <tr>
      <td colspan=13 align=right>����</td>
  </dsp:oparam>
  <dsp:oparam name="default">
    <tr><td colspan=12><hr size=0></td></tr>
    <tr>
      <td colspan=11 align=right>����</td>
  </dsp:oparam>
</dsp:droplet>

  <td align=right>
	
        <b><dsp:getvalueof id="pval0" param="order.priceInfo.discountAmount">
             <dsp:include page="../../common/DisplayCurrencyType.jsp">
               <dsp:param name="currency" value="<%=pval0%>"/>
             </dsp:include>
           </dsp:getvalueof></b>  	  	
	
  </td>
</tr>
</dsp:oparam>
</dsp:droplet>
    

<dsp:droplet name="Switch">
  <dsp:param name="value" param="displayStockStatus"/>
  <dsp:oparam name="true">    
    <tr><td colspan=14><hr size=0></td></tr>
    <tr>
      <td colspan=13 align=right>���v</td>
  </dsp:oparam>
  <dsp:oparam name="default">
    <tr><td colspan=12><hr size=0></td></tr>
    <tr>
      <td colspan=11 align=right>���v</td>
  </dsp:oparam>
</dsp:droplet>

<td align=right>
  <dsp:valueof converter="currency" locale="Profile.priceList.locale" param="order.priceInfo.amount">���i�Ȃ�</dsp:valueof>
</td>
</tr>

<tr>
<dsp:droplet name="Switch">
  <dsp:param name="value" param="displayStockStatus"/>
  <dsp:oparam name="true">    
    <td colspan=13 align=right>�z�B</td>
  </dsp:oparam>
  <dsp:oparam name="default">
    <td colspan=11 align=right>�z�B</td>
  </dsp:oparam>
</dsp:droplet>

<td align=right>
	<dsp:valueof converter="currency" locale="Profile.priceList.locale" param="order.priceInfo.shipping">���i�Ȃ�</dsp:valueof>
</td>
</tr>

<tr>
<dsp:droplet name="Switch">
  <dsp:param name="value" param="displayStockStatus"/>
  <dsp:oparam name="true">    
    <td colspan=13 align=right>��</td>
  </dsp:oparam>
  <dsp:oparam name="default">
    <td colspan=11 align=right>��</td>
  </dsp:oparam>
</dsp:droplet>

<td align=right>
	<dsp:valueof converter="currency" locale="Profile.priceList.locale" param="order.priceInfo.tax">���i�Ȃ�</dsp:valueof>
</td>
</tr>

<tr>
<dsp:droplet name="Switch">
  <dsp:param name="value" param="displayStockStatus"/>
  <dsp:oparam name="true">    
    <td colspan=13 align=right><b>���v</b></td>
  </dsp:oparam>
  <dsp:oparam name="default">
    <td colspan=11 align=right><b>���v</b></td>
  </dsp:oparam>
</dsp:droplet>

<td align=right>
	<b><dsp:valueof converter="currency" locale="Profile.priceList.locale" param="order.priceInfo.total">���i�Ȃ�</dsp:valueof></b>
</td>
</tr>
</table>
<br>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/fulfillment/DisplayOrderSummary.jsp#2 $$Change: 651448 $--%>

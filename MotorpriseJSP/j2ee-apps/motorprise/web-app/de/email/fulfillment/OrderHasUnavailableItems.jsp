<%@ taglib uri="dsp" prefix="dsp" %>
<dsp:page>

<!-- Title: FulfillmentEmail -->
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/commerce/pricing/PriceItem"/>

<dsp:setvalue value="Die Ausf�hrung Ihrer Bestellung verz�gert sich." param="messageSubject"/>
<%-- 
<dsp:setvalue value="DCS5Team@example.com" param="messageFrom"/>
<dsp:setvalue value="DCS5Team@example.com" param="messageReplyTo"/>
--%>
<dsp:setvalue value="OrderHasUnavailableItems" param="mailingName"/>

<dsp:setvalue paramvalue="message.order" param="order"/>
<dsp:setvalue paramvalue="message.shipItemRels" param="itemRels"/>
<dsp:setvalue paramvalue="message.profile" param="profile"/>

<p> <dsp:valueof param="profile.firstName">Sehr geehrter Kunde</dsp:valueof>
 <dsp:valueof param="profile.lastName"/>,

<p> Die Best�tigungsnummer f�r Ihre Bestellung ist: 
<dsp:valueof param="order.id">Nicht definiert</dsp:valueof>

<p>Ihre Bestellung kann derzeit nicht ausgef�hrt werden.

<!-- Shipping information -->
<table>
<tr valign=top>
  <td>
      <b>Folgende Artikel sind vor�bergehend nicht erh�ltlich:</b><br>
      <dsp:droplet name="ForEach">
	<dsp:param name="array" param="itemRels"/>
	<dsp:param name="elementName" value="itemRel"/>
	<dsp:oparam name="empty">
	  Bitte ignorieren Sie diese E-Mail.
	</dsp:oparam>
	<dsp:oparam name="output">
	   <dsp:valueof param="itemRel.commerceItem.auxiliaryData.catalogRef.displayName">Kein Anzeigename.</dsp:valueof>
	   ist
	  <dsp:droplet name="Switch">
	    <dsp:param name="value" param="itemRel.state"/>
	    <dsp:oparam name="3">
	      VOR_BESTELLT
	    </dsp:oparam>
	    <dsp:oparam name="4">
	      LIEFERR�CKSTAND
	    </dsp:oparam>	    
	    <dsp:oparam name="11">
	      NICHT_AUF_LAGER
	    </dsp:oparam>	    
	  </dsp:droplet>
	  <br>
       </dsp:oparam>
     </dsp:droplet>
 </td>
</tr>
<tr></tr>
</table>

<p>Bitte �berpr�fen Sie die folgenden Informationen.

<hr>

<!-- Itemized order -->
<br>
<dsp:getvalueof id="pval0" param="order"><dsp:include page="DisplayOrderSummary.jsp"><dsp:param name="order" value="<%=pval0%>"/><dsp:param name="displayStockStatus" value="false"/></dsp:include></dsp:getvalueof>

<!-- Shipping information -->
<dsp:getvalueof id="pval0" param="order"><dsp:include page="DisplayShippingInfo.jsp"><dsp:param name="order" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>

<!-- Payment information -->
<dsp:getvalueof id="pval0" param="order"><dsp:include page="DisplayPaymentInfo.jsp"><dsp:param name="order" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>

</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/de/email/fulfillment/OrderHasUnavailableItems.jsp#2 $$Change: 651448 $--%>

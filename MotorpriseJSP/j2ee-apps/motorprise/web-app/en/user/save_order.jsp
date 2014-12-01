<%@ taglib uri="dsp" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/commerce/gifts/IsGiftShippingGroup"/>
<dsp:importbean bean="/atg/commerce/order/purchase/SaveOrderFormHandler"/>

<%/* expect a order number to be passed in, we could be acceepting a orderid but run the risk of users trying random orderId's and
seeing other people's orders. We might use the obfuscated id generator, but this is safter then even that*/%>

<DECLAREPARAM NAME="orderId" CLASS="java.lang.Integer" DESCRIPTION="number of the saved order">


<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value=" Save Order"/></dsp:include>

<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
    <dsp:include page="../common/FormError.jsp"></dsp:include>
  </tr>
  <tr bgcolor="#DBDBDB" > 
    <td colspan=2 height=18> &nbsp; <span class=small>
     <dsp:a href="../checkout/cart.jsp">Current Order</dsp:a> &gt;
     Save Order </span>
    </td>

  <tr valign=top> 
    <td width=55><img src="../images/d.gif" hspace=27></td>
    <!-- if nothing is in the cart say there is nothing in the cart -->
    <!-- put errors here -->
    <P>
    <td valign="top" width=745>
    <!-- this table just for indent -->
    <table border=0 cellpadding=4 width=80%>
      <tr><td><img src="../images/d.gif"></td></tr>
      <tr>
        <td><span class="big">Current Order</span></td>
      </tr>
      <tr><td><img src="../images/d.gif"></td></tr>
      <tr>
        <td colspan=2><table width=100% cellpadding=3 cellspacing=0 border=0>
        <tr><td class=box-top>&nbsp;Save Current Order</td></tr></table></td>
      </tr>
    <tr>
      <td><b>Order # <dsp:valueof bean="ShoppingCart.current.id"/></b>
                  <dsp:form action="saved_orders.jsp">
                  Enter a name to identify this order:<p>
                  <dsp:input bean="SaveOrderFormHandler.description" type="text"/> 
                  <dsp:input bean="SaveOrderFormHandler.saveOrder" type="submit" value="Save order"/>
                  <dsp:input bean="SaveOrderFormHandler.saveOrder" type="hidden" value="save"/>
                  <dsp:input bean="SaveOrderFormHandler.saveOrderSuccessURL" type="hidden" value="../user/saved_orders.jsp"/> 
                  <dsp:input bean="SaveOrderFormHandler.saveOrderErrorURL" type="hidden" value="../user/save_order.jsp"/>
      </td>
    </tr>
    <tr>
      <td>    
        <table border=0 cellpadding=4 cellspacing=1 width=100%>
        <tr bgcolor="#666666">
        <td colspan=2><span class=smallbw>Part #</span></td>
        <td colspan=2><span class=smallbw>Name</span></td>
        <td colspan=2 align=middle><span class=smallbw>Qty</span></td>
        <td colspan=2align=middle><span class=smallbw>Total</span></td>
        </tr>

        <dsp:droplet name="ForEach">
          <dsp:param bean="ShoppingCart.current.commerceItems" name="array"/>
          <dsp:oparam name="output">
	    <dsp:getvalueof id="currentItem" param="element" idtype="atg.commerce.order.CommerceItem">
	      <tr valign=top>

	      <%-- Display part number, product name/link, inventory info columns --%>
	      <dsp:include page="../checkout/cart_line_item.jsp">
	        <dsp:param name="item" value="<%=currentItem%>"/>
	      </dsp:include>

	      <%-- Display quantity --%>
              <td align=center><dsp:valueof param="element.quantity"/></td>
              <td></td>

	      <%-- display total list price and any discounted total price --%>
	      <dsp:include page="../common/DisplayAmount.jsp">
	        <dsp:param name="item" value="<%=currentItem%>"/>
              </dsp:include>

	      </tr>
	    </dsp:getvalueof>
          </dsp:oparam>
        </dsp:droplet>

    
           <tr>
             <td colspan=8>
               <table border=0 cellpadding=0 cellspacing=0 width=100%>
                 <tr bgcolor="#666666"><td><img src="../images/d.gif"></td></tr>
               </table>
             </td>
           </tr>
           <tr>
             <td colspan=4>&nbsp; </td>
             <td>Subtotal</td>
             <td></td>
             <td align="right">
             <b><dsp:valueof bean="ShoppingCart.current.priceInfo.amount" converter="currency" locale="Profile.priceList.locale"/></b>
             </td>
           </tr>
         </table>
         </dsp:form>
         </td>
       </tr>
     </table>
     </td>
   </tr>
 </table>
 </td>
 </tr>
</table>

</body>
</html>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/en/user/save_order.jsp#2 $$Change: 651448 $--%>

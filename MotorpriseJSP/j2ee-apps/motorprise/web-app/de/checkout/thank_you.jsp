<%@ taglib uri="dsp" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>

<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value=" Checkout"/></dsp:include>
<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=3>
      <dsp:include page="../common/BrandNav.jsp"></dsp:include>
    </td>
  </tr>

  <tr bgcolor="#DBDBDB">
    <%-- put breadcrumbs here --%>
    <td colspan=3 height=18><span class=small>
       &nbsp; &nbsp;</span>
    </td>
  </tr>

  <tr><td><dsp:img src="../images/d.gif" vspace="10"/></td></tr>

  <tr>
    <td width=55><dsp:img src="../images/d.gif" hspace="27"/></td>
    <td valign="top" width=745>
    <table border=0 cellpadding=4 width=80%>
      <tr> 
        <td align="top" colspan=3>  
        <span class="big">Vielen Dank f�r Ihre Bestellung</span><p>
        <dsp:include page="../common/FormError.jsp"></dsp:include>
        </td>
      </tr>
      <dsp:droplet name="Switch">
        <dsp:param bean="ShoppingCart.last.state" name="value"/>
        <dsp:oparam name="5000">
          <tr>
            <td><span class=smallb>F�r Ihre Bestellung ist eine Bewilligung erforderlich. Der zust�ndige Pr�fer wurde benachrichtigt, um Ihre Bestellung pr�fen zu k�nnen.</span><p></td>
          </tr>
        </dsp:oparam>
        <dsp:oparam name="default">
        </dsp:oparam>
      </dsp:droplet>
      <tr>
        <td>Ihre Bestellnummer: <dsp:a href="../user/order.jsp">
        <dsp:param bean="ShoppingCart.last.id" name="orderId"/><dsp:valueof bean="ShoppingCart.last.id" /></dsp:a>.
        </td>
      </tr>
      <tr>
        <td>Sie erhalten in K�rze eine Best�tigung mit Ihren Bestelldaten per E-Mail. Um letzte �nderungen an Ihrer Bestellung vorzunehmen, den Versand zu verfolgen oder andere Kontenverwaltungsaufgaben durchzuf�hren, rufen Sie den Bereich <dsp:a href="../user/my_account.jsp">Mein Konto</dsp:a> auf. 
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>

</body>
</html>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/de/checkout/thank_you.jsp#2 $$Change: 651448 $--%>

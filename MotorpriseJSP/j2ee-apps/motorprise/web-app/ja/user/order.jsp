<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/projects/b2bstore/profile/PersonLookup"/>
<dsp:importbean bean="/atg/dynamo/droplet/Format"/>

<dsp:droplet name="OrderLookup">
  <dsp:param name="orderId" param="orderId"/>
  <dsp:oparam name="error">
    <dsp:valueof param="errorMsg"/>
  </dsp:oparam>
  <dsp:oparam name="output">
    <%/* "order" param has current order */%>
    <dsp:setvalue paramvalue="result" param="order"/>

    <dsp:include page="../common/HeadBody.jsp">
    <dsp:droplet name="Format">
    <dsp:param name="firstArg" value=" Order # "/>
    <dsp:param name="secondArg" param="order.Id"/>
    <dsp:param name="format" value="{firstArg}{secondArg}"/>
    <dsp:oparam name="output">
        <dsp:param name="pagetitle" param="message"/>
    </dsp:oparam>
    </dsp:droplet>

    </dsp:include>

    <table border=0 cellpadding=0 cellspacing=0 width=800>
      <tr>
        <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
      </tr>
      <!--breadcrumbs-->
      <dsp:droplet name="Switch">
        <dsp:param name="value" param="orderState"/>
        <dsp:oparam name="closed">
          <tr bgcolor="#DBDBDB" > 
            <td colspan=2 height=18> &nbsp; <span class=small>
            <dsp:a href="my_account.jsp">���̃A�J�E���g</dsp:a> &gt; 
            <dsp:a href="orders_filled.jsp">���s�ς݂̃I�[�_�[</dsp:a> &gt; 
            �I�[�_�[�ԍ�<dsp:valueof  param="orderId"/></td>
          </tr>
        </dsp:oparam>
        <dsp:oparam name="default">
          <tr bgcolor="#DBDBDB" > 
            <td colspan=2 height=18> &nbsp; <span class=small>
            <dsp:a href="my_account.jsp">���̃A�J�E���g</dsp:a> &gt; 
            <dsp:a href="orders_open.jsp">�������̃I�[�_�[</dsp:a> &gt; 
            �I�[�_�[�ԍ�<dsp:valueof  param="orderId"/></td>
          </tr>
        </dsp:oparam>
      </dsp:droplet>
  
      <tr>
        <td width=55><img src="../images/d.gif"></td>  
        <td valign="top" width=745>
        <!-- main content area -->
        <table border=0 cellpadding=4 width=80%>
          <!-- vertical space -->
          <tr><td><img src="../images/d.gif" vspace=0></td></tr>

          <tr valign=top>
            <td colspan=3><span class=big>���̃A�J�E���g</span></td>
          </tr>

          <tr><td><img src="../images/d.gif" vspace=0></td></tr>
    
          <tr valign=top>
            <td colspan=3><b>�I�[�_�[�ԍ� <dsp:valueof param="order.id"/></b></td>
          </tr>
    

          <tr valign=top>
            <td colspan=2>
            <table width=100% cellpadding=3 cellspacing=0 border=0>
            <tr><td class=box-top>&nbsp;�I�[�_�[�X�e�[�^�X</td></tr></table>
            </td>
          </tr>
       
          <tr>
            <td colspan=2>
            <!-- general order info -->
            <dsp:valueof date="yyyy'�N' MM'��' dd'��'" param="order.submittedDate"/> �̃I�[�_�[�B<br>
            <dsp:droplet name="Switch">
              <dsp:param name="value" param="order.stateAsString"/>
              <dsp:oparam name="NO_PENDING_ACTION">
                �I�[�_�[�X�e�[�^�X�FSHIPPED
              </dsp:oparam>
              <dsp:oparam name="FAILED_APPROVAL">
                �I�[�_�[�X�e�[�^�X�F <dsp:valueof param="order.stateAsUserResource"/>
              </dsp:oparam>
              <dsp:oparam name="default">
                �I�[�_�[�X�e�[�^�X�F <dsp:valueof param="order.stateAsUserResource"/><p>
                <p>
                <dsp:a href="cancel_order.jsp"><dsp:param name="orderId" param="orderId"/>�I�[�_�[�̃L�����Z��</dsp:a></td>
              </dsp:oparam>
            </dsp:droplet>

          </tr>

          <dsp:droplet name="Switch">
            <dsp:param name="value" param="orderState"/>
            <dsp:oparam name="closed">
              <dsp:droplet name="ForEach">
                <dsp:param name="array" param="order.approverIds"/>
                <dsp:oparam name="output">
                <tr>
                  <td colspan=2>
                  <dsp:droplet name="PersonLookup">
                    <dsp:param name="id" param="order.approverIds[0]"/>
                    <dsp:param name="elementName" value="Person"/>
                    <dsp:oparam name="output">
                      �I�[�_�[���F�ҁF<dsp:valueof param="Person.lastName">���Ȃ�</dsp:valueof>
                      <dsp:valueof param="Person.firstName">���Ȃ�</dsp:valueof><br>
                    </dsp:oparam>
                  </dsp:droplet>          
                    ���F�҃��b�Z�[�W�F 
                    <dsp:valueof param="order.approverMessages[0]"/>
                   </td>
                 </tr>
                </dsp:oparam>
              </dsp:droplet>

            </dsp:oparam>
            <dsp:oparam name="rejected">
              <tr>
                <td colspan=2>
                  <dsp:droplet name="PersonLookup">
                    <dsp:param name="id" param="order.approverIds[0]"/>
                    <dsp:param name="elementName" value="Person"/>
                    <dsp:oparam name="output">
                      �I�[�_�[���F�ҁF<dsp:valueof param="Person.lastName">���Ȃ�</dsp:valueof>
                      <dsp:valueof param="Person.firstName">���Ȃ�</dsp:valueof><br>
                    </dsp:oparam>
                  </dsp:droplet>          
                    ���F�҃��b�Z�[�W�F 
                    <dsp:valueof param="order.approverMessages[0]"/>
                   </td>
                 </tr>
            </dsp:oparam>
          </dsp:droplet>

          <tr><td><img src="../images/d.gif" vspace=0></td></tr>

          <dsp:getvalueof id="pval0" param="order"><dsp:include page="../checkout/displayPaymentInfo.jsp"><dsp:param name="order" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>
          <dsp:getvalueof id="pval0" param="order"><dsp:include page="../checkout/displayCostCenterInfo.jsp"><dsp:param name="order" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>
          <dsp:getvalueof id="pval0" param="order"><dsp:include page="../checkout/displayShippingInfo.jsp"><dsp:param name="order" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>
          

        </table>
        </td>
      </tr>
    </table>
    </div>

  <%/* close original OrderLookup droplet*/%>
  </dsp:oparam>
</dsp:droplet>
</body>
</html>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/user/order.jsp#2 $$Change: 651448 $--%>

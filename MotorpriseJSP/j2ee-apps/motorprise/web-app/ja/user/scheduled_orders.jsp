<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/scheduled/ScheduledOrderFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/RQLQueryForEach"/>

<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value="�X�P�W���[���ς݃I�[�_�["/></dsp:include>

<table border=0 cellpadding=0 cellspacing=0>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
  </tr>
  <tr bgcolor="#DBDBDB" > 
    <td colspan=2 height=18> &nbsp; <span class=small>
    <dsp:a href="my_account.jsp">���̃A�J�E���g</dsp:a> &gt; 
    �X�P�W���[���ς݃I�[�_�[</td>
  </tr>
  <tr valign=top> 
    <td width=55><img src="../images/d.gif" hspace=27></td>  
 
    <!-- main content area -->
    <td valign="top" width=745>  
    <table border=0 cellpadding=4 width=80%>
      <tr><td><img src="../images/d.gif"></td>
    <tr valign=top>
        <td><span class=big>���̃A�J�E���g</span></td>
      </tr>

      <!-- vertical space -->
      <tr><td><img src="../images/d.gif" vspace=0></td></tr>

      <tr>
       <td>
        <table width=100% cellpadding=3 cellspacing=0 border=0>
        <tr><td class=box-top>&nbsp;�X�P�W���[���ς݃I�[�_�[</td></tr></table>
        </td>
      </tr>

      <!-- vertical space -->
      <tr><td><img src="../images/d.gif" vspace=0></td></tr>
 
      <tr valign=top>
        <td>
          
        <dsp:droplet name="RQLQueryForEach">
         <dsp:param bean="/atg/dynamo/transaction/TransactionManager" name="transactionManager"/>
         <dsp:param bean="/atg/commerce/order/OrderRepository" name="repository"/>
         <dsp:param name="itemDescriptor" value="scheduledOrder"/>
         <dsp:param name="queryRQL" value="profileId=:profileId"/>
         <dsp:param bean="Profile.repositoryId" name="profileId"/>
         <dsp:oparam name="output">
          <dsp:a href="scheduled_order_preview.jsp">
          <dsp:param name="scheduledOrderId" param="element.repositoryId"/> 
          <dsp:param name="source" value="scheduledOrder"/>
          <dsp:valueof param="element.name"/>  
          </dsp:a><br> 
         </dsp:oparam> 
         <dsp:oparam name="empty">
          �X�P�W���[���ς݃I�[�_�[�͂���܂���B
         </dsp:oparam>
        </dsp:droplet>
          
     
            <p>
            <dsp:a href="scheduled_order_new.jsp" bean="ScheduledOrderFormHandler.repositoryId" beanvalue="/Constants.null">
              <dsp:param name="createNew" value="new"/>
              <span class=smallb>�X�P�W���[���ς݃I�[�_�[�̐V�K�쐬</span>
            </dsp:a>
        </td>
      </tr>

      <!-- vertical space -->
      <tr><td><img src="../images/d.gif" vspace=0></td></tr>
    </table>

    </td>
  </tr>

</table>
</div>
</body>
</html>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/user/scheduled_orders.jsp#2 $$Change: 651448 $--%>

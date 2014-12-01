<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<dsp:importbean bean="/atg/commerce/approval/ApprovalFormHandler"/>
<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/projects/b2bstore/profile/PersonLookup"/>

<DECLAREPARAM NAME="orderId" CLASS="java.lang.String" DESCRIPTION="The id of the order to reject">

<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value="- ����"/></dsp:include>
<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
  </tr>
  <tr bgcolor="#DBDBDB" > 
    <td colspan=2 height=18> &nbsp; <span class=small>
    <dsp:a href="my_account.jsp">���̃A�J�E���g</dsp:a> &gt; 
    <dsp:a href="approvals.jsp">���F�҂��̃I�[�_�[</dsp:a> &gt;
    <dsp:a href="order_pending_approval.jsp"><dsp:param name="orderId" param="orderId"/>�I�[�_�[</dsp:a> &gt; �I�[�_�[�̋���
    </span></td>
  </tr>
  <tr valign=top> 
    <td width=55><img src="../images/d.gif"></td>
    
    <!-- main content area -->
    <td  valign="top" width=745>  
    <table border=0 cellpadding=4 width=80%>
      <tr><td colspan=2><img src="../images/d.gif" vspace=0></td></tr>
    <tr valign=top>
        <td colspan=2><span class=big>���̃A�J�E���g</span></td>
      </tr>

      <tr valign=top>
        <td colspan=2>
        <table width=100% cellpadding=3 cellspacing=0 border=0>
        <tr><td class=box-top>&nbsp;�I�[�_�[�̋���</td></tr></table>
        </td>
      </tr>
      
      
      <!-- vertical space -->
      <tr><td colspan=2><img src="../images/d.gif" vspace=0></td></tr>
      
     <tr>
        <td><dsp:include page="ApprovalFormHandlerErrorMessages.jsp"></dsp:include></td>
        <td>�I�[�_�[<dsp:valueof param="orderId">�I�[�_�[�Ȃ�</dsp:valueof><br>

        <dsp:droplet name="OrderLookup">
          <dsp:param name="orderId" param="orderId"/>
          <dsp:oparam name="output">
            <dsp:valueof date="yyyy/M/dd K:mm a" param="result.submittedDate">���M���Ȃ�</dsp:valueof>
            �̃I�[�_�[<br>
            <dsp:droplet name="PersonLookup">
              <dsp:param name="id" param="result.profileId"/>
              <dsp:param name="elementName" value="Person"/>
              <dsp:oparam name="output">
                �w����<dsp:valueof param="Person.lastName">���Ȃ�</dsp:valueof> <dsp:valueof param="Person.firstName">���Ȃ�</dsp:valueof>
              </dsp:oparam>
            </dsp:droplet>          
          </dsp:oparam>
        </dsp:droplet>
      </tr>
      <tr>
        <td colspan=2>
				<dsp:form action="order_pending_approval.jsp" method="post">
            <dsp:input bean="ApprovalFormHandler.orderId" paramvalue="orderId" type="hidden"/>
            <span class=help>���b�Z�[�W����͂��Ă��������B</span><br>
            <dsp:textarea bean="ApprovalFormHandler.approverMessage" rows="7" cols="50"></dsp:textarea><p>
				    <input name="orderId" type="hidden" value="<dsp:valueof param="orderId"/>">
            <dsp:input bean="ApprovalFormHandler.rejectOrderSuccessURL" type="hidden" value="reject_confirm.jsp"/>
            <dsp:input bean="ApprovalFormHandler.rejectOrderErrorURL" type="hidden" value="reject_order.jsp"/>
            <dsp:input bean="ApprovalFormHandler.rejectOrder" type="submit" value="�I�[�_�[�̋���"/> &nbsp;
            <input type="submit" value="�L�����Z��"> &nbsp;
            </dsp:form>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</div>
</body>
</html>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/user/reject_order.jsp#2 $$Change: 651448 $--%>

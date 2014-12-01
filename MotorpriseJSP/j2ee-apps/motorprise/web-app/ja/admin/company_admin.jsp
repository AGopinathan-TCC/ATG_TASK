<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
<dsp:importbean bean="/atg/dynamo/droplet/Compare"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/userdirectory/droplet/TargetPrincipals"/>
<dsp:importbean bean="/atg/userprofiling/MultiUserUpdateFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/MultiUserAddFormHandler"/>

<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value="��ЊǗ�"/></dsp:include>

<%-- Clear the values of these formhandlers since they are session scoped --%>

<dsp:setvalue bean="MultiUserUpdateFormHandler.clear" value=""/>
<dsp:setvalue bean="MultiUserAddFormHandler.clear" value=""/>

<%-- Set the Profile.currentOrganization property to the organization which was selected in the business_units.jsp page --%>

<dsp:droplet name="IsEmpty">
  <dsp:param name="value" param="organizationId"/>
  <dsp:oparam name="false">
    <dsp:droplet name="TargetPrincipals">
	  <dsp:param bean="Profile.id" name="userId"/>
	  <dsp:param name="roleName" value="admin"/>
	  <dsp:oparam name="output">
        <dsp:droplet name="ForEach">
        <dsp:param name="array" param="principals"/>
        <dsp:oparam name="output">
	    <dsp:droplet name="Compare">
	       <dsp:param name="obj1" param="organizationId"/>
  	       <dsp:param name="obj2" param="element.repositoryItem.repositoryid"/>
	  	<dsp:oparam name="equal"> 
		  <dsp:setvalue bean="Profile.currentOrganization" paramvalue="element.repositoryItem"/>
   
		</dsp:oparam>
	    </dsp:droplet>
	
          </dsp:oparam>
        </dsp:droplet>  <%-- End of ForEach --%>
      </dsp:oparam>
    </dsp:droplet>  <%-- End of TargetPricipals --%>
  </dsp:oparam>
</dsp:droplet> <%-- End of IsEmpty --%>

<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
  </tr>
  <tr bgcolor="#DBDBDB" > 
    <td colspan=2 height=18> &nbsp; <span class=small>
    <dsp:a href="business_units.jsp">��ЊǗ�</dsp:a> &gt;
  <dsp:valueof bean="Profile.currentOrganization.name"/></span></td>
  </tr>

  <tr valign=top> 
    <td width=55><dsp:img src="../images/d.gif"/></td>

    <%--  main content area --%>
    <td valign="top" width=745>  
    
    <table border=0 cellpadding=4 width=100%>
      <tr><td><dsp:img src="../images/d.gif" vspace="0"/></td></tr>
      <tr valign=top>
        <td><span class=big>��ЊǗ�</span><br><span class=little><dsp:valueof bean="Profile.currentOrganization.name" /></span></td>
      </tr>
    
      <tr><td><dsp:img src="../images/d.gif" vspace="0"/></td></tr>

      <tr valign=top>
        <td>
        <table width=80% cellpadding=3 cellspacing=0 border=0>
        <tr><td class=box-top>&nbsp; ���[�U</td></tr></table>
        </td>
      </tr>
      <tr>
        <td><dsp:a href="users.jsp">���[�U�̕\��
            <dsp:param name="startIndex" value="1"/>
            </dsp:a><br>
            <dsp:a href="new_user.jsp">���[�U�̐V�K�쐬</dsp:a><br>
            <dsp:a href="create_multiple_users.jsp">�����̃��[�U�̍쐬</dsp:a><br>
            <dsp:a href="multiple_user_edit.jsp">�����̃��[�U�̕ҏW</dsp:a><br>
            <dsp:a href="users_delete.jsp">���[�U�̍폜
            <dsp:param name="startIndex" value="1"/>
            </dsp:a>
        </td>      
      </tr>
      
      <tr><td><dsp:img src="../images/d.gif" vspace="0"/></td></tr>
      <tr valign=top>
        <td>
        <table width=80% cellpadding=3 cellspacing=0 border=0>
        <tr><td class=box-top>&nbsp; ��Џ��</td></tr></table>
        </td>
      </tr>
      <tr>
        <td>
          <dsp:a href="shipping_edit.jsp">�z�B��Z��</dsp:a><br>

          <dsp:droplet name="IsEmpty">
            <dsp:param bean="Profile.shippingAddrs" name="value"/>
            <dsp:oparam name="false">
              <dsp:a href="default_shipping_edit.jsp">�f�t�H���g�̔z�B��Z��</dsp:a><br>
            </dsp:oparam>
          </dsp:droplet>

          <dsp:a href="billing_addresses.jsp">������Z��</dsp:a><br>
          
          <%-- Display the Default billing address only if the invoiceRequestAuthorized is true for the current user --%>
  
          <dsp:droplet name="Switch">
            <dsp:param bean="Profile.invoiceRequestAuthorized" name="value"/>
            <dsp:oparam name="true">
              <dsp:droplet name="IsEmpty">
                <dsp:param bean="Profile.billingAddrs" name="value"/>
                <dsp:oparam name="output">
                  <dsp:a href="default_billing_edit.jsp">�f�t�H���g�̐�����Z��</dsp:a><br>
                </dsp:oparam>
              </dsp:droplet>
            </dsp:oparam>
          </dsp:droplet>

          <dsp:droplet name="Switch">
            <dsp:param bean="Profile.creditCardAuthorized" name="value"/>
            <dsp:oparam name="true">
               <dsp:a href="payment_edit.jsp">�N���W�b�g�J�[�h</dsp:a><br>
            </dsp:oparam>
          </dsp:droplet>
          <dsp:a href="cost_centers.jsp">�R�X�g�Z���^</dsp:a><br>
          <dsp:a href="purchase_limit_edit.jsp">���F</dsp:a><br>   
          <dsp:a href="payment_authorizations.jsp">�x�������@�̔F��</dsp:a>
        </td>      
      </tr>
    </table>
    </td>
  </tr>
</table>

</body>
</html>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/admin/company_admin.jsp#2 $$Change: 651448 $--%>

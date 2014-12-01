<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>

<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value=" ���̃A�J�E���g"/></dsp:include>
<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
  </tr>
  <tr bgcolor="#DBDBDB" > 
    <td colspan=2 height=18> &nbsp; <span class=small>
    <dsp:a href="my_account.jsp">���̃A�J�E���g</dsp:a> &gt; 
    <dsp:a href="my_profile.jsp">���̃v���t�@�C��</dsp:a> &gt; 
    �v���t�@�C���̕ҏW</td>
  </tr>

  <tr valign=top> 
    <td width=55><img src="../images/d.gif" hspace=27></td>

    <!-- main content area -->
    <td valign="top" width=745>
    <dsp:form action="my_profile.jsp" method="post">
      
    <table border=0 cellpadding=4 width=80%>
      <tr><td><img src="../images/d.gif" vspace=0></td></tr>
      <tr valign=top>
        <td colspan=2><span class=big>���̃A�J�E���g</span>
         <dsp:include page="../common/FormError.jsp"></dsp:include> 
        </td>
      </tr>

      <tr><td><img src="../images/d.gif" vspace=0></td></tr>

      <tr valign=top>
        <td colspan=2>
        <table width=100% cellpadding=3 cellspacing=0 border=0>
        <tr><td class=box-top>&nbsp;�l�A�J�E���g���̕ҏW</td></tr></table>
        </td>
      </tr>

      <tr><td><img src="../images/d.gif" vspace=0></td></tr>

      <dsp:input bean="ProfileFormHandler.checkForRequiredParameters" type="HIDDEN" value="false"/>
      
      <tr>
        <td align=right valignwidth=25%><span class=smallb>���O</span></td>
        <td width=75%><dsp:input bean="ProfileFormHandler.value.lastName"  size="15" type="text"/>
            <dsp:input bean="ProfileFormHandler.value.middleName" size="4"  type="text"/>
            <dsp:input bean="ProfileFormHandler.value.firstName" size="15"   type="text"/></td>
      </tr>
      <tr>
        <td align=right><span class=smallb>�d�q���[��</span></td>
        <td><dsp:input bean="ProfileFormHandler.value.email" size="30" type="text"/></td> 
      </tr>
      <tr>
        <td align=right><span class=smallb>��Ж�</span></td>
        <td><dsp:input bean="ProfileFormHandler.value.businessAddress.companyName" size="30" type="text" /></td>
      </tr>
      <tr>
        <td align=right><span class=smallb>�Z���P</span></td>
        <td><dsp:input bean="ProfileFormHandler.value.businessAddress.address1" size="30" type="text" /></td>
      </tr>
      <tr>
        <td align=right><span class=smallb>�Z���Q</span></td>
        <td><dsp:input bean="ProfileFormHandler.value.businessAddress.address2" size="30" type="text" /></td>
      </tr>
      <tr>
        <td align=right><span class=smallb>�s�����A�s���{���A�X�֔ԍ�</span></td>
        <td><dsp:input bean="ProfileFormHandler.value.businessAddress.city" size="15" type="text" />,&nbsp;
        <dsp:input bean="ProfileFormHandler.value.businessAddress.state" size="4" type="text" />&nbsp;
        <dsp:input bean="ProfileFormHandler.value.businessAddress.postalCode" size="8" type="text" /></td>
      </tr>
      <tr>
        <td align=right><span class=smallb>��</span></td>
        <td>
          <dsp:select bean="ProfileFormHandler.value.businessAddress.country">
            <%@ include file="../common/CountryPicker.jspf" %>
          </dsp:select>
        </td>
      </tr>

      <tr>
        <td align=right><span class=smallb>�d�b�ԍ�</span></td>
        <td><dsp:input bean="ProfileFormHandler.value.businessAddress.phoneNumber" size="30" type="text"/></td>
      </tr>
      <tr>
        <td align=right><span class=smallb>�t�@�b�N�X�ԍ�</span></td>
        <td><dsp:input bean="ProfileFormHandler.value.businessAddress.faxNumber" size="30" type="text"/></td>
      </tr>
      <tr>
        <td align=right><span class=smallb>����</span></td>
        <td><dsp:select bean="ProfileFormHandler.value.locale">
              <dsp:option value="ja_JP"/>���{��
              <dsp:option value="en_US"/>�p��
              <dsp:option value="de_DE"/>�h�C�c��
            </dsp:select></td>
      </tr>       
      <tr>
        <td></td>
          <dsp:input bean="ProfileFormHandler.updateErrorURL" type="HIDDEN" value="edit_profile.jsp"/>
        <td><br><dsp:input bean="ProfileFormHandler.update" type="submit" value=" �ۑ� "/> &nbsp;
        <input type="submit" value=" �L�����Z�� "></td>
      </tr>

    </table>
    </dsp:form>
    </td>
  </tr>

</table>

</body>
</html>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/user/edit_profile.jsp#2 $$Change: 651448 $--%>

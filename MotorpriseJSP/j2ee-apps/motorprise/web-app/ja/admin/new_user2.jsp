<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/projects/b2bstore/userdirectory/ProfileLookUp"/>
<dsp:importbean bean="/atg/userprofiling/MultiUserAddFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value="  ���[�U�̐V�K�쐬"/></dsp:include>

<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
  </tr>
  <tr bgcolor="#DBDBDB" > 
    <td colspan=2 height=18> &nbsp; <span class=small>
    <dsp:a href="company_admin.jsp">��ЊǗ�</dsp:a> &gt; 
    <dsp:a href="company_admin.jsp"><dsp:valueof bean="Profile.currentOrganization.name"/></dsp:a> &gt; 
    ���[�U�̐V�K�쐬</span></td>
  </tr>
  

  <tr valign=top> 
    <td width="55"><dsp:img src="../images/d.gif" hspace="27"/></td>

    <% /*  main content area */ %>
    <td valign="top" width=745>  
    
    <table border=0 cellpadding=4 width=80%>
      <tr><td><dsp:img src="../images/d.gif" vspace="0"/></td></tr>
      <tr valign=top>
        <td colspan=2><span class=big>��ЊǗ�</span><br><span class=little><dsp:valueof bean="Profile.currentOrganization.name" /></span></td>
      </tr>
      <tr><td><dsp:img src="../images/d.gif" vspace="0"/></td></tr>
      <tr valign=top>
        <td colspan=2>
        <table width=100% cellpadding=3 cellspacing=0 border=0>
        <tr><td class=box-top>&nbsp;���[�U�̐V�K�쐬</td></tr></table>
        </td>
      </tr>

      <tr>
        <td colspan=2><span class=small>���̃��[�U���쐬���܂����B���ׂẲ�Ђ܂��̓r�W�l�X���j�b�g��񂪂��̃��[�U�ɓK�p�����ƂƂ��ɁA�����̏��́A���[�U�̃v���t�@�C����ҏW���Ȃ����肱�̃��[�U�����p�ł���悤�ɂȂ�܂��B</span></td>
      </tr>
      <tr><td><dsp:img src="../images/d.gif" vspace="0"/></td></tr>
      <tr>
        <td align=right><span class=smallb>���O</span></td>
        <td width=75%><dsp:valueof bean="MultiUserAddFormHandler.users[0].value.lastName">ID �Ȃ�</dsp:valueof>&nbsp;<dsp:valueof bean="MultiUserAddFormHandler.users[0].value.middleName"/>&nbsp;<dsp:valueof bean="MultiUserAddFormHandler.users[0].value.firstName"/></td>
      </tr>
      <tr>
        <td align=right><span class=smallb>���O�C��</span></td>
        <td><dsp:valueof bean="MultiUserAddFormHandler.users[0].value.login">ID �Ȃ�</dsp:valueof></td> 
      </tr>
      <tr>
        <td align=right><span class=smallb>�d�q���[��</span></td>
        <td><dsp:valueof bean="MultiUserAddFormHandler.users[0].value.email">ID �Ȃ�</dsp:valueof></td> 
      </tr>
      <tr>
        
          <td align=right valign=top><span class=smallb>����</span></td>
            <td>
             <dsp:droplet name="ProfileLookUp">
              <dsp:param bean="MultiUserAddFormHandler.users[0].repositoryid" name="id"/>
              <dsp:param name="elementName" value="user"/>
              <dsp:oparam name="output">
               <dsp:droplet name="ForEach">
                 <dsp:param name="array" param="user.roles"/>
                 <dsp:param name="elementName" value="roleName"/>
                 <dsp:oparam name="output">
                  <dsp:valueof param="roleName.name"/><BR>
                 </dsp:oparam>
               </dsp:droplet>
              </dsp:oparam>
             </dsp:droplet>
            </td>
       
      </tr>
      <tr>
        <td align=right><span class=smallb>����</span></td>
        <td>
        <dsp:droplet name="Switch">
          <dsp:param bean="MultiUserAddFormHandler.users[0].value.locale" name="value"/>
           <dsp:oparam name="ja_JP">
            ���{��
          </dsp:oparam>
          <dsp:oparam name="en_US">
            �p��
          </dsp:oparam>
          <dsp:oparam name="de_DE">
            �h�C�c��
          </dsp:oparam>      
        </dsp:droplet>
        </td>
      </tr>
      <tr><td><dsp:img src="../images/d.gif" vspace="0"/></td></tr>
      <tr>
        <td colspan=2><dsp:a href="user.jsp"><dsp:param bean="MultiUserAddFormHandler.users[0].repositoryid" name="userId"/><dsp:param name="createUser" value="new"/><span class=smallb>���ׂẴ��[�U�v���t�@�C����\��</span></dsp:a><br><dsp:a href="company_admin.jsp"><span class=smallb>�߂� <dsp:valueof bean="Profile.currentOrganization.name"/></dsp:a></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
      </tr>
      <%--  vertical space --%>
      <tr><td><dsp:img src="../images/d.gif" vspace="0"/></td></tr>
    </table>
    </td>
  </tr>
</table>
</div>
</body>
</html>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/admin/new_user2.jsp#2 $$Change: 651448 $--%>

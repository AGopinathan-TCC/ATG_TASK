<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>

<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value="  �z�B���@"/></dsp:include>

<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
  </tr>
  <tr bgcolor="#DBDBDB" > 
    <td colspan=2 height=18> &nbsp; <span class=small>
    <dsp:a href="business_units.jsp">��ЊǗ�</dsp:a> &gt; 
    <dsp:a href="company_admin.jsp"><dsp:valueof bean="Profile.currentOrganization.name"/></dsp:a> &gt; 
    <dsp:a href="users.jsp">���[�U�̕\��</dsp:a> &gt; 
    <dsp:a href="user.jsp">���[�U�A�J�E���g</dsp:a> &gt; 
    <dsp:a href="user_edit_info.jsp">���[�U�v���t�@�C���̕ҏW</dsp:a> &gt; 
    �����̒ǉ�
    </span> </td>
  </tr>
  

  <tr valign=top> 
    <td width=55><dsp:img src="../images/d.gif"/></td>

    <%--  main content area --%>
    <td valign="top" width=745>  
    
        <table border=0 cellpadding=4 width=80%>
          <tr>
            <td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td>
          </tr>
          <tr>
            <td colspan=2 valign="top"><span class=big>��ЊǗ�</span><br><span class=little><dsp:valueof bean="Profile.currentOrganization.name" /></span></td>
          </tr>
          <tr> 
            <td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td>
          </tr>
          
          <tr> 
            <td colspan=2 valign="top"> 
              <table width=100% cellpadding=3 cellspacing=0 border=0>
                <tr> 
                  <td class=box-top>&nbsp;�����̒ǉ�</td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <dsp:form action="user_edit_info.jsp" method="post">
            <td valign="top" colspan=2 height="92">
            <% /* use TableForEach w/3 columns */ %>
            <table border="0" cellpadding="3" width=100%>
              <tr valign=top>
                <td width=25% align=right><span class=smallb>������</span></td>
                <td><input type=text name="role" maxlength=50 value=""></td> 
              </tr>
              <tr>
                <td align=right><span class=smallb>����</span></td>
                <td><input type=text name="desc" maxlength=50 value=""</td>
              </tr>
              
              <tr  valign=top>
                <td align=right><span class=smallb>����</span></td>
                <td>
                  <select>
                    <option name="roles" value="admin">�Ǘ���<br>
                    <option name="roles" value="admin">���F��<br>
                    <option name="roles" value="admin">�w����<br>
                  </select>
                </td>
              </tr>
              <tr> 
                <td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td>
              </tr>
              <tr> 
                <td></td>
                <td><input type="submit" value="�ۑ�">&nbsp;<input type="reset" value="�L�����Z��"></td>
              </tr>         
            </table>
            </td>
            </dsp:form>
          </tr>
   
          <tr> 
            <td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td>
          </tr>
           
        
          <% /*  vertical space */ %>
          <tr> 
            <td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td>
          </tr>
        </table>
    </td>
  </tr>


</table>
</div>
</body>
</html>



</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/admin/role_create.jsp#2 $$Change: 651448 $--%>

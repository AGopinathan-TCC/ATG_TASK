<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page import="atg.servlet.*"%>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/ProfileErrorMessageForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

<HTML><HEAD><TITLE>�o�^</TITLE></HEAD>

<!-- This form should not show what the current profile attributes are so we will
     disable the ability to extract default values from the profile. -->
<dsp:setvalue bean="ProfileFormHandler.extractDefaultValuesFromProfile" value="false"/>
<body bgcolor=#ffffff text=#000000 link=#003366 vlink=#003366>

<div align=center>

<dsp:droplet name="Switch">
  <dsp:param bean="ProfileFormHandler.profile.userType" name="value"/>
  <dsp:oparam name="default">
    <table border=0 cellpadding=4>
      <tr>
        <td><img src="images/banner-signup.gif"><br><br></td>
      </tr>
      <tr>
        <td>���łɓo�^����Ă��܂��B
        <dsp:a href="index.jsp">���s����</dsp:a>���A<dsp:a href="logout.jsp">���O�A�E�g</dsp:a>���Ă��������B</td>
      </tr>
    </table>  
  </dsp:oparam>

  <dsp:oparam name="guest">
    <dsp:form action="<%=ServletUtil.getDynamoRequest(request).getRequestURI()%>" method="POST">
    <dsp:input bean="ProfileFormHandler.createSuccessURL" type="HIDDEN" value="signup2.jsp"/>

    <!-- set this form to require that the supplied password value should be the same as the confirm password parameter -->
    <dsp:input bean="ProfileFormHandler.confirmPassword" type="HIDDEN" value="true"/>

    <dsp:input bean="ProfileFormHandler.value.member" type="hidden" value="true"/>
    <table border=0 cellpadding=4>
      <tr>
        <td><img src="images/banner-signup.gif"><br><br></td>
      </tr>
      <tr>
        <td colspan=2><font size=+2>�o�^</font><p> </td>
     </tr>
     <dsp:droplet name="Switch">
       <dsp:param bean="ProfileFormHandler.formError" name="value"/>
       <dsp:oparam name="true">
         <dsp:droplet name="ProfileErrorMessageForEach">
           <dsp:param bean="ProfileFormHandler.formExceptions" name="exceptions"/>
           <dsp:oparam name="output">
             <tr><td align=center><font color=cc0000><b><dsp:valueof param="message"/></b></td></tr>
           </dsp:oparam>
         </dsp:droplet>
      
       </dsp:oparam>
     </dsp:droplet>  
  
     <tr>
       <td>
       <table border=0 cellpadding=4>
         <tr>
           <td colspan=2><font size=+1><b>���O�C�����</b></font></td>
         </tr>
         <tr>
           <td align=right>���[�U���F </td>
           <td><dsp:input bean="ProfileFormHandler.value.login" maxlength="20" size="20 " type="text"/></td>
         </tr>
         <tr>
           <td align=right>�p�X���[�h�F </td>
           <td><dsp:input bean="ProfileFormHandler.value.password" maxlength="30" size="20" type="password"/></td>
         </tr>
         <tr>
           <td align=right>�p�X���[�h�̍ē��́F </td>
           <td><dsp:input bean="ProfileFormHandler.value.confirmpassword" maxlength="30" size="20" type="password"/></td>
         </tr>
         <tr>
           <td>&nbsp;</td>
         </tr>
         <tr>
           <td></td>
           <td><dsp:input bean="ProfileFormHandler.create" type="submit" value=" ���s "/></td>
         </tr>
       </table></td>
     </tr>
    
  </table>
  </div>
      
  </dsp:form>
  </dsp:oparam>
</dsp:droplet>

</BODY>
</HTML>
</dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/ja/signup.jsp#2 $$Change: 651448 $--%>

<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page import="atg.servlet.*"%>
<dsp:page>

<html><head><title>���O�C��</title></head>

<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/ProfileErrorMessageForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<dsp:setvalue bean="Profile.offerCode" paramvalue="offercode"/>
<dsp:setvalue bean="ProfileFormHandler.extractDefaultValuesFromProfile" value="false"/>

<body bgcolor=#ffffff text=#000000 link=#003366 vlink=#003366>

<div align=center>
<img src="images/banner-login.gif">
<br><br><br>

<dsp:droplet name="Switch">
  <dsp:param bean="Profile.userType" name="value"/>
  <dsp:oparam name="default">
    ���݃��O�C�����Ă��܂��B�V�K���[�U�Ƃ��ēo�^����ꍇ�́A
    �ŏ���<dsp:a href="logout.jsp">���O�A�E�g</dsp:a>���Ă��������B
  </dsp:oparam>

  <dsp:oparam name="guest">

  <dsp:droplet name="Switch">
    <dsp:param bean="ProfileFormHandler.formError" name="value"/>
    <dsp:oparam name="true">
      <font color=cc0000><STRONG><UL>
      <dsp:droplet name="ProfileErrorMessageForEach">
        <dsp:param bean="ProfileFormHandler.formExceptions" name="exceptions"/>
        <dsp:oparam name="output">
          <LI> <dsp:valueof param="message"/>
        </dsp:oparam>
      </dsp:droplet>
      </UL></STRONG></font>
    </dsp:oparam>
  </dsp:droplet>

  <dsp:form action="<%=ServletUtil.getDynamoRequest(request).getRequestURI()%>" method="POST">
  <dsp:input bean="ProfileFormHandler.loginSuccessURL" type="HIDDEN" value="../index.jsp"/>
  <table border=0 cellpadding=4>
    <tr>
      <td colspan=2><font size=+2>���O�C���܂���<dsp:a href="signup.jsp">�o�^</dsp:a></font></td>
    <tr>
    <tr>
      <td>&nbsp;<br></td>
    </tr>
    <tr>
      <td align=right>���[�U���F </td>
      <td><dsp:input bean="ProfileFormHandler.value.login" maxlength="20" size="20" type="text"/></td>
    <tr>
      <td align=right>�p�X���[�h�F </td>
      <td><dsp:input bean="ProfileFormHandler.value.password" type="password"/></td>
    </tr>
    <tr>
      <td></td>
      <td><br><dsp:input bean="ProfileFormHandler.login" type="submit" value=" ���O�C�� "/></td>
    </tr>
  </table>
  </dsp:form>
  <br><br><br>
  <table width=400 border=0>
    <tr>
      <td><font size=-1>
        ���ӁF�f���p�̃f�[�^�x�[�X�����g���̏ꍇ�́A�ȉ��̖��O�Ń��O�C���ł��܂��B�p�X���[�h�̓��[�U���Ɠ����ł��B
       <p>
       �����ƁFeric�Asandy�Amarc�i�t�����X��j�Asally�i�h�C�c��j�Afrank�i���{��j<br>
       �u���[�J�[�Fjack�Aairto�Ahermeta
       </font>
      </td>
    </tr>
  </table> 
  </div>
  
  </dsp:oparam>
</dsp:droplet>
</body>
</html>
</dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/ja/login.jsp#2 $$Change: 651448 $--%>

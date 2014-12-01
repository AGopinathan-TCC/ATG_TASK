<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page import="atg.servlet.*"%>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/ProfileErrorMessageForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>

<html><head><title>�o�^</title></head>
<body bgcolor=#ffffff text=#000000 link=#003366 vlink=#003366>

<div align=center>
<dsp:form action="<%=ServletUtil.getDynamoRequest(request).getRequestURI()%>" method="POST">
<dsp:input bean="ProfileFormHandler.updateSuccessURL" type="HIDDEN" value="../index.jsp"/>
<table border=0 cellpadding=4 width=550>
  <tr>
    <td><img src="images/banner-signup.gif"><br><br></td>
  </tr>
  <tr>
    <td colspan=2><font size=+2>�悤�����F <dsp:valueof bean="Profile.login"/> </font><br>
    ���̃T�C�g���ł��������ʓI�ɂ����p���������A���Ђ���уu���[�J�[�������ƂƂ��Ă̂��q�l�ɓK�؂ȏ������͂����邱�Ƃ��ł���悤�ɁA�l���̓��͂����肢�������܂��B</td>
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
    <dsp:input bean="ProfileFormHandler.value.userType" type="hidden" value="investor"/>

  <tr>
    <td>
    <table border=0 cellpadding=4>
      <tr>  
        <td colspan=2><font size=+1><b>�l���</b></font></td>
      </tr>
      <tr>
        <td align=right>�� </td>
        <td><dsp:input bean="ProfileFormHandler.value.firstname" maxlength="30" size="25" type="text"/></td>
      </tr>
      <tr>
        <td align=right>�� </td>
        <td><dsp:input bean="ProfileFormHandler.value.lastname" maxlength="30" size="25" type="text"/></td>
      </tr>
      <tr>
        <td align=right>�Z�� </td>
        <td><dsp:input bean="ProfileFormHandler.value.homeAddress.address1" maxlength="30" size="25" type="TEXT"/></td>
      </tr>
      <tr>
        <td align=right> </td>
        <td><dsp:input bean="ProfileFormHandler.value.homeAddress.address2" maxlength="30" size="25" type="TEXT"/></td>
      </tr>
      <tr>
        <td valign=middle align=right>�s���� </td>
        <td><dsp:input bean="ProfileFormHandler.value.homeAddress.city" maxlength="30" size="25" type="TEXT"/> </td> 
      </tr>
      <tr>
        <td valign=middle align=right>�s���{��</td>
        <td><dsp:input bean="ProfileFormHandler.value.homeAddress.state" maxlength="25" size="25" type="TEXT"/></td>
      </tr>
      
      <tr>
        <td align=right>�X�֔ԍ� </td>
        <td><dsp:input bean="ProfileFormHandler.value.homeAddress.postalcode" maxlength="10" size="10" type="TEXT"/></td>
      </tr>

      <tr>
        <td align=right>�� </td>
        <td><dsp:input bean="ProfileFormHandler.value.homeAddress.country" size="25" type="TEXT"/></td>
      </tr>
      <tr>
        <td align=right>�d�q���[�� </td>
        <td><dsp:input bean="ProfileFormHandler.value.email" maxlength="30" size="25" type="text"/></td>
      </tr>
      <tr>
        <td align=right>���N�����iYYYY/MM/DD�j</td>
        <td><dsp:input bean="ProfileFormHandler.value.dateOfBirth" date="yyyy/MM/dd" maxlength="10" size="10" type="text"/></td>
      </tr>
      <tr>
        <td align=right>���� </td>
        <td><dsp:input bean="ProfileFormHandler.value.gender" type="radio" value="male"/>�j��
            <dsp:input bean="ProfileFormHandler.value.gender" type="radio" value="female"/>����
        </td>
      </tr>
      <tr>
        <td valign=top align=right>�u���[�J�[�̑I�� </td>  
        <td>
        <dsp:droplet name="/atg/targeting/TargetingForEach">
          <dsp:param bean="/atg/registry/RepositoryTargeters/UserProfiles/BrokerList" name="targeter"/>
          <dsp:param name="fireContentEvent" value="false"/>
          <dsp:param name="fireContentTypeEvent" value="false"/>
          <dsp:oparam name="output">
            <dsp:input bean="ProfileFormHandler.value.brokerId" paramvalue="element.repositoryId" type="radio"/>  
            <dsp:valueof param="element.lastname"/>
            <dsp:valueof param="element.firstname"/><br>
          </dsp:oparam>
        </dsp:droplet></td>
      </tr>
      <tr>
        <td align=right>����</td>
        <td><dsp:select bean="ProfileFormHandler.value.locale">
              <dsp:option value="en_US"/>�p��
              <dsp:option value="fr_FR"/>�t�����X��
              <dsp:option value="de_DE"/>�h�C�c��
              <dsp:option value="ja_JP"/>���{��
            </dsp:select>
        </td>
      </tr>  
      <tr>
        <td>�d�q���[���ŏ���M����]���܂����H</td>
        <td><dsp:input bean="ProfileFormHandler.value.receiveEmail" type="radio" value="yes"/>�͂�
            <dsp:input bean="ProfileFormHandler.value.receiveEmail" type="radio" value="no"/>������
        </td>
      </tr>
      <tr>
        <td valign=middle align=right></td>
        <td><dsp:input bean="ProfileFormHandler.update" type="SUBMIT" value=" �ۑ� "/>
        <INPUT TYPE="RESET" VALUE=" ���Z�b�g "></td>
      </tr>
    </table> 
  </td> 
  </tr>
</table>
</dsp:form>
</BODY>
</HTML>
</dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/ja/signup2.jsp#2 $$Change: 651448 $--%>

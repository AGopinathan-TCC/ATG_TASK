<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<HTML> <HEAD>
<TITLE>Quincy �̐V�����t�@���h</TITLE>
</HEAD>

<dsp:importbean bean="/atg/userprofiling/Profile"/>

<BODY BGCOLOR="#FFFFFF" VLINK="#637DA6" LINK="#E87F02">
<font face="verdana" size=2>�q�[
<dsp:droplet name="/atg/dynamo/droplet/Switch">
  <dsp:param bean="Profile.firstname" name="value"/>
  <dsp:oparam name="unset">
                      
   </dsp:oparam>

  <dsp:oparam name="default">
    <dsp:valueof bean="Profile.lastName"/>
    <dsp:valueof bean="Profile.firstName"/>,
  </dsp:oparam>
</dsp:droplet>

<p>���Ђ̏��i�ɁA
<dsp:valueof bean="Profile.strategy"/>���q�l�̓����X�^�C���ɍ����V�����t�@���h�������܂����B 	
<p>

<dsp:droplet name="/atg/targeting/TargetingFirst">
  <dsp:param bean="/atg/registry/RepositoryTargeters/Email/NewFundEmail" name="targeter"/>
  <dsp:param name="fireContentEvent" value="false"/>
  <dsp:param name="fireContentTypeEvent" value="false"/>
  <dsp:param name="howMany" value="1"/>
  <dsp:oparam name="output">
  <dsp:droplet name="/atg/dynamo/droplet/Switch">
    <dsp:param bean="Profile.strategy" name="value"/>
    <dsp:oparam name="unset">
      �����헪������܂���B
    </dsp:oparam>
    <dsp:oparam name="default">
      <pre><dsp:valueof param="element.ConsContent"/></pre> 
    </dsp:oparam>
    <dsp:oparam name="conservative">
      <pre><dsp:valueof param="element.ConsContent"/></pre>
    </dsp:oparam>
    <dsp:oparam name="aggressive">
      <pre><dsp:valueof param="element.AggContent"/></pre>
    </dsp:oparam>
  </dsp:droplet>

  </dsp:oparam>
</dsp:droplet>
<p> ���Ђł́A���q�l�̖ړI�ɍ��킹�āA����]�ɉ������t�@���h��p�ӂ��Ă���܂��B <p>
<dsp:droplet name="/atg/targeting/TargetingFirst">
  <dsp:param bean="/atg/registry/RepositoryTargeters/Email/NewFundEmail" name="targeter"/>
  <dsp:param name="fireContentEvent" value="false"/>
  <dsp:param name="fireContentTypeEvent" value="false"/>
  <dsp:param name="howMany" value="1"/>
  <dsp:oparam name="output">
    <pre><dsp:valueof param="element.BrokerSignature"/></pre>
  </dsp:oparam>
</dsp:droplet>
</font>
</body>
</html>
<%/* @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/ja/email/newfund.jsp#2 $$Change: 651448 $*/%> </dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/ja/email/newfund.jsp#2 $$Change: 651448 $--%>

<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page import="atg.servlet.*"%>
<dsp:page>

<HTML> <HEAD>
<TITLE>Quincy Funds �ւ悤����</TITLE>
</HEAD>

<dsp:importbean bean="/atg/userprofiling/Profile"/>

<dsp:setvalue value="�V�K�����o�ւ̂��m�点" param="messageSubject"/>
<!-- 
Set the value of these parameters to valid email addresses

<dsp:setvalue value="Dynamo5Team@example.com" param="messageFrom"/>
<dsp:setvalue value="Dynamo5Team@example.com" param="messageReplyTo"/>
-->
<dsp:setvalue value="Welcome" param="mailingName"/>


<font face="verdana" size=2>�q�[
<dsp:droplet name="/atg/dynamo/droplet/Switch">
  <dsp:param bean="Profile.firstname" name="value"/>
  <dsp:oparam name="unset">
     <dsp:droplet name="/atg/dynamo/droplet/Switch">
        <dsp:param bean="Profile.login" name="value"/>
          <dsp:oparam name="unset">
                                    
          </dsp:oparam>
          <dsp:oparam name="default">
             <dsp:valueof bean="Profile.login"/>,
          </dsp:oparam>
     </dsp:droplet>

   </dsp:oparam>
  <dsp:oparam name="default">
    <dsp:valueof bean="Profile.lastName"/>
    <dsp:valueof bean="Profile.firstName"/>,
  </dsp:oparam>
</dsp:droplet>

<p>
Quincy Funds �ɂ��o�^���������A���肪�Ƃ��������܂��B���Ђ̃T�C�g���������������B
���Ђ̏��T�[�r�X����ѕ��Ђł��񋟂��铊���M���́A���̓������T�[�r�X�ƊE�ł͕C�G������̂͂Ȃ��Ǝ������Ă��܂��B <p>

���Ђ̃T�C�g�������������������ɂ́A���߂�
�������s�����ɂ����߂̎Q�l��������ʒ񋟂��Ă���܂��B�����̃��X�g������]�̏ꍇ�́A
���̃����N���N���b�N���Ă��������B
<!-- Here's the URL that will take the user to our login page with offercode 001
     The login page takes the offercode from the URL and puts it into the transient profile
		 property offerCode, which is then used to redirect the user to the appropriate offer
		 in the scenario MemberOffers.
     Note that email has not been localized in this demo so we just assume english -->
<dsp:a href='<%=ServletUtil.getRequestURL(request,"../login.jsp?offercode=001")%>'>Quincy Funds �̃T�C�g��</dsp:a>

<p>
���o�^���肪�Ƃ��������܂����B<br>
Joe B. Juan Canobe<br>
Quincy Funds ��\������В�

</BODY> </HTML>

</dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/ja/email/newmemberoffer.jsp#2 $$Change: 651448 $--%>

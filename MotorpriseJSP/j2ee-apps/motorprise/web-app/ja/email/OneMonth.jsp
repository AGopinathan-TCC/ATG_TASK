<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<!-- Title: OneMonthEmail -->
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<dsp:setvalue value="����̃I�[�_�[���� 10% �����ł��B" param="messageSubject"/>
<%-- 
<dsp:setvalue value="orders@example.com" param="messageFrom"/>
<dsp:setvalue value="orders@example.com" param="messageReplyTo"/>
--%>
<dsp:setvalue beanvalue="Profile.email" param="messageTo"/>
<dsp:setvalue value="OneMonth" param="mailingName"/>





<p> <dsp:valueof bean="Profile.firstName">���q�l��</dsp:valueof>
<dsp:valueof bean="Profile.lastName"/>�A
<p>

���q�l���Ō��<dsp:valueof bean="Profile.parentOrganization.name">���</dsp:valueof>�ł̂������𒸂��Ă���P�������o�߂������܂����B���Ђł́A���q�l�̉�Ђ̃j�[�Y����ɖ����������ƍl���Ă���܂��B�����ŁA���q�l�̎���̂������� 10% �̒l�����������Ă����������Ƃɂ������܂����B�����́A���񂨋q�l�����O�C�����A�������̎��_�Ŏ����I�ɓK�p����܂��B 


<p>�h��<br>
Motorprise, Inc. 


</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/OneMonth.jsp#2 $$Change: 651448 $--%>

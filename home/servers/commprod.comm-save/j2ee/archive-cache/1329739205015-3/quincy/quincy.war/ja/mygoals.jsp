<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page import="atg.servlet.*"%>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/ProfileErrorMessageForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>

<html><head><title>���̓����ڕW</title></head>

<body bgcolor=#ffffff text=#000000 link=#003366 vlink=#003366>
<dsp:droplet name="Switch">
  <dsp:param bean="ProfileFormHandler.profile.userType" name="value"/>
  <dsp:oparam name="guest">
    ���݃��O�C�����Ă��܂���B�ڕW��ύX����ɂ́A
    �o�^�܂��̓��O�C�����K�v�ł��B
    <dsp:a href="login.jsp">���O�C��</dsp:a>
  </dsp:oparam>

  <dsp:oparam name="default">
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

    <table border=0 cellpadding=4 cellspacing=0>
      <tr valign=top>
        <td width=120 bgcolor=#003366 rowspan=2>
        <!-- left bar navigation -->
        <dsp:include page="nav.jsp" ></dsp:include></td>
        
        <td>
        <table border=0>
          <tr>
            <td colspan=2><img src="images/banner-editgoals.gif"></td>
          </tr>
          <tr valign=top>
           <td>
           <table width=430>
             <tr>
               <td colspan=5>
               <b>Quincy �ł̓����ڕW��ύX���Ă��������B</b>
               <p>
               �����v������m�点�����������Ƃɂ���āA�ڕW�ɍ��킹������`����
               �ł��܂��B���q�l�̎��ۂ̃|�[�g�t�H���I�Ƃ���]��
               ���v���ƍ����邱�Ƃɂ��A���݂̓����^�p�������������ɐi��ł��邩�ǂ�����
               �m�F�ł��܂��B���@�͊ȒP�ł��B 
               <p>
               <b>�܂��A���q�l�̓����X�^�C���ɂ��Ă����������������B</b>
               <br>&nbsp;<br></td>
             </tr>

             <dsp:form action="<%=ServletUtil.getDynamoRequest(request).getRequestURI()%>" method="POST">
             <dsp:input bean="ProfileFormHandler.updateSuccessURL" type="HIDDEN" value="index.jsp"/>

             <tr>
               <td><dsp:input bean="ProfileFormHandler.value.strategy" name="style" type="radio" value="aggressive"/></td>
               <td>&nbsp;</td>
               <td><img src="images/spec-aa.gif"></td>
               <td>&nbsp;</td>
               <td>�ϋɌ^�i�n�C���X�N�^�n�C���^�[���j</td>
             </tr>

             <tr>
                <td><dsp:input bean="ProfileFormHandler.value.strategy" name="style" type="radio" value="moderate"/></td>
               <td>&nbsp;</td>
               <td><img src="images/spec-bb.gif"></td>
               <td>&nbsp;</td>
               <td>�o�����X�^</td>
             </tr>
  
             <tr>
               <td><dsp:input bean="ProfileFormHandler.value.strategy" name="style" type="radio" value="conservative"/></td>
               <td>&nbsp;</td>
               <td><img src="images/spec-cc.gif"></td>
               <td>&nbsp;</td>
               <td>�����^�i���[���X�N�^���[���^�[���j</td>
             </tr>  
     
             <tr>
               <td colspan=5>&nbsp;<br>
               <b>���ɁA�����ΏۂƂ�����Ԃ������������������B</b>
               <br>&nbsp;</td>
             </tr>
  
             <tr>
               <td><dsp:input bean="ProfileFormHandler.value.goals" name="range" type="radio" value="short-term"/></td>
               <td>&nbsp;</td>
               <td><img src="images/spec-sr.gif"></td>
               <td>&nbsp;</td> 
               <td>�Z��</td>
             </tr>
             <tr>
               <td><dsp:input bean="ProfileFormHandler.value.goals" name="range" type="radio" value="long-term"/></td>
               <td>&nbsp;</td>
               <td><img src="images/spec-lr.gif"></td>
               <td>&nbsp;</td> 
               <td>����</td>
             </tr>
             <tr>
               <td><dsp:input bean="ProfileFormHandler.value.goals" name="range" type="radio" value="retirement-focus"/></td>
               <td>&nbsp;</td>
               <td><img src="images/spec-rr.gif"></td>
               <td>&nbsp;</td> 
               <td>�V��d�_</td> 
            </tr>
     
            <tr>
              <td colspan=5><br>
              <dsp:input bean="ProfileFormHandler.update" type="submit" value="�����ڕW�̕ύX"/>
              <br>&nbsp;<br>&nbsp;</td>
            </tr>
          </table>
          </dsp:form>
          </td>
        </tr>
      </table>
      </td>
    </tr>
  </table>

  </dsp:oparam>
</dsp:droplet>
</body>
</html>
</dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/ja/mygoals.jsp#2 $$Change: 651448 $--%>

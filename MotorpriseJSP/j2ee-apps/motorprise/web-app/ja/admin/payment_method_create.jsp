<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>

<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value="  ��ЊǗ�"/></dsp:include>

<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
  </tr>
  <tr bgcolor="#DBDBDB" > 
    <td colspan=2 height=18> &nbsp; <span class=small>
    <dsp:a href="business_units.jsp">��ЊǗ�</dsp:a> &gt; 
    <dsp:a href="company_admin.jsp"><dsp:valueof bean="Profile.currentOrganization.name"/></dsp:a> &gt; 
    <dsp:a href="payment_edit.jsp">�x�������@</dsp:a> &gt; 
    �x�����̍쐬</span> </td>
  </tr>
  

  <tr valign=top> 
    <td width=55><dsp:img src="../images/d.gif" hspace="27"/></td>

    <% /*  main content area */ %>
    <td valign="top" width=745>  
    
   <dsp:form action="payment_address_edit.jsp" method="post">
  
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
                  <td class=box-top>&nbsp;�N���W�b�g�J�[�h�̒ǉ�</td>
                </tr>
              </table>
            </td>
          </tr>
          <tr> 
            <td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td>
          </tr>
           <tr> 
            <td align=right><span class=smallb>�j�b�N�l�[��</span></td>
            <td width=75% colspan="2"> 
              <input type=text size=30 name="nickName" value="">
            </td>
          </tr>
          <tr> 
            <td align=right><span class=smallb>�N���W�b�g�J�[�h�^�C�v</span></td>
            <td width=75% colspan="2">
              <select name="creditCardType">
                <option value="Visa"/>VISA 
                <option value="MasterCard"/>MasterCard
                    <option value="AmericanExpress"/> �A�����J���E�G�L�X�v���X
              </select>
            </td>
          </tr>
          <tr> 
            <td align=right height="39"><span class=smallb> �J�[�h�ۗL�Җ�</span></td>
            <td colspan="2" height="39"> 
              <input type=text size=10 name="lastName" value="">
              <input type=text size=10 name="firstName" value="">
            </td>
          </tr>
          <tr>
            <td align=right><span class=smallb>�J�[�h�ԍ�</span></td>
            <td colspan="2"> 
              <input type=text size=30 name="creditCardNumber" value="">
            </td>
          </tr>
          <tr>
            <td align=right><span class=smallb>�L������</span></td>
            <td colspan="2"> 
                        
              <select name="expirationYear">
              <option value="2004"/>2004
              <option value="2005"/>2005
              <option value="2006"/>2006 
              <option value="2007"/>2007
              <option value="2008"/>2008
              <option value="2009"/>2009
              <option value="2010"/>2010
              <option value="2011"/>2011
              <option value="2012"/>2012
              </select>
		�N
            
              <select name="expirationMonth">
              <option value="01"/>01 
              <option value="02"/>02
              <option value="03"/>03
              <option value="04"/>04
              <option value="05"/>05
              <option value="06"/>06 
              <option value="07"/>07
              <option value="08"/>08
              <option value="09"/>09
              <option value="10"/>10
              <option value="11"/>11
              <option value="12"/>12
              </select>
              ��
                
              <br><span class=help></span>
        
            </td>
          </tr>      
          <tr>
        <td><dsp:img src="../images/d.gif"/></td>
        <td><br><input type="submit" value="������Z���̑I��"></td>
      </tr>
  
      <tr> 
        <td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td>
      </tr>
    </table>
    </dsp:form>
    </td>
  </tr>
</table>
</div>
</body>
</html>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/admin/payment_method_create.jsp#2 $$Change: 651448 $--%>

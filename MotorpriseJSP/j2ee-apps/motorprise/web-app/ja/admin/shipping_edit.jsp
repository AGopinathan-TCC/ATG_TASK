<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/TableForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>

<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value="  �z�B��Z��"/></dsp:include>

<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
  </tr>
  <tr bgcolor="#DBDBDB" > 
    <td colspan=2 height=18> &nbsp; <span class=small>
    <dsp:a href="business_units.jsp">��ЊǗ�</dsp:a> &gt; 
    <dsp:a href="company_admin.jsp"><dsp:valueof bean="Profile.currentOrganization.name"/></dsp:a> &gt; �z�B��Z��</span>      </td>
  </tr>
  <tr valign=top> 
    <td width=55><dsp:img src="../images/d.gif"/></td>

    <%--  main content area --%>
    <td valign="top" width=745>  
    
    <table border=0 cellpadding=4 width=80%>
      <tr><td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td></tr>
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
            <td class=box-top>&nbsp;�z�B��Z��</td>
          </tr>
        </table>
        </td>
      </tr>
    
      <tr> 
        <td valign="top" colspan=2 height="92"> 
        <%-- table to frame content --%>
              <dsp:droplet name="TableForEach">
                <dsp:param bean="Profile.currentOrganization.shippingAddrs" name="array"/>
                <dsp:param name="elementName" value="shippingAddress"/>
                <dsp:param name="numColumns" value="3"/>
                <dsp:oparam name="outputStart">
                  <table border=0 width="100%">
                    <tr><td colspan=3>
                      <%--  check if inherited --%>
                      <dsp:droplet name="IsEmpty">
                        <dsp:param bean="Profile.currentOrganization.myShippingAddrs" name="value"/>
                        <dsp:oparam name="false">
                          <dsp:img src="../images/sethere.gif" align="left" hspace="6"/>
                          <span class=small>���̏��́A���̃r�W�l�X���j�b�g�̌ŗL���ł��B</span>
                        </dsp:oparam>
                        <dsp:oparam name="true">
                          <dsp:img src="../images/inherited.gif" align="left" hspace="6"/>
                          <span class=small>���̏��́A��Ђ̊�ƃv���t�@�C���Ŏw�肳��Ă��܂��B</span>
                       </dsp:oparam>  
                     </dsp:droplet></td></tr>
                </dsp:oparam>
                <dsp:oparam name="outputEnd">
                  </table>
                </dsp:oparam>
                <dsp:oparam name="outputRowStart"><tr></dsp:oparam>
                <dsp:oparam name="outputRowEnd"></tr></dsp:oparam>
                <dsp:oparam name="output">
                  <dsp:droplet name="IsEmpty">
                    <dsp:param name="value" param="shippingAddress"/>
                    <dsp:oparam name="true">
                      <td></td>
                    </dsp:oparam>
                    <dsp:oparam name="false">
                      <td valign="top">
                      <%-- individual table for each address --%>
                      <table width="100%" border="0">
                        <tr><td><dsp:img src="../images/d.gif"/></td></tr>
                        <tr>
                          <td>
                            <dsp:valueof param="key"/><br>
                            <dsp:getvalueof id="pval0" param="shippingAddress"><dsp:include page="../common/DisplayAddress.jsp"><dsp:param name="address" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>
                          </td>
                        </tr>
                        <tr>
                          <td><span class=smallb><dsp:a href="shipping_details_edit.jsp">�ҏW
                            <dsp:param name="shippingId" param="shippingAddress.id"/>
                            <dsp:param name="nickName" param="key"/></dsp:a></span> |
                              <span class=smallb><dsp:a href="shipping_address_delete.jsp">
                              <dsp:param name="shippingId" param="shippingAddress.id"/>
                              <dsp:param name="nickName" param="key"/>�폜</dsp:a></span>
                          </td>
                        </tr>
                      </table>
                      </td>
                    </dsp:oparam>
                  </dsp:droplet><%-- end IsEmpty --%>
                </dsp:oparam>
              </dsp:droplet><%-- end TableForEach --%>
             </td>
           </tr>
           <tr><td><br></td></tr>
           <tr>
             <td colspan="3"><dsp:a href="shipping_address_create.jsp"><span class=smallb>�z�B��Z���̐V�K�쐬</span></dsp:a></td>
           </tr>
         </table>
         </td>
       </tr>
    
     </table>
     </td>
   </tr>
 </table>
</body>
</html>



</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/admin/shipping_edit.jsp#2 $$Change: 651448 $--%>

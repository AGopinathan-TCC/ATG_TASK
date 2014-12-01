<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
<dsp:importbean bean="/atg/projects/b2bstore/purchaselists/PurchaselistFormHandler" />
<dsp:importbean bean="/atg/userprofiling/Profile" />
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>


<DECLAREPARAM NAME="noCrumbs" 
              CLASS="java.lang.String" 
              DESCRIPTION="This is for deciding what kind of breadcrumbs to display.
                           If this is true, then breadcrumbs will show: Store Home|Checkout,
                           instead of nav history. Default is true."
                           OPTIONAL>
               
<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value="�w�����X�g"/></dsp:include>


<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
  </tr>
  <tr bgcolor="#DBDBDB" > 
    <td colspan=2 height=18> &nbsp; <span class=small>
    <!-- breadcrumbs --> 
      <dsp:droplet name="Switch">
        <dsp:param name="value" param="noCrumbs"/>
        <dsp:oparam name="false">          
          <dsp:include page="../common/breadcrumbs.jsp"><dsp:param name="displaybreadcrumbs" value="true"/><dsp:param name="no_new_crumb" value="true"/></dsp:include> &gt; �w�����X�g
        </dsp:oparam>
        <dsp:oparam name="default">
          <dsp:param name="noCrumbs" value="true"/>
          <dsp:a href="my_account.jsp">���̃A�J�E���g</dsp:a> &gt; �w�����X�g
        </dsp:oparam>        
      </dsp:droplet>
    </td>
  </tr>
  

  <tr valign=top> 
    <td width=55><img src="../images/d.gif" hspace=27></td>

    <!-- main content area -->
    <td valign="top" width=745> 
    <!-- spacing image to make netscape work -->
    <table border=0 cellpadding=4 width=80%>
       <!-- vertical space -->
      <tr><td colspan=2><img src="../images/d.gif" vspace=5></td></tr>
      
      <dsp:getvalueof id="formExceptions" bean="PurchaselistFormHandler.formExceptions">
             <dsp:droplet name="ErrorMessageForEach">
               <dsp:param value="<%=formExceptions%>" name="exceptions"/>
               <dsp:oparam name="output">
                 <tr><td colspan=2>
                 <LI> <dsp:valueof param="message"/>
                 </td></tr>
               </dsp:oparam>
             </dsp:droplet>
      </dsp:getvalueof>
      <tr valign=top>
        <td colspan=2><span class=big>���̃A�J�E���g</span></td>
      </tr>
      
      <!-- vertical space -->
      <tr><td colspan=2><img src="../images/d.gif" vspace=0></td></tr>

      <tr>
       <td colspan=2>
        <table width=100% cellpadding=3 cellspacing=0 border=0>
        <tr><td class=box-top>&nbsp;�w�����X�g</td></tr></table>
        </td>
      </tr>

      <!-- vertical space -->
      <tr><td colspan=2><img src="../images/d.gif" vspace=0></td></tr>
    <tr>
      <td>
      <dsp:droplet name="IsEmpty">
        <dsp:param bean="Profile.purchaselists" name="value"/>
        <dsp:oparam name="true">
          <span class="small">�w�����X�g���쐬���A���i�J�^���O���烊�X�g�ɃA�C�e����ǉ����Ă��������B</span><p>
        </dsp:oparam>
        <dsp:oparam name="false">
          <span class="small">���i�����y�[�W�� [���X�g�ɒǉ�] ��I�����āA�A�C�e����ǉ����Ă��������B</span>
        </dsp:oparam>
        </dsp:droplet>
        </td>
    </tr>
 
      <tr valign=top>
           <td>
             <dsp:droplet name="/atg/dynamo/droplet/ForEach">
               <dsp:param bean="Profile.purchaselists" name="array" />
               <dsp:param name="elementName" value="list"/>
         
               <dsp:oparam name="output">
                 <dsp:a href="purchase_list.jsp">
                 <dsp:param name="listNumber" param="index"/>
                 <dsp:valueof param="list.eventName"/></dsp:a><br>
               </dsp:oparam>
             </dsp:droplet>



             <dsp:form action="purchase_lists.jsp" method="post">
             <input name="noCrumbs" type="hidden" value="<dsp:valueof param='noCrumbs'/>">
             �V�K�w�����X�g�F<br>
             <dsp:input bean="PurchaselistFormHandler.listName" maxlength="20" size="20" type="text"  value=""/>
						 <dsp:input bean="PurchaselistFormHandler.savePurchaseList" type="hidden" value=""/>
             <dsp:input bean="PurchaselistFormHandler.savePurchaseList" type="submit"  value="���X�g�̍쐬"/>
             <br>
             <span class="help">���X�g���̒����� 20 �����܂łł��B</span>
             </dsp:form>
        </td>
      </tr>

      <!-- vertical space -->
      <tr><td><img src="../images/d.gif" vspace=0></td></tr>
    </table>

    </td>
  </tr>
</table>

</div>
</body>
</html>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/user/purchase_lists.jsp#2 $$Change: 651448 $--%>

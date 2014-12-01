<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
<dsp:importbean bean="/atg/userdirectory/droplet/HasFunction"/>
<dsp:importbean bean="/atg/commerce/approval/ApprovalRequiredDroplet"/>
<dsp:importbean bean="/atg/commerce/approval/ApprovedDroplet"/>

<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value="���̃A�J�E���g"/></dsp:include>

<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
  </tr>
  <tr bgcolor="#DBDBDB" > 
    <td colspan=2 height=18> &nbsp; <span class=small>
      ���̃A�J�E���g</span></td>
  </tr>

  <tr valign=top> 
    <td width=55><img src="../images/d.gif" hspace=27></td>

    <!-- main content area -->
    <td valign="top" width=745>  
    <table border=0 cellpadding=4 width=80%>
      <tr><td><img src="../images/d.gif"></td></tr>
      <tr>
        <td colspan=3><span class=big>���̃A�J�E���g</span></td>
      </tr>
      <tr><td><img src="../images/d.gif" vspace=0></td></tr>
      <tr>
        <td>
        <table border=0 cellpadding=4 cellspacing=0>
          <tr valign=top>
            <td colspan=3>
            <table width=100% cellpadding=3 cellspacing=0 border=0>
              <tr><td class=box-top>&nbsp;�I�[�_�[���</td></tr></table>
            </td>
          </tr>  
  
          <!--  display link if user has approver role -->
          <dsp:droplet name="HasFunction">
            <dsp:param bean="Profile.id" name="userId"/>
            <dsp:param name="function" value="approver"/>
            <dsp:oparam name="true">
              <tr valign=top>
                <td><dsp:a href="approvals.jsp">���F�̗v��</dsp:a></td>
                <td>
                <dsp:droplet name="ApprovalRequiredDroplet">
                  <dsp:param bean="Profile.id" name="approverid"/>
                  <dsp:param name="state" value="open"/>
                  <dsp:oparam name="output">
                    <nobr><dsp:valueof param="totalCount"/> &nbsp;</nobr>
                  </dsp:oparam>
                  <dsp:oparam name="empty">
                    0
                  </dsp:oparam>
                </dsp:droplet>
                 </td>
                <td>���F���K�v�ȃI�[�_�[�B</td>
              </tr>
              <tr valign=top>
                <td><dsp:a href="approvals_past.jsp">�����ςݏ��F�v��</dsp:a></td>
                <td>
                <dsp:droplet name="ApprovedDroplet">
                  <dsp:param bean="Profile.id" name="approverid"/>
                  <dsp:param name="state" value="open"/>
                  <dsp:oparam name="output">
                    <nobr><dsp:valueof param="totalCount"/> &nbsp;</nobr>
                  </dsp:oparam>
                  <dsp:oparam name="empty">
                    0
                  </dsp:oparam>
                </dsp:droplet>
                 </td>
                <td>���F�܂��͋��ۂ����I�[�_�[�B</td>
              </tr>
            </dsp:oparam>
          </dsp:droplet>
            
          <tr valign=top>
            <td><dsp:a href="orders_open.jsp">�������̃I�[�_�[</dsp:a></td>
            <td>
              <dsp:droplet name="OrderLookup">
                <dsp:param bean="Profile.id" name="userId"/>
                <dsp:param name="state" value="open"/>
                <dsp:param name="queryTotalOnly" value="true"/>
                <dsp:oparam name="output">
                  <dsp:valueof param="total_count"/>
                </dsp:oparam>
                <dsp:oparam name="empty">
                  0
                </dsp:oparam>
              </dsp:droplet>
            </td>
            <td>���ݏ������i�߂��Ă���I�[�_�[�B</td>
          </tr>
          <tr valign=top>
            <td><dsp:a href="orders_filled.jsp"><nobr>���s�ς݃I�[�_�[</dsp:a></nobr></td>
            <td>
              <dsp:droplet name="OrderLookup">
                <dsp:param bean="Profile.id" name="userId"/>
                <dsp:param name="state" value="no_pending_action"/>
                <dsp:param name="queryTotalOnly" value="true"/>
                <dsp:oparam name="output">
                  <dsp:valueof param="total_count"/>
                </dsp:oparam>
                <dsp:oparam name="empty">
                  0
                </dsp:oparam>
               </dsp:droplet>
            </td>
            <td>�z�B�����������I�[�_�[�B</td>
          </tr>
         
          <!-- only buyers who require approval see rejected orders -->
          <dsp:droplet name="HasFunction">
            <dsp:param bean="Profile.id" name="userId"/>
            <dsp:param name="function" value="buyer"/>
            <dsp:oparam name="true">
              <dsp:droplet name="Switch">
                <dsp:param bean="Profile.approvalRequired" name="value"/>
                <dsp:oparam name="true">
                  <tr valign=top>
                    <td><dsp:a href="orders_rejected.jsp"><nobr>���ۂ��ꂽ�I�[�_�[</nobr></dsp:a></td>
                    <td>
                    <dsp:droplet name="OrderLookup">
                      <dsp:param bean="Profile.id" name="userId"/>
                      <dsp:param name="state" value="failed_approval"/>
                      <dsp:param name="queryTotalOnly" value="true"/>
                      <dsp:oparam name="output">
                        <dsp:valueof param="total_count"/>
                      </dsp:oparam>
                      <dsp:oparam name="empty">
                        0
                      </dsp:oparam>
                    </dsp:droplet>
                    </td>
                    <td>���F�҂���߂��ꂽ�A���F���K�v�ȃI�[�_�[�B</td>
                  </tr>
                </dsp:oparam>
              </dsp:droplet>
            </dsp:oparam>
          </dsp:droplet>

          <tr><td><img src="../images/d.gif"></td></tr>
          <tr valign=top>
            <td colspan=3>
            <table width=100% cellpadding=3 cellspacing=0 border=0>
              <tr><td class=box-top>&nbsp;�w���c�[��</td></tr></table>
            </td>
          </tr>
          <tr valign=top>
            <td><dsp:a href="purchase_lists.jsp"><nobr>�w�����X�g</nobr></dsp:a></td>
            <td></td>
            <td>�I�[�_�[�p�x�̍����A�C�e���̃��X�g�ł��B
            �J�^���O���烊�X�g�ɃA�C�e����ǉ��ł��܂��B</td>
          </tr>
          <tr valign=top>
            <td><dsp:a href="scheduled_orders.jsp"><nobr>�X�P�W���[���ς݃I�[�_�[</nobr></dsp:a></td>
            <td></td>
            <td>���炩���ߒ�`����Ă���X�P�W���[���ɏ]���āA
            �����I�ɑ��M�����I�[�_�[�ł��B</td>
          </tr>
          <tr valign=top>
            <td><dsp:a href="saved_orders.jsp">�ۑ��ς݃I�[�_�[</dsp:a></td>
            <td></td>
            <td>�I�[�_�[���������ł܂����M�ł��Ȃ��ꍇ�́A
            ���̃I�[�_�[����������ۑ����A��ő��M�ł��܂��B</td>
          </tr>
          <tr><td><img src="../images/d.gif"></td></tr>
          <tr valign=top>
            <td colspan=3>
            <table width=100% cellpadding=3 cellspacing=0 border=0>
              <tr><td class=box-top>&nbsp;�v���t�@�C�����</td></tr></table>
            </td>
          </tr>
          <tr valign=top>
            <td><dsp:a href="my_profile.jsp">���̃v���t�@�C��</dsp:a></td>
            <td></td>
            <td>�A�����񂨂�уf�t�H���g��ҏW���܂��B</td>
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
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/user/my_account.jsp#2 $$Change: 651448 $--%>

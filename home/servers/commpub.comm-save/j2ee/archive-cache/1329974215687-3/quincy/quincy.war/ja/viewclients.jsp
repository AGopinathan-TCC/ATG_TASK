<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<DECLAREPARAM NAME="ElementId" CLASS="java.lang.String" DESCRIPTION="�擾���郊�|�W�g���v�f�� ID">
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<HTML><HEAD><TITLE>�N���C�A���g�̕\��</TITLE></HEAD>
<body bgcolor=#ffffff text=#000000 link=#003366 vlink=#003366>

<table border=0 cellpadding=0 cellspacing=0>
  <tr valign=top>
    <td width=120 bgcolor=#003366 rowspan=2>
    <!-- left bar navigation -->
    <dsp:include page="nav.jsp" ></dsp:include></td>
    <td>
    <table border=0 width=500 cellpadding=2 cellspacing=0>
      <tr>
        <td colspan=2><img src="images/banner-quincy-small.gif" hspace=20 vspace=4><br>
        <img src="images/brokerconnection.gif"></td>
      </tr>
      <tr valign=top>
        <td><img src="images/d.gif" hspace=5></td>
        <td>
        <table border=0>
          <tr valign=top>
            <td colspan=2>
             <img src="images/banner-viewclients.gif">
             <p>�\������N���C�A���g�F</td>
          </tr>
          <tr>
            <td>&nbsp; &nbsp;</td>
            <td><dsp:a href="viewclients.jsp?querytype=0">
                  �����헪���ϋɌ^</dsp:a><br>
                <dsp:a href="viewclients.jsp?querytype=1">
                  �����헪�������^</dsp:a><br>
                <dsp:a href="viewclients.jsp?querytype=2">
                  ���ۂ̃|�[�g�t�H���I���ڕW�|�[�g�t�H���I�ƈ�v���Ă��Ȃ�</dsp:a></td>
          </tr>
          <tr><td>&nbsp;<br></td></tr>
           <tr valign=top>
             <td></td>
             <td colspan=3>
        <P>
        <dsp:droplet name="/atg/dynamo/droplet/Switch">
          <dsp:param name="value" param="querytype"/>
          <dsp:oparam name="0">
            <dsp:droplet name="/atg/targeting/TargetingForEach">
              <dsp:param bean="/atg/registry/RepositoryTargeters/UserProfiles/AggressiveInvestors" name="targeter"/>
              <dsp:param name="sortProperties" value="+lastname"/>
              <dsp:param name="fireContentEvent" value="false"/>
              <dsp:param name="fireContentTypeEvent" value="false"/>
              <dsp:oparam name="outputStart">
                <table border=0 cellpadding=2>
                  <tr>
                    <td><b>�ϋɌ^�̓�����</b></td>
                  </tr>
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
               </table>
              </dsp:oparam>
              <dsp:oparam name="output">
                <tr>
                  <td>
                  <dsp:a href="client.jsp">
                   <dsp:param name="ElementId" param="element.repositoryId"/>
                   <dsp:valueof param="element.lastname"/>
                   <dsp:valueof param="element.firstname"/></dsp:a></td>
                </tr>
              </dsp:oparam>
              
              <dsp:oparam name="empty">
                <p>�������j���ϋɌ^�̃N���C�A���g�͑��݂��܂���B
              </dsp:oparam>
            </dsp:droplet>
         
          </dsp:oparam>
            
          <dsp:oparam name="1">
            <dsp:droplet name="/atg/targeting/TargetingForEach">
              <dsp:param bean="/atg/registry/RepositoryTargeters/UserProfiles/ConservativeInvestors" name="targeter"/>
              <dsp:param name="sortProperties" value="+lastname"/>
              <dsp:param name="fireContentEvent" value="false"/>
              <dsp:param name="fireContentTypeEvent" value="false"/>
              <dsp:oparam name="outputStart">
                <table border=0 cellpadding=2>
                  <tr>
                    <td><b>�����^�̓�����</b></td>
                  </tr>
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
                </table>
              </dsp:oparam>
              <dsp:oparam name="output">
                <tr>
                  <td><dsp:a href="client.jsp">
                    <dsp:param name="ElementId" param="element.repositoryId"/>
                    <dsp:valueof param="element.lastname"/>
                    <dsp:valueof param="element.firstname"/></dsp:a></td>
                </tr>
              </dsp:oparam>
              
              <dsp:oparam name="empty">
                <p>�������j�������^�̃N���C�A���g�͑��݂��܂���B
              </dsp:oparam>
            </dsp:droplet>
         
          </dsp:oparam>
              
          <dsp:oparam name="2">
            <dsp:droplet name="/atg/targeting/TargetingForEach">
              <dsp:param bean="/atg/registry/RepositoryTargeters/UserProfiles/clients/portfolio" name="targeter"/>
              <dsp:param name="sortProperties" value="+lastname"/>
              <dsp:param name="fireContentEvent" value="false"/>
              <dsp:param name="fireContentTypeEvent" value="false"/>
              <dsp:oparam name="outputStart">
                <table border=0 cellpadding=0 cellspacing=5>
                  <tr align=left>
                    <th>�N���C�A���g</th>
                    <th>���ۂ̃|�[�g�t�H���I</th>
                    <th>�ڕW�|�[�g�t�H���I</th>
                  </tr>
                  <tr>
                    <td bgcolor=003366 colspan=3><img src="images/d.gif" height=2></td>
                  </tr>
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
                </table>
              </dsp:oparam>
              <dsp:oparam name="output">
                <tr valign=top>
                  <td><dsp:a href="client.jsp">
                      <dsp:param name="ElementId" param="element.repositoryId"/>
                      <dsp:valueof param="element.lastname"/>
                      <dsp:valueof param="element.firstname"/></dsp:a></td>
                  <td><dsp:valueof param="element.actualgoals"/><br>
                      <dsp:valueof param="element.actualstrategy"/></td>
                  <td><dsp:valueof param="element.goals"/><br>
                      <dsp:valueof param="element.strategy"/></td>         
                </tr>
            
              </dsp:oparam>
              <dsp:oparam name="empty">
                <p>���ׂẴN���C�A���g�̎��ۂ̃|�[�g�t�H���I�͖ڕW�|�[�g�t�H���I�ƈ�v���Ă��܂��B
              </dsp:oparam>
            </dsp:droplet>
            </dsp:oparam>

        </dsp:droplet></td>
       </tr>
       </table>
        </td>
      </tr>
    </table>

    </td>
  </tr>
</table>

</BODY> </HTML>
</dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/ja/viewclients.jsp#2 $$Change: 651448 $--%>

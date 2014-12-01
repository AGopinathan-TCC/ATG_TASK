<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<DECLAREPARAM NAME="ElementId" CLASS="java.lang.String" DESCRIPTION="Id of the repository element to retrieve">
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<HTML> <HEAD>

<dsp:droplet name="/atg/targeting/RepositoryLookup">
  <dsp:param bean="/atg/demo/QuincyFunds/repositories/News/News" name="repository"/>
  <dsp:param name="itemDescriptor" value="news"/>
  <dsp:param name="id" param="ElementId"/>
  <dsp:oparam name="output">
    <TITLE>�j���[�X</TITLE>
    </HEAD>
    <body bgcolor=#ffffff text=#000000 link=#003366 vlink=#003366>

    <table border=0 cellpadding=4 cellspacing=0>
      <tr valign=top>
        <td width=120 bgcolor=#003366 rowspan=2>
        <!-- left bar navigation -->
        <dsp:include page="nav.jsp" ></dsp:include></td>
      
        <td>
        <table border=0>
          <tr>
            <td colspan=2><img src="images/banner-quincy-small.gif" hspace=20 vspace=4></td>
          </tr>
          <tr valign=top>
            <td>
            <table border=0 width=500 cellpadding=4 cellspacing=0>
              <tr>
                <td><img src="images/d.gif" hspace=4></td>
                <td><h2>�j���[�X</h2>
                <dsp:a href="newslist.jsp">�j���[�X���X�g</dsp:a> 
                <p>
 
                <!-- xml news display -->
                <p><b><dsp:valueof param="element.headline"/></b></p>
                <p>By <dsp:valueof param="element.author"/></p>
                <dsp:valueof valueishtml="true" param="element.content" />
               </td>
             </tr>
           </table>
           </td>
         </tr>
       </table>
       </td>
     </tr>
    </table>
  </dsp:oparam>
  <dsp:oparam name="empty">
    ���̃y�[�W�ɂ́A�p�����[�^�Ƃ��ēn���{���j���[�X�A�C�e���̃��|�W�g�� ID ���܂ރ����N���g�p����
    �A�N�Z�X����K�v������܂��B
  </dsp:oparam>
</dsp:droplet>





</BODY> </HTML>
</dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/ja/news.jsp#2 $$Change: 651448 $--%>

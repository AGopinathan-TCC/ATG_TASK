<%@ taglib uri="/dspTaglib" prefix="dsp" %> 
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<dsp:page>

<DECLAREPARAM NAME="ElementId" CLASS="java.lang.String" DESCRIPTION="Id of the repository element to retrieve">
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<img src="images/banner-clients.gif" alt="clients">
<table cellspacing=0 cellpadding=0 border=0>
  <tr>
    <td><img src="images/d.gif" vspace=2></td>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;</td>
    <td>
    <dsp:droplet name="/atg/targeting/TargetingForEach">
      <dsp:param bean="/atg/registry/RepositoryTargeters/UserProfiles/ClientList" name="targeter"/>
      <dsp:param name="sortProperties" value="+firstname"/>
      <dsp:param name="fireContentEvent" value="false"/>
      <dsp:param name="fireContentTypeEvent" value="false"/>
      <dsp:oparam name="output">
        <dsp:droplet name="/atg/dynamo/droplet/Switch">
          <dsp:param name="value" param="element.firstname"/>
          <dsp:oparam name="unset">
            <dsp:valueof param="element.login"/>
          </dsp:oparam>
          <dsp:oparam name="default">
            <dsp:a href="client.jsp">
            <dsp:param name="ElementId" param="element.repositoryId"/>
            <dsp:valueof param="element.firstname"/>
            <dsp:valueof param="element.lastname"/></dsp:a>
          </dsp:oparam>
        </dsp:droplet>
        <br>                
      </dsp:oparam>
      <dsp:oparam name="empty">
        Aucun client ne vous a �t� affect� ou vous n'�tes pas inscrit(e).
      </dsp:oparam>
      
    </dsp:droplet>		
    </td>
  </tr>
</table>
<%/* @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/fr/clientlist.jsp#2 $$Change: 651448 $ */%> </dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/fr/clientlist.jsp#2 $$Change: 651448 $--%>

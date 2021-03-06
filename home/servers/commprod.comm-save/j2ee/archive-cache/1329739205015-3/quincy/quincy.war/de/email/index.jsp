<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/demo/QuincyFunds/FormHandlers/EmailRepositoryFormHandler"/>
<HTML> <HEAD><TITLE>Targeted Email</TITLE></HEAD>
<body bgcolor=#ffffff text=#000000 link=#003366 vlink=#003366>

<table border=0 cellpadding=4 cellspacing=0>
  <tr valign=top>
    <td width=120 bgcolor=#003366 rowspan=2>
    <!-- left bar navigation -->
    <dsp:include page="/de/nav.jsp" />
    </td>

    <td>
    <table border=0>
      <tr>
        <td colspan=2><img src="../images/banner-quincy-small.gif" hspace=20 vspace=4><br><img src="../images/brokerconnection.gif"></td>
      </tr>
      <tr valign=top>
        <td>
        <table border=0 width=500 cellpadding=4 cellspacing=0>
          <tr>
            <td><img src="../images/d.gif" width=10></td>
            <td>
            <h2>Targeted Email</h2>
            As a broker you can send mailings to Quincy Funds investors, see a
            summary of sent mailings, and preview the content of
            mailings you are sending.
            <ul>
              <li><dsp:a href="newmailing.jsp">Create new mailing</dsp:a>
              <li><dsp:a href="summary.jsp">Summary of sent mailings</dsp:a>
              <li>View Content
              
            <!-- targeter gets a list of the mailings in the repository -->
            <dsp:droplet name="/atg/targeting/TargetingForEach">
              <dsp:param bean="/atg/registry/RepositoryTargeters/Email/email" name="targeter"/>
              <dsp:param name="fireContentEvent" value="false"/>
              <dsp:param name="fireContentTypeEvent" value="false"/>
              <dsp:oparam name="outputStart">
                <ul>
              </dsp:oparam>
              <dsp:oparam name="output">
                <li><dsp:a bean="EmailRepositoryFormHandler.repositoryId" href="editmail.jsp" paramvalue="element.relativePath">
                <dsp:valueof param="element.title"/></dsp:a>
              </dsp:oparam>
              <dsp:oparam name="empty">
                <li>No email repository content found.
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
                </ul>
              </dsp:oparam>
                   
            </dsp:droplet>
            </ul>
  
            <!-- if the email handler is not configured -->
            <dsp:droplet name="/atg/dynamo/droplet/Switch">
              <dsp:param bean="/atg/dynamo/service/SMTPEmail.emailHandlerHostName" name="value"/>

              <dsp:oparam name="localhost"><hr>
               Configuration: To send email you must configure the <b>SMTPEmail</b>
                component. You can do this with the Dynamo ACC
                 by changing the following properties:
                <ul>
                  <li>emailHandlerHostName
                  <li>emailHandlerPort
                </ul>
                The full path to the component is /atg/dynamo/service/SMTPEmail
              </dsp:oparam>
            </dsp:droplet> 
            <hr>
            See the <dsp:a href="../../EmailDemo/index.jsp">Targeted Email Demo</dsp:a> for a
               complete demonstration of Dynamo's targeted email functionality.
        </table>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>

</BODY> </HTML>
</dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/de/email/index.jsp#2 $$Change: 651448 $--%>

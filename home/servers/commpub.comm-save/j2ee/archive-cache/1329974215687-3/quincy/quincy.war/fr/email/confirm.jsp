<%@ taglib uri="/dspTaglib" prefix="dsp" %> <dsp:page>

<dsp:importbean bean="/atg/demo/QuincyFunds/FormHandlers/EmailRepositoryFormHandler"/>
<HTML><HEAD><TITLE>Confirmation d'e-mails cibl�s</TITLE></HEAD>
<body bgcolor=#ffffff text=#000000 link=#003366 vlink=#003366>

<table border=0 cellpadding=4 cellspacing=0>
  <tr valign=top>
    <td width=120 bgcolor=#003366 rowspan=2>
    <!-- left bar navigation -->
    <dsp:include page="/fr/nav.jsp"/>
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
            <h2>Confirmation d'e-mails cibl�s</h2>
            Votre publipostage a �t� envoy�.
            <ul>
              <li><dsp:a href="newmailing.jsp">Cr�er un publipostage</dsp:a>
              <li><dsp:a href="summary.jsp">R�capitulatif des publipostages envoy�s</dsp:a>
              <li>Modifier le contenu
              
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
                <li>Contenu de r�f�rentiel d'e-mails introuvable
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
               Configuration : Pour envoyer un e-mail, vous devez configurer le composant <b>SMTPEmail</b>. Pour ce faire, vous pouvez utiliser Dynamo ACC et modifier les propri�t�s suivantes :
                <ul>
                  <li>emailHandlerHostName
                  <li>emailHandlerPort
                </ul>
                Le chemin d'acc�s complet au composant est /atg/dynamo/service/SMTPEmail.
              </dsp:oparam>
            </dsp:droplet> 
            <hr>
            Reportez-vous � la d�mo <dsp:a href="../../EmailDemo/index.jsp">E-mail cibl�</dsp:a> pour obtenir une d�monstration compl�te de la fonctionnalit� de cr�ation d'e-mails cibl�s � l'aide de Dynamo.
        </table>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>

</BODY> </HTML>
<%/* @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/fr/email/confirm.jsp#2 $$Change: 651448 $*/%> </dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/fr/email/confirm.jsp#2 $$Change: 651448 $--%>

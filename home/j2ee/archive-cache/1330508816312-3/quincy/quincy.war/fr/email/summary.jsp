<%@ taglib uri="/dspTaglib" prefix="dsp" %> <dsp:page>

<dsp:importbean bean="/atg/demo/QuincyFunds/FormHandlers/EmailRepositoryFormHandler"/>
<dsp:importbean bean="/atg/demo/QuincyFunds/email/MailingApplication"/>
<dsp:importbean bean="/atg/demo/QuincyFunds/email/MailingApplicationForm"/>
<HTML> <HEAD><TITLE>R�capitulatif des e-mails cibl�s</TITLE></HEAD>
<body bgcolor=#ffffff text=#000000 link=#003366 vlink=#003366>

<table border=0 cellpadding=4 cellspacing=0>
  <tr valign=top>
    <td width=120 bgcolor=#003366 rowspan=2>
    <!-- left bar navigation -->
    <dsp:include page="/fr/nav.jsp" />
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
            <h2>R�capitulatif des e-mails cibl�s</h2>
            
            <dsp:droplet name="/atg/dynamo/droplet/ForEach">
              <dsp:param bean="MailingApplication.completedMailings" name="array"/>
              <dsp:oparam name="outputStart">
                Pulipostages achev�s
                <table border=0>
                  <tr>  
                    <td bgcolor=cccccc><font size=2><b>Nom du publipostage</b></font></td>
                    <td bgcolor=cccccc><font size=2><b>Achev� le</b></font></td>
                    <td bgcolor=cccccc><font size=2><b>Nbre d'e-mails envoy�s</b></font></td>
                    <td bgcolor=cccccc><font size=2><b>Nbre d'e-mails dont l'envoi a �chou�</b></font></td>
                  </tr>
                </dsp:oparam>
                <dsp:oparam name="outputEnd">
                  </table>
                  <dsp:form action="./index.jsp" method="get">
                  <dsp:input bean="MailingApplicationForm.clearCompleted" type="submit" value="Effacer les publipostages envoy�s"/>  
                 </dsp:form>  
               </dsp:oparam>
               <dsp:oparam name="output">
                 <tr>  
                   <td><font size=2>
                   <dsp:valueof param="element.request.mailingName">Pas de nom</dsp:valueof></font></td>
                   <td><font size=2><dsp:valueof param="element.whenCompleted"/></font></td>
                   <td align=center><font size=2>
                   <dsp:valueof param="element.numberSent"/></font></td>
                   <td align=center><font size=2>
                   <dsp:valueof param="element.numberUnsent"/></font></td>
                 </tr>  
               </dsp:oparam>
              <dsp:oparam name="empty">
                <p>Aucun publipostage n'est achev�.
              </dsp:oparam>
            </dsp:droplet>
            <p>
            
            <!-- failed mailings -->
            <dsp:droplet name="/atg/dynamo/droplet/ForEach">
              <dsp:param bean="MailingApplication.failedMailings" name="array"/>
              <dsp:oparam name="outputStart">
                Publipostages ayant �chou�
                <table border=0 cellpadding=1>
                  <tr> 
                    <td bgcolor=cccccc><font size=2><b>R�sultat</b></td>    
                    <td bgcolor=cccccc><font size=2><b>Date et heure de l'�chec</b></td>
                    <td bgcolor=cccccc><font size=2><b>Exception</b></td>  
                  </tr>
              </dsp:oparam>
             <dsp:oparam name="outputEnd">
               </table>
               <dsp:form action="./index.jsp" method="get">
               <dsp:input bean="MailingApplicationForm.clearFailed" type="submit" value="Effacer les publipostages ayant �chou�"/>  
               </dsp:form>
             </dsp:oparam>
             <dsp:oparam name="output">
               <tr>
                 <td>  
                 <font size=2>  
                 <dsp:valueof param="element.request.mailingName"/></td>
                 <td><font size=2>
                 <dsp:valueof param="element.whenFailed"/></font></td>
                 <td>
                 <font size=2><dsp:valueof param="element.exception"/>
                 </font></td>
               </tr>  

             </dsp:oparam>
             <dsp:oparam name="empty">
               
             </dsp:oparam>
           </dsp:droplet>
            <p><br>
            <ul>
              <li><dsp:a href="newmailing.jsp">Cr�er un publipostage</dsp:a>
              <li>Modifier le contenu
              
            <dsp:droplet name="/atg/targeting/TargetingForEach">
              <dsp:param bean="/atg/registry/RepositoryTargeters/Email/email" name="targeter"/>
              <dsp:param name="fireContentEvent" value="false"/>
              <dsp:param name="fireContentTypeEvent" value="false"/>
              <dsp:oparam name="outputStart">
                <ul>
              </dsp:oparam>
              <dsp:oparam name="output">
                <li><dsp:a bean="/atg/demo/QuincyFunds/FormHandlers/EmailRepositoryFormHandler.repositoryId" href="editmail.jsp" paramvalue="element.relativePath">
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
<%--
  Commented out for now: not yet implemented.
            <hr>
            See the <dsp:a href="../../EmailDemo/index.jsp">Targeted Email Demo</dsp:a> for a
               complete demonstration of Dynamo's targeted email functionality.
            
--%> </table>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>

</BODY> </HTML>
<%/* @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/fr/email/summary.jsp#2 $$Change: 651448 $*/%> </dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/fr/email/summary.jsp#2 $$Change: 651448 $--%>

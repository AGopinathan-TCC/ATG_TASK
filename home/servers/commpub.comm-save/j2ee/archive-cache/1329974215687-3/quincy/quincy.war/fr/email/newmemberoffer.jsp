<%@ taglib uri="/dspTaglib" prefix="dsp" %> <%@ page import="atg.servlet.*"%> <dsp:page>

<HTML> <HEAD>
<TITLE>Bienvenue chez Quincy Funds</TITLE>
</HEAD>

<dsp:importbean bean="/atg/userprofiling/Profile"/>

<dsp:setvalue value="Offre r�serv�e � nos nouveaux membres" param="messageSubject"/>
<!-- 
Set the value of these parameters to valid email addresses

<dsp:setvalue value="Dynamo5Team@example.com" param="messageFrom"/>
<dsp:setvalue value="Dynamo5Team@example.com" param="messageReplyTo"/>
-->
<dsp:setvalue value="Welcome" param="mailingName"/>


<font face="verdana" size=2>Cher/Ch�re
<dsp:droplet name="/atg/dynamo/droplet/Switch">
  <dsp:param bean="Profile.firstname" name="value"/>
  <dsp:oparam name="unset">
     <dsp:droplet name="/atg/dynamo/droplet/Switch">
        <dsp:param bean="Profile.login" name="value"/>
          <dsp:oparam name="unset">
                 Monsieur ou Madame,
          </dsp:oparam>
          <dsp:oparam name="default">
             <dsp:valueof bean="Profile.login"/>,
          </dsp:oparam>
     </dsp:droplet>

   </dsp:oparam>
  <dsp:oparam name="default">
    <dsp:valueof bean="Profile.firstName"/>
    <dsp:valueof bean="Profile.lastName"/>,
  </dsp:oparam>
</dsp:droplet>

<p>
C'est avec plaisir que nous avons enregistr� votre inscription � Quincy Funds. Consultez notre site ! Vous constaterez que nos services d'informations et nos fonds sont uniques sur le march� des services financiers. <p>

Pour vous remercier de votre inscription, nous vous proposons une offre sp�ciale de bienvenue. Nous avons rassembl� toute une collection de publications destin�es aux nouveaux investisseurs. Pour consulter la liste des publications, cliquez sur ce lien : <!-- Here's the URL that will take the user to our login page with offercode 001
     The login page takes the offercode from the URL and puts it into the transient profile
		 property offerCode, which is then used to redirect the user to the appropriate offer
		 in the scenario MemberOffers.
     Note that email has not been localized in this demo so we just assume english -->
<dsp:a href='<%=ServletUtil.getRequestURL(request,"../login.jsp?offercode=001")%>'>Acc�der � Quincy Funds</dsp:a><p>
Merci de votre confiance,<br>
Joe B. Juan Canobe<br>
Pr�sident de Quincy Funds

</BODY> </HTML>

<%/* @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/fr/email/newmemberoffer.jsp#2 $$Change: 651448 $*/%> </dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/fr/email/newmemberoffer.jsp#2 $$Change: 651448 $--%>

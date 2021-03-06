<%@ taglib uri="/dspTaglib" prefix="dsp" %> 
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<dsp:page>

<DECLAREPARAM NAME="ElementId" CLASS="java.lang.String" DESCRIPTION="Id of the repository element to retrieve">
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<HTML> <HEAD>

<dsp:droplet name="/atg/targeting/RepositoryLookup">
  <dsp:param bean="/atg/demo/QuincyFunds/repositories/Features/Features" name="repository"/>
  <dsp:param name="itemDescriptor" value="feature"/>
  <dsp:param name="id" param="ElementId"/>
  <dsp:oparam name="output">
    <TITLE>Fonctionnalité : <dsp:valueof param="element.title"/></TITLE>
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
                <td>
                <h2>Fonctionnalités</h2>
                <dsp:a href="featurelist.jsp">Liste des fonctionnalités</dsp:a>
                <p>
                <font size=+2><dsp:valueof param="element.title"/></font><br>
                <dsp:valueof param="element.headline"/><p>
        
                <dsp:valueof param="element.author"/>
                <p>
               <!-- insert feature article main body -->    
               <%-- <dsp:getvalueof id="srcval" param="element.relativePath"><dsp:include staticcharset="ISO-8859-1" page="<%=(String)srcval %>" ></dsp:include> </dsp:getvalueof> --%>
               <dsp:valueof valueishtml="true" param="element.featureContent"/>
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
    Pour accéder à cette page, vous devez utiliser un lien contenant l'ID du référentiel de l'article que vous souhaitez afficher.
  </dsp:oparam>
</dsp:droplet>





</BODY> </HTML>
<%/* @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/fr/feature.jsp#2 $$Change: 651448 $ */%> </dsp:page>
<%-- @version $Id: //product/DSS/version/10.0.3/release/DSSJ2EEDemo/j2ee-apps/QuincyFunds/web-app/fr/feature.jsp#2 $$Change: 651448 $--%>

<%--
  Default viewer for elements of collection properties.

  The following request-scoped variables are expected to be set:
  
  @param  mpv  A MappedPropertyView item for this view

  @version $Id: //product/AssetUI/version/10.0.3/src/web-apps/AssetManager/assetEditor/property/defaultComponentViewer.jsp#2 $$Change: 651448 $
  @updated $DateTime: 2011/06/07 13:55:45 $$Author: rbarbier $
  --%>

<%@ taglib prefix="c"     uri="http://java.sun.com/jstl/core"                    %>
<%@ taglib prefix="dspel" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jstl/fmt"                     %>

<dspel:page>

  <%-- Unpack request-scoped parameters into page parameters --%>
  <c:set var="propertyView" value="${requestScope.mpv}"/>
    
  <%-- Display the property value --%>
  <dspel:valueof bean="${propertyView.formHandlerProperty}.${propertyView.componentPropertyName}"/>

</dspel:page>
<%-- @version $Id: //product/AssetUI/version/10.0.3/src/web-apps/AssetManager/assetEditor/property/defaultComponentViewer.jsp#2 $$Change: 651448 $--%>
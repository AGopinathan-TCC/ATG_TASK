<dsp:page>

  <%-- Content page for Email A Friend form
       Parameters - 
       - productId - Repository Id of the Product which is to be emailed 
       - categoryId - Repository Id of the Category to which the chosen Product belongs
       - templateUrl - The template to be used as the email content
  --%>

  <dsp:importbean bean="/atg/commerce/catalog/ProductLookup"/>


    <dsp:droplet name="ProductLookup">
      <dsp:param name="id" param="productId"/>
      <dsp:oparam name="output">

        <%-- Name a product parameter so we can keep track of things --%>
        <dsp:getvalueof var="product" param="element" vartype="java.lang.Object" scope="request"/>

        <%-- Include /browse/subcategoryContentsContainer.jsp to include all gadgets --%> 
        <dsp:getvalueof var="container" vartype="java.lang.String" param="container"/>
        <dsp:include page="${container}" flush="true">
          <dsp:param name="product" value="${product}"/>
          <dsp:param name="categoryId" param="categoryId"/>
          <dsp:param name="productId" param="productId"/>
          <dsp:param name="templateUrl" param="templateUrl"/>
         </dsp:include>

      </dsp:oparam>
      <dsp:oparam name="empty">
        <fmt:message key="common.productNotFound">
          <fmt:param>
            <dsp:valueof param="productId">
              <fmt:message key="common.productIdDefault"/>
            </dsp:valueof>
          </fmt:param>
        </fmt:message>
      </dsp:oparam>

    </dsp:droplet>


</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/COMM/StudentFiles/COM/setup/copy-files/apps/MyStore/Storefront/j2ee-apps/Storefront/store.war/browse/gadgets/emailAFriend.jsp#3 $$Change: 635816 $--%>

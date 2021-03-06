<%@ taglib uri="dsp" prefix="dsp" %>
<%@ taglib uri="core" prefix="core" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
<dsp:importbean bean="/atg/commerce/order/scheduled/ScheduledOrderFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/For"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
<dsp:importbean bean="/atg/commerce/order/scheduled/ScheduledOrderLookup"/>
<dsp:importbean bean="/atg/projects/b2bstore/order/OrderRepositoryQueryServlet"/>
<dsp:importbean bean="/atg/projects/b2bstore/order/OrderQueryServlet"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value=" スケジュール済みオーダー"/></dsp:include>

<DECLAREPARAM NAME="scheduledOrderId" CLASS="java.lang.String" DESCRIPTION="The id of the Scheduled order to manipulate">
<DECLAREPARAM NAME="createNew" CLASS="java.lang.String" DESCRIPTION="Determines whether create new sheduled order or not">


<dsp:droplet name="IsNull">
  <dsp:param name="value" param="scheduledOrderId"/>
  <dsp:oparam name="true">
  </dsp:oparam>
  <dsp:oparam name="false">
    <dsp:setvalue bean="ScheduledOrderFormHandler.repositoryId" paramvalue="scheduledOrderId"/>
  </dsp:oparam>
</dsp:droplet>
          
<dsp:setvalue param="scheduledOrderId" beanvalue="ScheduledOrderFormHandler.repositoryId"/>





          
<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
  </tr>  
   
  
  <dsp:droplet name="IsNull">
    <dsp:param  name="value" bean="ScheduledOrderFormHandler.repositoryId"/>
    <dsp:oparam name="false"> 
      <tr bgcolor="#DBDBDB" > 
        <td colspan=2 height=18> &nbsp; <span class=small>
          <dsp:a href="my_account.jsp">私のアカウント</dsp:a> &gt; 
          <dsp:a href="scheduled_orders.jsp">スケジュール済みオーダー</dsp:a> &gt; 
          <dsp:a href="scheduled_order_preview.jsp"><dsp:valueof bean="ScheduledOrderFormHandler.value.name"/></dsp:a> &gt; 
          スケジュール済みオーダーの編集</td>
      </tr>
    </dsp:oparam>
    <dsp:oparam name="true">
      <dsp:droplet name="Switch">
        <dsp:param name="value" param="createNew"/>
        <dsp:oparam name="new">
          <tr bgcolor="#DBDBDB" > 
            <td colspan=2 height=18> &nbsp; <span class=small>
            <dsp:a href="my_account.jsp">私のアカウント</dsp:a> &gt; 
            <dsp:a href="scheduled_orders.jsp">スケジュール済みオーダー</dsp:a> &gt; 
            スケジュール済みオーダーの作成</td>
          </tr>
        </dsp:oparam>
        <dsp:oparam name="default">
          <tr bgcolor="#DBDBDB" > 
            <td colspan=2 height=18> &nbsp; <span class=small>
            <dsp:a href="my_account.jsp">現在のオーダー</dsp:a> &gt; 
            <dsp:a href="../checkout/shipping.jsp">配達</dsp:a> &gt; 
            <dsp:a href="../checkout/billing.jsp">請求</dsp:a> &gt; 
            <dsp:a href="../checkout/confirmation.jsp">確認</dsp:a> &gt; 
            スケジュール済みオーダーの作成</td>
          </tr>
      </dsp:oparam>
    </dsp:droplet>
    </dsp:oparam>
  </dsp:droplet>
          

  <tr valign=top> 
    <td width=55><img src="../images/d.gif" hspace=27></td>

    <!-- main content area -->
   <td valign="top"  width=745>  
   <table border=0 cellpadding=4 width=80%>
     <tr><td><img src="../images/d.gif"></td></tr>
     <tr valign=top>
       <td colspan=3><span class=big>私のアカウント</span></td>
     </tr>

     <tr valign=top>
       <td><img src="../images/d.gif"></td>
     </tr>
     <!--error messages-->
     <tr>
       <td> <dsp:include page="../common/FormError.jsp"></dsp:include> </td>
     </tr>       
     <tr>
       <td><table width=100% cellpadding=3 cellspacing=0 border=0>
     <tr>
       <td class=box-top>&nbsp;スケジュール済みオーダー</td></tr></table></td>
     </tr>
     <tr><td><img src="../images/d.gif" hspace=27></td></tr>
     <!-- To decide whether there is a template order or fulfilled order-->
     <tr>
       <td>
         <dsp:droplet name="OrderLookup">
           <dsp:param name="userId" bean="Profile.repositoryid"/>
           <dsp:param name="state" value="closed"/>
           <dsp:param name="queryTotal" value="false"/>
           <dsp:oparam name="output">
             <dsp:setvalue param="result" paramvalue="result"/> 
           </dsp:oparam>
         </dsp:droplet>
  
         <dsp:droplet name="IsNull">
           <dsp:param name="value" param="prototypeOrderId"/>
           <dsp:oparam name="true">
             <dsp:droplet name="OrderLookup">
               <dsp:param name="userId" bean="Profile.repositoryId"/>
               <dsp:param name="state" value="closed"/>
               <dsp:param name="queryTotal" value="false"/>
                 <dsp:oparam name="output">
                         <dsp:form formid="fromOrder" action="scheduled_order_new.jsp" method="post">
                         <table border=0 cellpadding=3 width=100%>
                           <tr>
                             <td colspan=2>
                               <dsp:droplet name="IsNull">
                                 <dsp:param bean="ScheduledOrderFormHandler.repositoryId" name="value"/>
                                 <dsp:oparam name="true"><span class=small><dsp:a href="orders_filled.jsp">実行済みオーダー</dsp:a>に基づいてスケジュール済みオーダーを作成します。スケジュール済みオーダーの配達および請求情報は、実行済みオーダーと同じなります。<p>スケジュール済みオーダーは、チェックアウト処理の最後で [スケジュール済みオーダーの作成] を選択すると、現在のオーダーからも作成できます。</span>
                                 </dsp:oparam>
                                 <dsp:oparam name="false"><span class=small>オーダーの名前、スケジュールのタイプ、および発注情報を編集できます。</span>
                                 </dsp:oparam>
                               </dsp:droplet>
                             </td>
                           </tr>
                           <tr><td><dsp:img src="../images/d.gif"/></td></tr>
                           <tr valign=bottom>
                             <td valign="top" align=right><span class=smallb>名前</span></td>
                             <td><dsp:input bean="ScheduledOrderFormHandler.value.name" name="name" size="35" type="text"/><br>
                             <span class=help>スケジュール済みオーダーの名前（スパークプラグセット毎週分など）を入力してください。</span></td>
                           </tr>
                           <tr>
                             <td align=right><span class=smallb>スケジュールのタイプ</span></td>
                             <td align="left">
                               <dsp:select bean="ScheduledOrderFormHandler.moveToMode" name="select" size="1">
                                 <dsp:option value=""/>スケジュールの選択
                                 <dsp:option value="Daily"/>毎日
                                 <dsp:option value="Weekly"/>毎週
                                 <dsp:option value="Monthly"/>毎月
                               </dsp:select>
                             </td>
                           </tr>

                           <dsp:droplet name="IsNull">
                           <dsp:param bean="ScheduledOrderFormHandler.repositoryId" name="value"/>
                           <dsp:oparam name="true"> 
                           <tr>
                             <td align="right" valign=top><span class=smallb>順序</span></td>
                             <td>
                               <dsp:select bean="ScheduledOrderFormHandler.complexScheduledOrderMap.templateOrderId.userInputFields.orderId">
                                 <dsp:droplet name="ForEach">
                                   <dsp:param name="array" param="result"/>
                                   <dsp:oparam name="outputStart">
                                     <dsp:option value=""/>  実行済みオーダーの選択 
                                   </dsp:oparam>
                                   <dsp:oparam name="output">
                                     <dsp:getvalueof id="option384" param="element.id" idtype="java.lang.String">
<dsp:option value="<%=option384%>"/>
</dsp:getvalueof><dsp:valueof param="element.id"/>
                                   </dsp:oparam>  
                                 </dsp:droplet>
                               </dsp:select><br>
                             </td> 
                           </tr>
                           </dsp:oparam>
                           <dsp:oparam name="false">
                           </dsp:oparam>
                           </dsp:droplet> 
                           <tr><td><dsp:img src="../images/d.gif"/></td></tr>
                           <tr> 
                             <td></td>
                             <input name="createNew" type="hidden" value='<dsp:valueof param="createNew"/>'> 
                             <dsp:input bean="ScheduledOrderFormHandler.moveToErrorURL" type="hidden" value="scheduled_order_new.jsp"/>      
                             <dsp:input bean="ScheduledOrderFormHandler.moveToSuccessURL" type="hidden" value="scheduled_order_calendar.jsp?createNew=new"/> 
                             <td><dsp:input bean="ScheduledOrderFormHandler.moveToURL" type="submit" value="続行"/></td>
                           </tr>                            
                           <!-- vertical space -->
                           <tr><td><dsp:img vspace="0" src="../images/d.gif"/></td></tr>
                         </table>
                         </dsp:form>
                   </dsp:oparam>
                   <dsp:oparam name="empty">

                     <dsp:param name="value" param="result"/>
                       <dsp:oparam name="true">
                         今回は、スケジュール済みオーダーを作成するための<dsp:a href="orders_filled.jsp">実行済みオーダー</dsp:a>はありません。  <p>スケジュール済みオーダーは、チェックアウト処理の最後で [スケジュール済みオーダーの作成] を選択すると、現在のオーダーから作成できます。
                       </dsp:oparam>
                     今回は、スケジュール済みオーダーを作成するための<dsp:a href="orders_filled.jsp">実行済みオーダー</dsp:a>はありません。  <p>スケジュール済みオーダーは、チェックアウト処理の最後で [スケジュール済みオーダーの作成] を選択すると、現在のオーダーから作成できます。

                   </dsp:oparam>
                 </dsp:droplet><!--end OrderLookup-->
               </dsp:oparam>  
               <dsp:oparam name="false">
                      
                 <dsp:form formid="newOrder" action="scheduled_order_new.jsp" method="post">
                 <table border=0 cellpadding=3>
                   <tr valign=bottom>
                     <td valign="top" align=right><span class=smallb>名前</span></td>
                     <td><dsp:input bean="ScheduledOrderFormHandler.value.name" name="name" size="25" type="text"/><br>
                         <span class=help>スケジュール済みオーダーの名前を入力してください。</span></td>
                   </tr>
                      
                   <tr>
                     <td><span class=smallb>スケジュールのタイプ</span></td>
                     <td align="left">
                       <dsp:select bean="ScheduledOrderFormHandler.moveToMode" name="select" size="1">
                         <dsp:option value=""/>スケジュールの選択
                         <dsp:option value="Daily"/>毎日
                         <dsp:option value="Weekly"/>毎週
                         <dsp:option value="Monthly"/>毎月
                       </dsp:select>
                     </td>
                   </tr>

                   <dsp:droplet name="Switch">
                     <dsp:param name="value" param="prototypeOrderId"/>
                     <dsp:oparam name="a">
                     </dsp:oparam>
                     <dsp:oparam name="default">
                       <dsp:input bean="ScheduledOrderFormHandler.complexScheduledOrderMap.templateOrderId.userInputFields.orderId" paramvalue="prototypeOrderId" type="HIDDEN"/>
                     </dsp:oparam>
                   </dsp:droplet>
                   <dsp:input bean="ScheduledOrderFormHandler.moveToErrorURL" type="hidden" value="scheduled_order_new.jsp?prototypeOrderId=a"/>                         
                   <tr> 
                     <td></td>     
                     <dsp:input bean="ScheduledOrderFormHandler.moveToSuccessURL" type="hidden" value="scheduled_order_calendar.jsp"/> 
                     <td><dsp:input bean="ScheduledOrderFormHandler.moveToURL" type="submit" value="続行"/></td>
                   </tr>                                              
                   <!-- vertical space -->
                   <tr><td><dsp:img vspace="0" src="../images/d.gif"/></td></tr>
                 </table>
                 </dsp:form>
               </dsp:oparam>  
             </dsp:droplet><!--end IsNull-->
           </td>
         </tr>
      </table>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/user/scheduled_order_new.jsp#2 $$Change: 651448 $--%>

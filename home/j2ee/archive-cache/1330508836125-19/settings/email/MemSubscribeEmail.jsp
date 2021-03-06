
<%@ taglib uri="/dsp" prefix="dsp" %>
<%@ taglib uri="/jakarta-i18n-1.0" prefix="i18n" %>

<dsp:page>

<!-- Title: Membership Subscribe Alert Notification -->

<dsp:setvalue param="messageFrom" value="no-one@example.com"/>
<dsp:setvalue param="messageSubject" value="Membership Request Alert Notification"/>
<dsp:setvalue param="messageReplyTo" value="no-one@example.com"/>
<dsp:setvalue param="mailingName" value="Alert Notification"/>

<p>A membership subscribe request of enrollment type: <dsp:valueof param="alertMsg.enrollmentType">unknown</dsp:valueof> was genereated for the community: <dsp:valueof param="alertMsg.communityId">unknown</dsp:valueof> by the user: <dsp:valueof param="alertMsg.profileId">unknown</dsp:valueof>


</dsp:page>


<%-- i18n KEYS
SUBJECT_MEM_SUBSCRIBE
BODY_HEADER_MEM_SUBSCRIBE
BODY_CONTENT_MEM_SUBSCRIBE
--%>
<%-- @version $Id: //app/portal/version/10.0.3/paf/settings.war/email/MemSubscribeEmail.jsp#2 $$Change: 651448 $--%>

<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>

<%/* A shopping cart-like display of order information */%>

<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>

<dsp:droplet name="IsNull">
  <dsp:param name="value" param="order.shippingGroups"/>
  <dsp:oparam name="true">
   <p>���̃I�[�_�[�ɂ́A�z�B�O���[�v������܂���B
  </dsp:oparam>
  <dsp:oparam name="false">
    <table>
    <dsp:droplet name="ForEach">
      <dsp:param name="array" param="order.shippingGroups"/>
      <dsp:param name="elementName" value="sg"/>
      <dsp:oparam name="empty">
	�z�B�O���[�v������܂���B<br>
      </dsp:oparam>
      <dsp:oparam name="output">
	<tr valign=top>
	  <td>
	      <b>���̃A�C�e����z�B���܂��F</b><br>
	      <dsp:droplet name="ForEach">
		<dsp:param name="array" param="sg.commerceItemRelationships"/>
		<dsp:param name="elementName" value="itemRel"/>
		<dsp:oparam name="empty">
		  ���̔z�B�O���[�v�ɂ̓A�C�e��������܂���B
		</dsp:oparam>
		<dsp:oparam name="output">
		  <dsp:droplet name="Switch">
		    <dsp:param name="value" param="itemRel.relationshipTypeAsString"/>
		    <dsp:oparam name="SHIPPINGQUANTITY">
		      �� <dsp:valueof param="itemRel.quantity">���ʂ��w�肳��Ă��܂���B</dsp:valueof>
		    </dsp:oparam> 
		    <dsp:oparam name="SHIPPINGQUANTITYREMAINING">
		      ���z�B���F 
		    </dsp:oparam> 
	          </dsp:droplet>
		  <dsp:valueof param="itemRel.commerceItem.auxiliaryData.catalogRef.displayName">�\�����Ȃ��B</dsp:valueof>
		  <br>
	        </dsp:oparam>
	      </dsp:droplet>
	  </td>
	  <td>    
	      <p><b>���̏����g�p�F</b><br>
	      <dsp:droplet name="Switch">
		<dsp:param name="value" param="sg.shippingGroupClassType"/>
		<dsp:oparam name="hardgoodShippingGroup">
		  <dsp:valueof param="sg.shippingMethod">�z�B���@�̎w��Ȃ�</dsp:valueof>�ɂ��z�B��F<BR>
		  <dsp:valueof param="sg.shippingAddress.lastName"/> 
		  <dsp:valueof param="sg.shippingAddress.firstName"/><BR>
		  <dsp:valueof param="sg.shippingAddress.address1"/> 
		  <dsp:valueof param="sg.shippingAddress.address2"/><BR>
		  <dsp:valueof param="sg.shippingAddress.city"/>, 
		  <dsp:valueof param="sg.shippingAddress.state"/> 
		  <dsp:valueof param="sg.shippingAddress.postalCode"/><BR>
	       </dsp:oparam>
		<dsp:oparam name="b2bHardgoodShippingGroup">
		  <dsp:valueof param="sg.shippingMethod">�z�B���@�̎w��Ȃ�</dsp:valueof>�ɂ��z�B��F<BR>
		  <dsp:valueof param="sg.shippingAddress.lastName"/> 
		  <dsp:valueof param="sg.shippingAddress.firstName"/><BR>
		  <dsp:valueof param="sg.shippingAddress.jobTitle"/><BR>
		  <dsp:valueof param="sg.shippingAddress.companyName"/><BR>
		  <dsp:valueof param="sg.shippingAddress.address1"/> 
		  <dsp:valueof param="sg.shippingAddress.address2"/><BR>
		  <dsp:valueof param="sg.shippingAddress.city"/>, 
		  <dsp:valueof param="sg.shippingAddress.state"/> 
		  <dsp:valueof param="sg.shippingAddress.postalCode"/><BR>
	       </dsp:oparam>
	       <dsp:oparam name="electronicShippingGroup">
		 �d�q���[���ɂ��z�B��F<BR>
		 <dsp:valueof param="sg.emailAddress">�s���ȓd�q���[���A�h���X</dsp:valueof><BR>
	       </dsp:oparam>
	     </dsp:droplet>
	 </td>
       </tr>
       <tr></tr>
      </dsp:oparam>
    </dsp:droplet>    
    </table>
  </dsp:oparam>
</dsp:droplet>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/email/fulfillment/DisplayShippingInfo.jsp#2 $$Change: 651448 $--%>

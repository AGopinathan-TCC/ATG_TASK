/*<ATGCOPYRIGHT>
 * Copyright (C) 2001-2011 Art Technology Group, Inc.
 * All Rights Reserved.  No use, copying or distribution of this
 * work may be made except in accordance with a valid license
 * agreement from Art Technology Group.  This notice must be
 * included on all copies, modifications and derivatives of this
 * work.
 *
 * Art Technology Group (ATG) MAKES NO REPRESENTATIONS OR WARRANTIES
 * ABOUT THE SUITABILITY OF THE SOFTWARE, EITHER EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT. ATG SHALL NOT BE
 * LIABLE FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING,
 * MODIFYING OR DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES.
 *
 * "Dynamo" is a trademark of Art Technology Group, Inc.
 </ATGCOPYRIGHT>*/

package atg.portal.gear.poll;

import java.lang.String;

import atg.portal.framework.GearEnvironment;

/**
 *
 *
 * @author Jeff Banister
 * @version $Id: //app/portal/version/10.0.3/poll/src/atg/portal/gear/poll/PollVoteMessage.java#2 $$Change: 651448 $
 * @updated $DateTime: 2011/06/07 13:55:45 $$Author: rbarbier $
 **/

public class PollVoteMessage extends PollMessage
{

  //-------------------------------------
  /** Class version string */

  public static String CLASS_VERSION = "$Id: //app/portal/version/10.0.3/poll/src/atg/portal/gear/poll/PollVoteMessage.java#2 $$Change: 651448 $";


  //-------------------------------------
  // Constants
  //-------------------------------------

  /** Used by serialization to determine if bean can be deserialized */
  static final long serialVersionUID = 5624496223934892386L;

  /** JMS Message type of this gear message */
  static final String MESSAGE_TYPE = "atg.portal.gear.poll.PollVoteMessage";

  //-------------------------------------
  // Properties
  //-------------------------------------

  /** Repository id of the response item created for this poll vote event */
  transient private String mResponseId;

  //-------------------------------------
  // Constructors
  //-------------------------------------

  public PollVoteMessage()
  {
  }
  
  public PollVoteMessage(GearEnvironment pEnv)
  {
    super(pEnv, MESSAGE_TYPE);
  }

  //-------------------------------------
  // Property Accessors
  //-------------------------------------

  public String getResponseId()
  {
    return mResponseId;
  }

  public void setResponseId(String pResponseId)
  {
    mResponseId = pResponseId;
  }
}


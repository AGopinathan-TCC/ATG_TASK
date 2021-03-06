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

import java.util.HashSet;

/**
 * This session scoped nucleus component keeps track of what 
 * polls have been voted on in the curret session, so that we 
 * can avoid multiple votes per session.
 *
 * @author Jeff Banister
 * @version $Id: //app/portal/version/10.0.3/poll/src/atg/portal/gear/poll/PollTrackerBean.java#2 $$Change: 651448 $
 * @updated $DateTime: 2011/06/07 13:55:45 $$Author: rbarbier $
 */
public class PollTrackerBean
{
  //-------------------------------------
  /** Class version string */
  public static String CLASS_VERSION = "$Id: //app/portal/version/10.0.3/poll/src/atg/portal/gear/poll/PollTrackerBean.java#2 $$Change: 651448 $";

  //  Public constructor
  public PollTrackerBean () {}


  //---------------------------------------------------------------------------
  // property: pollId
  private HashSet mPollMap=new HashSet();

  public void setPollMap(HashSet pPollMap) {
    mPollMap = pPollMap;
  }

  public HashSet getPollMap() {
    return mPollMap;
  }

  //---------------------------------------------------------------------------
  // Class methods

  public void addPoll(String pollId) {
   mPollMap.add(pollId);
  }

  public boolean hasPoll(String pollId) {
      return mPollMap.contains(pollId);
  }

} // end of class

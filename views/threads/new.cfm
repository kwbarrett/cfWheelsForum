<cfparam name="thread" default=""/>
<cfparam name="post" default=""/>
<h2>Start a thread</h2>
<cfdump var="#thread#">
<cfoutput>
	#startFormTag(controller="threads", action="create", params="forumID=#params.forumID#")#
	#hiddenField(objectName="thread", property="userid")#
	#hiddenField(objectName="post", property="userid")#
	#textField(label="Subject: ", objectName="thread", property="threadTitle")#<br/>
	#textArea(label="", objectName="post", property="postBody", cols="56", rows="8")#<br/>
	#checkBox(label="Sticky", objectName="thread", property="isSticky", checkedValue="1", uncheckedValue="0")#<br/>
	#submitTag("Reply")#
	#endFormTag()#
	#buttonTo(text="Back", action="viewForum", controller="forums", key=params.forumID)#
</cfoutput>
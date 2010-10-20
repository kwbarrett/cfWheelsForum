<cfparam name="thread" default=""/>
<cfparam name="post" default=""/>
<h2>Start a thread</h2>

<cfoutput>
	#flash("error")#
	
	#errorMessagesFor(objectName="thread")#
	
	#startFormTag(controller="threads", action="create", params="forumID=#params.forumID#")#
	#textField(label="Subject: ", objectName="thread", property="threadTitle", size="50")#<br/>
	#textArea(label="", objectName="post", property="postBody", cols="50", rows="5", class="ckeditor")#<br/>
	#checkBox(label="Sticky", objectName="thread", property="isSticky", checkedValue="1", uncheckedValue="0")#<br/>
	#submitTag("Post")#
	#endFormTag()#
</cfoutput>
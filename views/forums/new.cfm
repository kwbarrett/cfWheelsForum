<!--- 
	name: new.cfm
	author: Ken Barrett
	purpose: I display the 'new forum' form.
 --->

<cfparam name="forum"  default=""/>

<cfoutput>

	#flash("error")#
	
	#errorMessagesFor(objectName="forum")#
	
	<h2>Create a new forum</h2>
	#startFormTag(controller="forums", action="create")#
	#hiddenField(objectName="forum", property="userid")#
	#textField(label="*Forum Name", objectName="forum", property="forumName", size="50")#
	#textArea(label="*Description", objectName="forum", property="forumDescription", cols="50", rows="5", class="ckeditor")#
	#submitTag("Submit")#
	#endFormTag()#
</cfoutput>
<!--- 
	title: newPost.cfm
	author: Ken Barrett
	purpose: I display the 'New post' form.
 --->
 
<h2>Reply to thread</h2>

<cfoutput>
	#startFormTag(controller="posts", action="create", params="threadID=#params.threadID#")#
	#textArea(label=" ", objectName="post", property="postBody", rows="5", cols="50", class="ckeditor")#
	#submitTag("Reply")#
	#endFormTag()#
</cfoutput>
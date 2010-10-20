<cfcomponent extends="Controller" output="false">
	<cffunction name="newPost">
		<cfset post = model("post").new(threadID=#params.threadID#)/>
	</cffunction>
	
	<cffunction name="create">
		<cfset params.post.userID = 2/>
		<cfset params.post.threadID = params.threadID/>
		<cfset post = model("post").new(params.post)/>
		<cfif post.save()>
			<cfset flashInsert(success="Reply has been added successfully.")/>
			<cfset redirectTo(controller="threads", action="viewThread", key=#post.threadid#)/>
		<cfelse>
			<cfset flashInsert(error="There was a problem with your reply. #errorMessagesFor('post')#")/>
			<cfset post = model("post").new(threadID=#params.threadID#)/>
			<cfset renderPage("newPost")/>
		</cfif>
	</cffunction>
</cfcomponent>
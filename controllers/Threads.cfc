<cfcomponent extends="Controller" output="false">
	<cffunction name="viewThread">
		<cfparam name="params.page" default="1"/>
		<cfset thread = model("thread").findOne(select="threads.threadTitle, threads.forumID, threads.views, forums.forumName", where="threads.id=#params.key#", include="forum")>
		<cfset posts = model("post").findAll(include="user(role)", where="posts.threadID=#params.key#", order="posts.id ASC", perPage=5, page=params.page)>
		<cfset thread.views = (thread.views + 1)/>
		<cfset increaseThreadView = model("thread").updateByKey(key=params.key, views=thread.views)/>
	</cffunction>
	
	<cffunction name="new">
		<cfset thread = model("thread").new(forumID=#params.forumID#)/>
		<cfset post = model("post").new()/>
	</cffunction>
	
	<cffunction name="create">
		<cfset params.thread.userID = 2/><!--- ToDo: change this to session variable once sessions are added. --->
		<cfset params.thread.views = 0/>
		<cfset params.thread.forumID = params.forumID/>
		<cfset thread = model("thread").new(params.thread)/>
		<cfif thread.save()>
			<cfset params.post.threadid = thread.id/>
			<cfset params.post.userid = 2/><!--- ToDo: change this to session variable once sessions are added. --->
			<cfset post = model("post").new(params.post)/>
			<cfif post.save()>
				<cfset flashInsert(success="Thread/post were created successfully.")/>
				<cfset redirectTo(controller="threads", action="viewThread", key=#thread.id#)/>
			<cfelse>
				<cfset flashInsert(error="There was a problem creating the post. #errorMessagesFor('post')#")/>
				<cfset thread = model("thread").new(forumID=#params.forumID#)/>
				<cfset post = model("post").new()/>
				<cfset renderPage(controller="threads", action="new")/>
			</cfif>
		<cfelse>
			<cfset flashInsert(error="There was a problem creating the thread.  #errorMessagesFor('thread')#")/>
			<cfset thread = model("thread").new(forumID=#params.forumID#)/>
			<cfset post = model("post").new()/>
			<cfset renderPage(controller="threads", action="new")/>
		</cfif>
	</cffunction>
</cfcomponent>
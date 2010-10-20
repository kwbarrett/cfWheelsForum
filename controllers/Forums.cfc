<cfcomponent extends="Controller" output="false">
	
	<cffunction name="index">
		<cfset forums = model("forum").findAll()>
	</cffunction>
	
	<cffunction name="viewForum">
		<cfparam name="params.page" default="1"/>
		<cfset forumInfo = model("forum").findByKey(params.key)/>
		<cfset threads = model("thread").findAll(include="user", where="threads.forumID=#params.key#", order="isSticky DESC", perPage=5, page=params.page)>
	</cffunction>
	
	<cffunction name="new">
		<cfset forum = model("forum").new(userid=1)/>
	</cffunction>
	
	<cffunction name="create">
		<cfset forum = model("forum").new(params.forum)/>
		
		<cfif forum.save()>
			<cfset flashInsert(success="Forum created successfully.")/>
			<cfset redirectTo(controller="forums", action="index")/>
		<cfelse>
			<cfset flashInsert(error="There was a problem creating the forum. #errorMessagesFor('forum')#")/>
			<cfset forum = model("forum").new(userid=1)/>
			<cfset renderPage(action="new")/>
		</cfif>
	</cffunction>
</cfcomponent>
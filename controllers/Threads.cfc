<cfcomponent extends="Controller" output="false">
	<cffunction name="list">
		<cfset threads = model("threads").findAll(select="id, threadTitle, views, isSticky, users.id AS userid, users.username, count(posts.id) AS replies", MAX(posts.createdat) AS lastPost), include="user, posts" where="threads.forumID=#params.key#">
	</cffunction>
</cfcomponent>
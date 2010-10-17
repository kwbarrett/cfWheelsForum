<cfcomponent extends="Model" output="false">
	<cffunction name="init">
		<cfset property(name="replies", sql="SELECT COUNT(posts.id) FROM posts WHERE posts.threadID = threads.id")/>
		<cfset property(name="lastpost", SQL="SELECT MAX(posts.createdat) FROM posts WHERE posts.threadid = threads.id")>
		<cfset belongsTo("forum")/>
		<cfset hasMany("posts")/>
		<cfset belongsTo("user")/>
	</cffunction>
</cfcomponent>
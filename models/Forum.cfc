<cfcomponent extends="Model" output="false">
	<cffunction name="init">
		<cfset hasMany("threads")/>
		<cfset property(name="total", sql="(SELECT COUNT(posts.id) FROM threads LEFT JOIN posts ON posts.threadID = threads.id GROUP BY threads.forumid)")/>
	</cffunction>
</cfcomponent>
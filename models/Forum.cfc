<cfcomponent extends="Model" output="false">
	<cffunction name="init">
		<!--- Associations --->
		<cfset hasMany("threads")/>
		
		<!--- Properties --->
		<cfset property(name="total", sql="(SELECT COUNT(posts.id) FROM threads LEFT JOIN posts ON posts.threadID = threads.id GROUP BY threads.forumid)")/>
		
		<!--- Validations --->
		<cfset validatesPresenceOf(property="forumName", message="Forum name is required.")/>
		<cfset validatesPresenceOf(property="forumDescription", message="Description is required.")/>
	</cffunction>
</cfcomponent>
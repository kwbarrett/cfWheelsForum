<cfcomponent extends="Model" output="false">
	<cffunction name="init">
		<!--- Properties --->
		<cfset property(name="replies", sql="SELECT COUNT(posts.id) FROM posts WHERE posts.threadID = threads.id")/>
		<cfset property(name="lastpost", SQL="SELECT MAX(posts.createdat) FROM posts WHERE posts.threadid = threads.id")>
		
		<!--- Associations --->
		<cfset belongsTo("forum")/>
		<cfset hasMany("posts")/>
		<cfset belongsTo("user")/>
		
		<!--- Validations --->
		<cfset validatesPresenceOf("threadTitle", "Subject is required.")/>
	</cffunction>
</cfcomponent>
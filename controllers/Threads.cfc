<cfcomponent extends="Controller" output="false">
	<cffunction name="viewThread">
		<cfset thread = model("thread").findOne(where="threads.id=#params.key#", include="forum")>
		<cfset posts = model("post").findAll(include="user", where="posts.threadID=#params.key#", order="posts.id ASC")>
		<!--- <cfdump var="#thread#"><cfdump var="#posts#"><cfabort> --->
	</cffunction>
	
	<cffunction name="new">
		<cfset thread = model("thread").new(userid=1)/>
		<cfset post = model("post").new(userid=1)/>
	</cffunction>
	
	<cffunction name="create">
		<cfdump var="#params#"><cfabort>
	</cffunction>
</cfcomponent>
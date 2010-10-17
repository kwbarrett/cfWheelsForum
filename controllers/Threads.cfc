<cfcomponent extends="Controller" output="false">
	<cffunction name="viewThread">
		<cfset thread = model("thread").findOne(where="threads.id=#params.key#", include="forum")>
		<cfset posts = model("post").findAll(include="user", where="posts.threadID=#params.key#", order="posts.id ASC")>
		<!--- <cfdump var="#thread#"><cfdump var="#posts#"><cfabort> --->
	</cffunction>
</cfcomponent>
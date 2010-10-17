<cfcomponent extends="Controller" output="false">
	<cffunction name="index">
		<cfset forums = model("forum").findAll()>
	</cffunction>
	
	<cffunction name="viewForum">
		<cfset forumInfo = model("forum").findByKey(params.key)/>
		<cfset threads = model("thread").findAll(include="user", where="threads.forumID=#params.key#", order="isSticky DESC")>
	</cffunction>
</cfcomponent>
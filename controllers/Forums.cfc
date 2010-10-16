<cfcomponent extends="Controller" output="false">
	<cffunction name="index">
		<cfset forums = model("forum").findAll()>
	</cffunction>
</cfcomponent>
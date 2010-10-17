<cfcomponent extends="Model" output="false">
	<cffunction name="init">
		<cfset belongsTo("thread")/>
		<cfset belongsTo("user")/>
	</cffunction>
</cfcomponent>
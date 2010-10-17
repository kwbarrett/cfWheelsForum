<cfcomponent extends="Model" output="false">
	<cffunction name="init">
		<cfset hasMany("posts")/>
		<cfset hasMany("threads")/>
	</cffunction>
</cfcomponent>
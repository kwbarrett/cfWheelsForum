<cfcomponent extends="Model" output="false">
	<cffunction name="init">
		<!--- Associations --->
		<cfset belongsTo("thread")/>
		<cfset belongsTo("user")/>
		
		<!--- Validations --->
		<cfset validatesPresenceOf("postBody", "Text of post is required.")/>
	</cffunction>
</cfcomponent>
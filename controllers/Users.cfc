<cfcomponent extends="Controller" output="false">
	<cffunction name="index" hint="I retrieve all users in the system.">
		<cfset users = model("user").findAll(include="posts,role", order="users.createdat")/>
		<!---<cfdump var="#users#"><cfabort>--->
	</cffunction>
	
	<cffunction name="new" hint="I create a new instance of user">
		<cfset user = model("user").new(numPosts=0)/>
		<cfset roles = model("role").findAll(order="sortorder ASC")/>
	</cffunction>
	
	<cffunction name="create" hint="I insert a new user record into the DB">
		<cfset params.user.numPosts = 0/>
		<cfset user = model("user").new(params.user)/>
		<cfif user.save()>
			<cfset flashInsert(sucess="User created successfully.")/>
			<cfset redirectTo(controller="users", action="index")/>
		<cfelse>
			<cfset flashInsert(error="There was a problem creating the user record. #errorMessagesFor()#")/>
			<cfset user = model("user").new(numPosts=0)/>
			<cfset roles = model("role").findAll(order="sortorder ASC")/>
			<cfset renderPage("new")/>
		</cfif>
	</cffunction>
	
	<cffunction name="login">
		
	</cffunction>
</cfcomponent>
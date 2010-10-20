<cfcomponent extends="Model" output="false">
	<cffunction name="init">
		<!--- Associations --->
		<cfset hasMany("posts")/>
		<cfset hasMany("threads")/>
		<cfset belongsTo(name="role")/>
		
		<!--- Properties --->
		<!--- intPosts is a calculated property that represents the number of posts for a given user. --->
		<!---<cfset property(name="intPosts", sql="SELECT COUNT(posts.id) FROM posts INNER JOIN users ON posts.userID = users.id GROUP BY posts.userid")/>--->
		<!--- Validations --->
		<cfset validatesPresenceOf("username", "Username is required.")/>
		<cfset validatesPresenceOf("password", "Password is required")/>
		<cfset validatesConfirmationOf("password", "Please confirm your password properly.")/>
	</cffunction>
</cfcomponent>
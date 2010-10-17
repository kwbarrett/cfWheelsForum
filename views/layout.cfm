<!--- Place HTML here that should be used as the default layout of your application --->
<cfparam name="attributes.title" default="myForum"/>

<!--- Display the header of our design --->
<html>
	<head>
		<cfoutput>#styleSheetLinkTag("styles")#</cfoutput>
		<title><cfoutput>#attributes.title#</cfoutput></title>
	</head>
	<body>
		<div align="center" style="background:#ffd579; border-bottom:4px #fc0 solid;">
			<h1 id="top">My Forum</h1>
			<cfif structKeyExists(session, "userID")>
				<!--- This checks to see if the session.userID is set --->
				<cfquery name="uname" datasource="#request.dsn#">
					<!--- If the above statement returns true, we query the db to find out their username --->
					SELECT userName, role
					FROM users
					WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userID#">
				</cfquery>
				<!--- Greet the user and display the logout link --->
				Welcome <strong><cfoutput>#uname.userName#</cfoutput>!</strong> - [<a href="logout.cfm">Logout</a>]
			<cfelse>
				<!--- If the session is not set, meaning the user is not logged in, we display the login or uname
				register links --->
				[<a href="login.cfm">Login</a>] [<a href="register.cfm">Register</a>]
			</cfif>
		</div>
		<cfoutput>#contentForLayout()#</cfoutput>
		<!--- Display the footer of our design --->
		<hr>
		<div align="center">&copy; My Forum <cfoutput>#DateFormat(Now(),'yyyy')#</cfoutput></div>
	</body>
</html>
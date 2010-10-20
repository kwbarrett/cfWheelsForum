<!--- 
	filename: new.cfm
	author: Ken Barrett
	Purpose: I display the 'New user' form
 --->
 
<cfparam name="user" default=""/>
<cfparam name="roles" default=""/>

<h2>New user</h2>

<cfoutput>
	#flash("error")#
	
	#errorMessagesFor("user")#
	
	#startFormTag(controller="users", action="create")#
	#textField(label="* Username", objectName="user", property="userName")#
	#passwordField(label="* Password", objectName="user", property="password")#
	#passwordField(label="* Confirm password", objectName="user", property="passwordConfirmation")#
	#select(label="Role", objectName="user", options=roles, property="roleID", includeBlank="--Select one--")#
	#submitTag("Add user")#
	#endFormTag()#	
	
</cfoutput>
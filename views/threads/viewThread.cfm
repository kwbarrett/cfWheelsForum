<cfoutput>
	#includePartial("threadBreadcrumbs")#
</cfoutput>
<p>
<cfoutput>
	[#linkTo(text="Reply", controller="posts", action="newPost", params="threadID=#params.key#")#]
</cfoutput>
</p>
<p>
	<!--- Output the posts query --->
	<cfoutput query="posts">
		<table width="100%" class="posts" cellpadding="0" cellspacing="0" <cfif NOT currentRow MOD 2> bgcolor="##ebebeb"</cfif>>
			<tr>
				<td width="200">
					<h3>#userName#</h3>
					<cfif role EQ 2>Moderator <cfelse> Junior Member</cfif><br/>
					Posts: #numPosts#<br/>
					Joined: #DateFormat(joinDate, "m/d/yyyy")#
				</td>
				<td valign="top">
					#postBody#
				</td>
			</tr>
			<tr class="small">
				<td>
					[<a href="##top">Back to top</a>]
				</td>
				<td>
					<strong>#DateFormat(createdat, "m/d/yyyy")#</strong> #TimeFormat(createdat, "h:mm tt")# 
					<cfif structKeyExists(session, 'userID') AND (session.userID EQ userID OR role.role EQ 2)>
						 - [<a href="editpost.cfm?p=#id#">Edit</a>]
					</cfif>
				</td>
			</tr>
		</table>
	</cfoutput>
</p>
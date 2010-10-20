<cfoutput>
	#includePartial("threadBreadcrumbs")#
</cfoutput>

<p>
<cfoutput>
	<p>#flash("success")#</p>
	#buttonTo(text="Post Reply", controller="posts", action="newPost", params="threadID=#params.key#")#
</cfoutput>
</p>
<p>
	<!--- Output the posts query --->
	<cfoutput query="posts">
		<table width="100%" class="posts" cellpadding="0" cellspacing="0" <cfif NOT currentRow MOD 2> bgcolor="##ebebeb"</cfif>>
			<tr>
				<td width="200">
					<h3>#userName#</h3>
					#rolename#<br/>
					<b>Joined:</b> #DateFormat(createdat, "d mmm yyyy")#
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
	<cfoutput>
		#paginationLinks(route="threadWithPageNum", key=params.key)#
	</cfoutput>
</p>


<cfoutput>
	<h2>#forumInfo.forumName#</h2>
	#linkTo(text="Home", controller="forums", action="index")# &gt; #forumInfo.forumName#<br/><!--- Display the breadcrumbs from the start --->
	
	<p>#buttonTo(text="New Thread", controller="threads", action="new", params="forumID=#params.key#")#</p>
</cfoutput>

<table width="100%">
	<thead>
		<tr>
			<th width="15"></th>
			<th width="60%">Thread</th>
			<th width="200">Last Post</th>
			<th width="60">Replies</th>
			<th width="60">Views</th>
		</tr>
	</thead>
	<tbody>
		<cfoutput query="threads">
			<tr height="35" <cfif currentRow MOD 2>bgcolor="##ebebeb"</cfif>>
				<td align="center">
					<strong>#currentRow#</strong>
				</td>
				<td>
					<cfif isSticky>Sticky: </cfif>#linkTo(text="#threadTitle#", controller="threads", action="viewThread", key="#id#")#
					<cfif structKeyExists(session, 'userID') AND (session.userID EQ userID OR role.role EQ 2)>
						[<a href="edittopic.cfm?t=#id#">Edit</a>]
					</cfif>
				</td>
				<td width="150">
					#DateFormat(lastpost, "m/d/yyyy")# #TimeFormat(lastpost, "h:mm tt")# <br/>
					by #userName#
				</td>
				<td align="center">
					#replies-1#
				</td>
				<td align="center">#views#</td>				
			</tr>
		</cfoutput>
	</tbody>
</table>
<cfoutput>
	#paginationLinks(route="forumWithPageNum", key=params.key)#
</cfoutput>
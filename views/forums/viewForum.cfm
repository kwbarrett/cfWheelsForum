

<cfoutput>
	<h2>#forumInfo.forumName#</h2>
	<a href="index.cfm">Home</a> &gt; #forumInfo.forumName#<br/><!--- Display the breadcrumbs from the start --->
	<div align="center">[#linkTo(text="New thread", controller="threads", action="new", params="forumID=#params.key#")#]</div>
</cfoutput>

<table width="100%">
	<thead>
		<tr>
			<th width="15"></th>
			<th>Thread</th>
			<th width="150">Posted By</th>
			<th width="60">Views</th>
			<th width="60">Replies</th>
			<th width="150">Last Post</th>
		</tr>
	</thead>
	<tbody>
		<cfoutput query="threads">
			<tr height="35" <cfif currentRow MOD 2>bgcolor="##ebebeb"</cfif>>
				<td align="center">
					<strong>#currentRow#</strong>
				</td>
				<td>
					<cfif isSticky>Sticky: </cfif>#linkTo(text="#threadTitle#", controller="threads", action="viewThread", key="#id#")#<!--- <a href="viewtopic.cfm?t=#id#">#threadTitle#</a> ---> 
					<cfif structKeyExists(session, 'userID') AND (session.userID EQ userID OR role.role EQ 2)>
						[<a href="edittopic.cfm?t=#id#">Edit</a>]
					</cfif>
				</td>
				<td>
					#userName#
				</td>
				<td align="center">#views#</td>
				<td align="center">
					#replies-1#
				</td>
				<td width="150">#DateFormat(lastpost, "m/d/yyyy")# #TimeFormat(lastpost, "h:mm tt")#</td>
			</tr>
		</cfoutput>
	</tbody>
</table>
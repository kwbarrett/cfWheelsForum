<cfparam name="forums" default=""/>
<h2>Welcome to MyForum</h2>
<table width="100%">
	<thead>
		<tr bgcolor="#ffd579">
			<th>Forum</th>
			<th>Description</th>
			<th>Posts</th>
		</tr>
	</thead>
	<tbody>
		<cfoutput query="forums">
			<!--- Here we are outputting the forums query.  The forums query will return every forum with a post count --->
			<tr height="35" <cfif currentRow MOD 2>bgcolor="##ebebeb"</cfif>>
				<td>
					#linkTo(text="#forumName#", controller="forums", action="viewForum", key="#id#")#
				</td>
				<td>#forumDescription#</td>
				<td align="center">#val(total)#</td>
			</tr>
		</cfoutput>
	</tbody>
</table>	
<!--- 
	title: index.cfm
	author: Ken Barrett
	purpose:  I display a list of all forum users.
 --->

<cfparam name="users"  default=""/>

<h2>Users</h2>
<cfoutput>
	#flash("success")#
</cfoutput>	
	<table width="100%">
		<thead>
			<tr>
				<th><br/></th>
				<th>Username</th>
				<th>Role</th>
				<th>Posts</th>
				<th>Date Added</th>
			</tr>
		</thead>
		<tbody>
			<cfoutput query="users">
				<tr  height="35" <cfif currentRow MOD 2>bgcolor="##ebebeb"</cfif>>
					<td align="center"><strong>#currentRow#</strong></td>
					<td>#userName#</td>
					<td>#roleName#</td>
					<td align="center">#val(intPosts)#</td>
					<td>#DateFormat(createdat,'short')#</td>
				</tr>
			</cfoutput>
		</tbody>
	</table>
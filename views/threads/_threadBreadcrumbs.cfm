<cfoutput>
	<h2>#thread.threadTitle#</h2>
	<a href="index.cfm">Home</a> &gt;  <!--- Breadcrumbs --->
	#linkTo(text="#thread.forum.forumName#", controller="forums", action="viewForum", key=thread.forumID)# &gt; 
	#thread.threadTitle#
</cfoutput>
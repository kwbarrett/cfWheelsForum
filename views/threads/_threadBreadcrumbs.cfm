<cfoutput>
	<h2>#thread.threadTitle#</h2>
	#linkTo(text="Home", route="home")# &gt;  <!--- Breadcrumbs --->
	#linkTo(text="#thread.forum.forumName#", controller="forums", action="viewForum", key=thread.forumID)# &gt; 
	#thread.threadTitle#
</cfoutput>
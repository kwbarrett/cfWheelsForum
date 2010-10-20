<!---
	Here you can add routes to your application and edit the default one.
	The default route is the one that will be called on your application's "home" page.
--->
<cfset addRoute(name="home", pattern="", controller="forums", action="index")>
<cfset addRoute(name="threadWithPageNum", pattern="threads/viewThread/[key]/page/[page]", action="viewThread", controller="threads")/>
<cfset addRoute(name="forumWithPageNum", pattern="forums/viewForum/[key]/page/[page]", action="viewForum", controller="forums")/>
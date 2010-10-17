<!--- Place HTML here that should be used as the default layout of your application --->
<html>
	<head>
		<cfoutput>#styleSheetLinkTag("styles")#</cfoutput>
	</head>
	<body>
		<cfoutput>#contentForLayout()#</cfoutput>
	</body>
</html>
<cfapplication name="mumbles" sessionmanagement="Yes" >
<!--- sessions required to support login --->

<!--- Now define that this user is logged out by default --->
<cfparam name="session.allowin" default="false">
<cfparam name="session.username" default="" >

<!--- if not loggedin then redirect to login screen --->
<cfif session.allowin eq false >
	<!--- check if they are trying to access login page otherwise redirect to login --->
	<cfif not( listlast(cgi.script_name,'/') eq "loginUser.cfm" )>
		<!--- this user is not logged in, redirect to the loginUser.cfm page --->
		<cflocation addtoken="no" url="loginUser.cfm" >
	</cfif>
</cfif>
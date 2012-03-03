<cfcomponent extends="taffy.core.resource" taffy_uri="/users">

	<cffunction name="get" access="public" output="false" >
		
		<cfquery  name="qry" dbtype="query" >
			select username from application.users order by username; 
		</cfquery>

		<cfreturn representationOf(qry).withStatus(200) />

	</cffunction>

	<cffunction name="post" access="public" output="false">
		<cfargument name="username" type="string" required="true" >
		<cfargument name="password" type="string" required="true" >

		<cfquery name="qVerify" dbtype="query" >
			select * from application.users where username = '#arguments.username#' and password = '#arguments.password#'
		</cfquery>
		
		<cfif qVerify.RecordCount >

			<!--- This user has logged in correctly, change the value of the session.allowin value --->
		    <cfset session.allowin = true >
		   	<cfset session.username = arguments.username >
			<cfset session.photo = '#qVerify.photo#'>
			<cfset session.email = '#qVerify.mail#'>
			
			<cfreturn noData().withStatus(200) />
			
		<cfelse>

			<cfreturn noData().withStatus(404) />
		
		</cfif>	

	</cffunction>

</cfcomponent>
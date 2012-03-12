<cfcomponent extends="taffy.core.resource" taffy:uri="/categories/{username}" >

	<cffunction name="get" access="public" output="false">
		<cfargument name="username" type="string" required="true" />

		<cfset var q = ""/>

		<cfquery name ="q" dbtype="query"  >
			select * from application.subscribers 
			where lower(username) = '#lcase(session.username)#' and 
			lower(sub) = '#lcase( arguments.username)#';
		</cfquery>
			<!---- and sub = '#arguments.username#' 	  --->
		<cfif q.recordCount gt 0 >
			<cfreturn representationOf(q).withStatus(200) />
		<cfelse>
			<cfreturn noData().withStatus(404) />
		</cfif>
	</cffunction>
</cfcomponent>

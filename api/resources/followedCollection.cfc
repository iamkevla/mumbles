<cfcomponent extends="taffy.core.resource" taffy_uri="/followed" > <!---taffy_uri="/followed/{username}" --->

	<cffunction name="get" access="public" output="false" >
 	
		<cfquery name ="qry" dbtype="query" >
			select sub from application.subscribers where lower(username) = '#lcase(session.username)#'
		</cfquery>

		<cfreturn representationOf(qry).withStatus(200) />
	</cffunction>

</cfcomponent>
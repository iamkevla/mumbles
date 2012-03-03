<cfcomponent extends="taffy.core.resource" taffy:uri="/categories/{username}" >

	<cffunction name="get" access="public" output="false">
		<cfargument name="username" type="string" required="true" />

		<cfquery name ="q" dbtype="query" >
			select category from application.subscribers where username = '#session.username#' and  sub = '#arguments.username#'
		</cfquery>
		
		<cfif q.recordcount gt 0 >
			<cfreturn representationOf(q).withStatus(200) />
		<cfelse>
			<cfreturn noData().withStatus(404) />
		</cfif>
	</cffunction>
</cfcomponent>

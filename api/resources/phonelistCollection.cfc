<cfcomponent extends="taffy.core.resource" taffy_uri="/phonelist">

	<cffunction name="get" access="public" output="false" >

		<cfquery name="qry" dbtype="query">
			select username, mobile from application.users order by username; 
		</cfquery>

		<cfreturn representationOf(qry).withStatus(200) />
	</cffunction>

</cfcomponent>
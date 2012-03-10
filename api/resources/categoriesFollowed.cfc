<cfcomponent extends="taffy.core.resource" taffy:uri="/categories/{username}" >

	<cffunction name="get" access="public" output="false">
		<cfargument name="username" type="string" required="true" />

		<cfset var q = ""/>
		<cfset var col = "" />
		<cfset var rtn = StructNew() />

		<cfquery name ="q" dbtype="query"  >
			select * from application.subscribers where  1 = 1
			and lower(sub) = '<cfqueryPARAM value = "#lcase(session.username)#">';
		</cfquery>
			<!---- and sub = '#arguments.username#' 	  --->
		<cfif q.recordCount gt 0 >
			<cfloop list="#q.ColumnList#" index="col">
				<cfset rtn[col] = q[col][1] />
			</cfloop>
			<cfreturn representationOf(q).withStatus(200) />
		<cfelse>
			<cfreturn noData().withStatus(404) />
		</cfif>
	</cffunction>
</cfcomponent>

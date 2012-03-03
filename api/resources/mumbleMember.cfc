<cfcomponent extends="taffy.core.resource" taffy:uri="/mumble/{id}" >

	<cffunction name="get" access="public" output="false">
		<cfargument name="id" type="numeric" required="true" />
		<cfset var q = ""/>
		<cfset var col = "" />
		<cfset var rtn = StructNew() />

		<!--- use query object instead for demo --->
		<cfquery name="q" dbtype="query" >
			select * from  application.q where ID =#arguments.id# ; 	
		</cfquery>

		<cfif q.recordCount gt 0>
			<cfloop list="#q.ColumnList#" index="col">
				<cfset rtn[col] = q[col][1] />
			</cfloop>
			<cfreturn representationOf(rtn).withStatus(200) />
		<cfelse>
			<cfreturn noData().withStatus(404) />
		</cfif>
	</cffunction>

	<cffunction name="put" access="public" output="false">
		<cfargument name="id" type="numeric" required="true" />
		<cfargument name="mumble" required="yes" type="string" >
		<cfargument name="Category" required="yes" type="string"  >
		
		<cfscript>
			querySetCell( application.q, "mumble", "#arguments.mumble#", #arguments.id#);
			querySetCell( application.q, "category", "#arguments.category#", #arguments.id#);
		</cfscript>

		<cfreturn noData().withStatus(200) />

	</cffunction>

	
	<cffunction name="post" access="public" output="false">
		<cfargument name="id" type="numeric" required="true" />
		<cfargument name="mumble" 	type="string" required="true" />
		<cfargument name="username"	type="string" required="true" />
		<cfargument name="photo"	type="string" required="true" />

		<cfscript>
			var next = application.q.recordcount + 1;

 			queryAddRow( application.q, 1);

		 	querySetCell( application.q, "ID", next , next);
		    querySetCell( application.q, "mumble", "#arguments.mumble#", next);
		    querySetCell( application.q, "category", "Reply", next);
		    querySetCell( application.q, "usercreated", "#arguments.username#", next);
		    querySetCell( application.q, "photo", "#arguments.photo#", next);
		    querySetCell( application.q, "dateCreated", "#now()#", next);
		</cfscript>

		
		<cfreturn noData().withStatus(200) />
	</cffunction>

</cfcomponent>
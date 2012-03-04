<cfcomponent extends="taffy.core.resource" taffy_uri="/followers" > <!---taffy_uri="/followers/{username}" --->

	<cffunction name="get" access="public" output="false" >

		<cfquery name ="qry" dbtype="query" >
			select username from application.subscribers where sub = '#session.username#'
		</cfquery>

		<cfreturn representationOf(qry).withStatus(200) />
	</cffunction>
	
	<cffunction name="post" access="public" output="false" >
		<cfargument name="followUser" required="yes" type="string"  />
 		<cfargument name="categoryList" type="string" required="no" default="" />
	
		<cfset var q = "" />
		
		<cfscript>
			var next = application.subscribers.recordcount + 1;

 			queryAddRow( application.subscribers, 1);

		 	querySetCell( application.subscribers, "username", "#arguments.followUser#" , next);
		    querySetCell( application.subscribers, "sub", "#session.username#" , next);
		    querySetCell( application.subscribers, "category", "#arguments.categoryList#", next);
		</cfscript>
		
		<cfreturn representationOf(next).withStatus(200) />
	</cffunction>

</cfcomponent>
<cfcomponent extends="taffy.core.resource" taffy_uri="/mumbles" >

	<cffunction name="get" access="public" output="false" >
		<cfargument name="username" required="no" type="any" default="krackas" />
		
		<cfset var qry = "" />

		<!--- use query object instead for demo --->
		<cfquery name="qry" dbtype="query" >
			select * from  application.q order by datecreated desc; 	
		</cfquery>
	

		<cfif qry.recordCount gt 0>
			<cfreturn representationOf(qry).withStatus(200) />
		<cfelse>
			<cfreturn noData().withStatus(404) />
		</cfif>

	</cffunction>

	<cffunction name="post" access="public" output="false">
		<cfargument name="mumble" 	type="string" required="false" default="test" />
		<cfargument name="category" type="string" required="false" default="General" />
		<cfargument name="latitude" type="string" required="false" default="0" />
		<cfargument name="longitude" type="string" required="false" default="0" />
		<cfargument name="username" type="string" required="false" default="krackas" />
		<cfargument name="photo"	type="string"  required="false"  default="images\ninja.jpg" />

		<cfscript>
			var next = application.q.recordcount + 1;

 			queryAddRow( application.q, 1);

		 	querySetCell( application.q, "ID", next , next);
		    querySetCell( application.q, "mumble", "#arguments.mumble#", next);
		    querySetCell( application.q, "usercreated", "#arguments.username#", next);
		    querySetCell( application.q, "photo", "#arguments.photo#", next);
		    querySetCell( application.q, "dateCreated", "#now()#", next);
		    querySetCell( application.q, "category", "#arguments.category#", next);
		</cfscript>

		
		<cfreturn noData().withStatus(200) />
	</cffunction>

</cfcomponent>
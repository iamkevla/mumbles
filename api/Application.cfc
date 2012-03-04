<cfcomponent extends="taffy.core.api" >

	
	<cfscript>
		this.name = 'mumbles'; //hash(getCurrentTemplatePath());

		this.Sessionmanagement = TRUE;

		// do your onApplicationStart stuff here
		function applicationStartEvent(){

			//for purposes of demo create query objects but this should be a database
			if( !isdefined('application.q')){
			    application.q = queryNew("ID, mumble, usercreated, photo, dateCreated, category, mumbleID");
			    queryAddRow(application.q, 3);
			 
			 	querySetCell(application.q, "ID", "1", 1);
			    querySetCell(application.q, "mumble", "This demo uses Coldfusion, Jquery Mobile and RESTful WebServices by configureTaffy...", 1);
			    querySetCell(application.q, "usercreated", "krackas", 1);
			    querySetCell(application.q, "photo", "images/ninja.jpg", 1);
			    querySetCell(application.q, "dateCreated", "2012-02-23 8:00:56", 1);
			    querySetCell(application.q, "category", "GENERAL", 1);
			 
				querySetCell(application.q, "ID", "2", 2);		 
			  	querySetCell(application.q, "mumble", "Blah Blah blah...", 2);
			 	querySetCell(application.q, "usercreated", "bo_peep", 2);
				querySetCell(application.q, "photo", "images/sheep.jpg", 2);
				querySetCell(application.q, "dateCreated", "2012-02-23 7:00:56", 2);	
				querySetCell(application.q, "category", "QUERY", 2);	 

				querySetCell(application.q, "ID", "3", 3);
			 	querySetCell(application.q, "mumble", "hope you like it...", 3);
				querySetCell(application.q, "usercreated", "krackas", 3);
				querySetCell(application.q, "photo", "images/ninja.jpg", 3);
				querySetCell(application.q, "dateCreated", "2012-02-23 2:00:56", 3);
				querySetCell(application.q, "category", "RELEASE", 3);
			}	


				//for purposes of demo create query object --->
			if( !isdefined('application.users')){
			    application.users = queryNew("username, password, mobile, mail, photo");
			    queryAddRow(application.users, 3);
				 
				querySetCell(application.users, "username", "krackas", 1);
			    querySetCell(application.users, "password", "letmein", 1);
			    querySetCell(application.users,	"mobile", "'041311XXXX'", 1);
			    querySetCell(application.users,	"mail", "email@gmail.com", 1);
			    querySetCell(application.users,	"photo", "images/ninja.jpg", 1);

			 	querySetCell(application.users, "username", "bo_peep", 2);
			    querySetCell(application.users, "password", "open", 2);
			    querySetCell(application.users,	"mobile", "'0413788XXXX'", 2);
			    querySetCell(application.users,	"mail", "email@gmail.com", 2);
			    querySetCell(application.users,	"photo", "images/sheep.jpg", 2);

			    querySetCell(application.users, "username", "big_bird", 3);
			    querySetCell(application.users, "password", "sesame", 3);
			    querySetCell(application.users,	"mobile", "'04136XXXX'", 3);
			    querySetCell(application.users,	"mail", "email@gmail.com", 3);
			    querySetCell(application.users,	"photo", "images/default.jpg", 3);
			}    

		   if( !isdefined('application.subscribers')){

			   	application.subscribers = queryNew("username, sub, category");
			    queryAddRow(application.subscribers, 2);
				 
				querySetCell(application.subscribers, "username", "krackas", 1);
				querySetCell(application.subscribers, "sub", "bo_peep", 1);
				querySetCell(application.subscribers, "category", "GENERAL,CHECKIN,RELEASE", 1);

			 	querySetCell(application.subscribers, "username", "bo_peep", 2);
			    querySetCell(application.subscribers, "sub", "big_bird", 2);
			    querySetCell(application.subscribers, "category", "GENERAL", 2);
			   }
	

		}

		// do your onRequestStart stuff here
		function requestStartEvent(){}

		// this function is called after the request has been parsed and all request details are known
		function onTaffyRequest(verb, cfc, requestArguments, mimeExt){
			// this would be a good place for you to check API key validity and other non-resource-specific validation
			return true;
		}

		// called when taffy is initializing or when a reload is requested
		function configureTaffy(){
			setDebugKey("debug");
			setReloadKey("reload");
			setReloadPassword("true");

			// Usage of this function is entirely optional. You may omit it if you want to use the default representation class.
			// Change this to a custom class to change the default for the entire API instead of overriding for every individual response.
			setDefaultRepresentationClass("taffy.core.genericRepresentation");
			
			//these are both the default settings, but the functions are used here to illustrate how and where you should use them
			registerMimeType("json", "application/json");
			setDefaultMime("json");
		}
	</cfscript>
</cfcomponent>

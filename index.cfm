<cfinclude template="includes/header.cfm">
	<!--- main page which contains mumble timeline --->
	<div data-role="page" data-theme="b" id="viewMumbles" data-title="View Mumbles" >
		<div data-role="header" data-position="fixed" data-nobackbtn="true"  >
			<a href="#phonelist" data-transition="flip" data-role="button" data-theme="b" data-icon="grid" >M2 #</a>
			<h1><cfoutput>#session.username#</cfoutput></h1>
			<a href="#compose" data-transition="slidedown" data-role="button" data-icon="plus" data-theme="b" >Add</a>
		</div> <!--- /header --->
		<div data-role="content" id="content" ></div> 
		<cfinclude template="includes/pagefooter.cfm" >
	</div> <!--- page --->
	
	<!--- page used to add new mumbles --->
	<div data-role="page" data-theme="b" id="compose" class="ui-body-b" >
		<div data-role="header" data-position="fixed" >
			<h1>Compose</h1>
		</div> <!--- /header --->
		<div data-role="content" >
			<form>
				<input type="hidden" id="username" value="<cfoutput>#session.username#</cfoutput>" />
				<input type="hidden" id="photo" value="<cfoutput>#session.photo#</cfoutput>" />
				<div data-role="fieldcontain">
					<label for-"Category" >Category</label>
					<select id="category" >
						<option selected value="General" >General</option>
						<option value="Release" >Release</option>
						<option value="Check-in">Check-In</option>
					</select>
				</div>
				<div data-role="fieldcontain">
					<textarea id="txtmumble" cols="30" rows="22" ></textarea>
				</div>
				
				<button id="composeSubmit" type="submit" data-theme="b"  >mumble</button>
					
				 <div>
        			LAT:<input type="text" id="lat_field" READONLY />
        			LONG:<input type="text" id="long_field" READONLY />
      			</div>
			</form>
		</div>
		<cfinclude template="includes/pagefooter.cfm" >
	</div> <!--- /page --->
		
	<!--- this page provides a directory of numbers --->	
	<div data-role="page" data-theme="b" id="phonelist" data-add-back-btn="true"   >
		<div data-role="header" data-position="fixed"   >
			<h1><cfoutput>Phone List</cfoutput></h1>
		</div> <!--- /header --->
		<div data-role="content" id="phonelistContent" ></div> 
		<cfinclude template="includes/pagefooter.cfm" >
	</div> <!--- page --->
		
	<!--- Start of viewProfile --->
	<div data-role="page" data-theme="b" id="viewProfile" >
		<div data-role="header" data-position="fixed" >
			<h1>Profile</h1>
		</div> <!--- /header --->
		<div data-role="content">
			<cfoutput>
				<h3>@#session.username#</h3>
				<img src="#session.photo#" height="36" width="36">
				<p class="ui-li-aside"  >#session.email#</p>
			</cfoutput>
			<div data-role="collapsible" data-collapsed="true" id="allFollowers" ></div>
			<div data-role="collapsible" data-collapsed="true" id="allFollowed"></div>
		</div><!--- /content --->	
		<cfinclude template="includes/pagefooter.cfm" >
	</div><!--- /page --->
	
	<!--- Page 2 of Profile --->
	<div data-role="page" data-theme="b" id="viewProfile1" >
		<div data-role="header" data-position="fixed" >
			<h1>Profile</h1>
		</div> <!--- /header --->
		<div data-role="content">	
			<div id="geo"><cfinclude template="includes/geo.cfm" /></div>
		</div><!--- /content --->
		<cfinclude template="includes/pagefooter.cfm" >
	</div><!--- /page --->
		
	<!--- page used to search of users to follow --->
	<div data-role="page" data-theme="b" id="searchUsers" >
		<div data-role="header" data-position="fixed" data-nobackbtn="true"  >
			<h1>Mumblers</h1>
		</div>
		<div data-role="content" class="ui-content" role="main" id="SearchUsersContent" ></div>
		<cfinclude template="includes/pagefooter.cfm" >
	</div> <!--- page --->

<cfinclude template="includes/footer.cfm" >
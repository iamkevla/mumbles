<cfif isdefined('url.mumbleID') >
	<cfinclude template="includes/header.cfm">
	
	<input type="hidden" id="mumbleID" name="mumbleID" value="<cfoutput>#url.mumbleID#</cfoutput>" >
		
	<div data-role="page" data-theme="b" id="view" >
		<div data-role="header" data-position="fixed" data-nobackbtn="true" id="viewHeader" >
			<a href="#edit" data-transition="slidedown" data-role="button" data-icon="gear" data-theme="b" >Edit</a>
			<h1>View Mumble</h1>
			<a href="#reply" data-transition="slidedown" data-role="button" data-icon="gear" data-theme="b" >Reply</a>
		</div> <!--- /header --->
		
		<div data-role="content" id="viewContent"></div> 
		
		<cfinclude template="includes/pagefooter_ext.cfm" >
	</div> <!--- /page --->
	
	<div data-role="page" data-theme="b" id="edit" >
		<div data-role="header" data-position="fixed" data-nobackbtn="true"  >
			<h1>Edit</h1>
			<a href="#view" data-transition="slidedown" data-role="button" data-icon="gear" data-theme="b" >Cancel</a>
		</div> <!--- /header --->
		
		<div data-role="content">

			<form method="post" >
				<input type="hidden" id="editmumbleID" name="mumbleID" value="<cfoutput>#url.mumbleID#</cfoutput>" >
				<div data-role="fieldcontain">
					<label for="editcategory" >Category</label>
					<select id="editcategory" name="category">
						<option value="GENERAL" >General</option>
						<option value="RELEASE" >Release</option>
						<option value="CHECKIN" >Check-in</option>
					</select>
				</div>
				<div data-role="fieldcontain">
					<textarea id="editmumble" name="txtmumble" cols="30" rows="22" ></textarea>
				</div>
				
				<input id="editSubmit" type="submit" value="update" data-theme="b"  />
			</form>		
		</div> <!--- /content --->
		
		<cfinclude template="includes/pagefooter_ext.cfm" >
	</div> <!--- page --->
	
	<div data-role="page" data-theme="b" id="reply" >
		<div data-role="header" data-position="fixed" data-nobackbtn="true"  >
			<h1>Reply</h1>
			<a href="#view" data-transition="slidedown" data-role="button" data-icon="gear" data-theme="b" >Cancel</a>
		</div> <!--- /header --->
		
		<div data-role="content">
			<form>
				<input id="replymumbleID" type="hidden" value="<cfoutput>#url.mumbleID#</cfoutput>" >
				<input id="username" type="hidden" value="<cfoutput>#session.username#</cfoutput>" >
				<input id="photo" type="hidden" value="<cfoutput>#session.photo#</cfoutput>" >
				<div data-role="fieldcontain">
					<textarea id="replymumble" name="txtmumble" cols="30" rows="22" ></textarea>
				</div>
				
				<input id="replySubmit" type="submit" value="reply" data-theme="b"  />
			</form>	
		</div> <!--- /content --->
		
		<cfinclude template="includes/pagefooter.cfm" >
	</div> <!--- page --->

	<cfinclude template="includes/footer.cfm" >
	<script src="scripts/mumble.js" ></script> 	
<cfelse>
	<cflocation url="/mumbles/" addtoken="no" >
</cfif>
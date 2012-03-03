<cfinclude template="includes/header.cfm">
	<!-- Start of first page -->
	<div data-role="page" data-theme="b" id="viewUser" >
		<div data-role="header" data-position="fixed" >
			<h1>User</h1>
		</div>
		<div data-role="content">	
			<h4><cfoutput>#url.user#</cfoutput></h4>
			
			<form>
				<input id="user" name="user" type="hidden" value="<cfoutput>#url.user#</cfoutput>" >
				
				<div data-role="fieldcontain">
					<fieldset data-role="controlgroup">
						<legend>Categories :</legend>
						
						<input type="checkbox" id="GENERAL"  />
						<label for="GENERAL" >General</label>
						<input type="checkbox" id="RELEASE"  />
						<label for="RELEASE" >Release</label>
						<input type="checkbox" id="CHECKIN"  />
						<label for="CHECKIN" >Check-in</label>
					</fieldset>
				</div>
				
				<button data-theme="b" type="submit" id="followSubmit" >Save</button>
				<h4 id="notification"></h4>	
			</form>

		</div><!--- /content --->
		<cfinclude template="includes/pagefooter_ext.cfm" >
	</div><!--- /page --->
<cfinclude template="includes/footer.cfm" >
<script src="scripts/mumble.js" ></script> 
<cfset session.allowin = "false" >
<cfinclude template="includes/header.cfm">
	<div data-role="page" data-theme="b" >
		<div data-role="header" data-position="fixed" data-nobackbtn="true" >
			<h1><cfoutput>Login</cfoutput></h1>
		</div> <!--- /header --->
		<div data-role="content">
			<fieldset>
				<form>
					<div data-role="fieldcontain">
						<label for="username"  >Username:</label>
						<input id="username" type="text"  value="" />
					</div>
					<div data-role="fieldcontain">
					
						<label for="password" >Password:</label> 
						<input id="password" type="password" value="" />
					</div> 
					<input type="submit" value="Enter" id="submitLogin" data-theme="b"  >
				</form>
			</fieldset>
		</div> <!--- /content --->
	</div> <!--- /page --->
<cfinclude template="includes/footer.cfm" >
<script>
		$("#submitLogin").click(function(){
		$.post(  "./api/index.cfm/users",
				{  username: $("#username").val(), password: $("#password").val() } ,
				function(data){
					window.location = "/mumbles/";	
				}
			).error(function() { alert('Failed Verification'); });
		return false;
		}); 
</script>	

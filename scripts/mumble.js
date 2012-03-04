

	$("#viewMumbles").live('pageshow', function (event) {
		$.getJSON( "./api/index.cfm/mumbles", function(data) { 						   
			$('#content').empty().append('<ul data-role="listview" data-theme="b" data-dividertheme="b" ></ul>');
			listItems = $('#content').find('ul');
			listItems.append('<li data-role="list-divider" >stream</li>');
			$.each(data.DATA, function(i,item){
					var html = '<img src="./'+item[3]+'"/>';
					html += '<div class="ui-btn-text" >';
					html += '<a href="viewMumble.cfm?mumbleID='+item[0]+'" rel="external" >';
					html += '<p class="ui-li-aside" >'+item[4]+'</p>';
					html += '<h5>@'+ item[2]+'</h5>';
					html += '<p><strong>'+item[5]+'</strong></p>';
					html += '<p style="white-space:pre-wrap;"  >'+item[1]+'</p>'; 
					html += '</a></div>'; 
					listItems.append('<li role="option" data-theme="b"  >'+html+'</li>');			
			});
			$('#content ul').listview();
		});  
	});		
		
	$("#view").live('pageshow', function (event) {
		var url = "./api/index.cfm/mumble/"+$("#mumbleID").val();								  
		$.getJSON( url, function(data) { 
			var html = '<div class="ui-grid-b">';
			html += '<div class="ui-block-a"><img src="'+data.PHOTO+'" height="36" width="36" ></div>';
			html += '<div class="ui-block-b"><h3 align="right" >@'+data.USERCREATED+'</h3></div>';
			html += '</div>';
			html += '<div><p style="white-space:pre-wrap;" >'+data.MUMBLE+'</p></div>';
			$('#viewContent').empty().append(html);
			$('#view').page();
		});  	
	});		

	$("#edit").live('pageshow', function (event) {
		var url = "./api/index.cfm/mumble/"+$("#mumbleID").val();								  
		$.getJSON( url, function(data) { 
			$('#editcategory').val(data.CATEGORY);
			$('#editmumble').val(data.MUMBLE);
			$('#editcategory').selectmenu('refresh', true);
		});  

		$("#editSubmit").click(function(){
		$.ajax({	url:  "./api/index.cfm/mumble/" + $("#editmumbleID").val(),
					type: 'PUT',
					data: {	mumble: $("#editmumble").val(), 
				   			category: $("#editcategory").val() }

			}).success(function(){$.mobile.changePage("/mumbles/",{transition:"pop", reloadPage: true, changeHash: true });});
			return false;
		}); 	
	});		
	
	$("#phonelist").live('pageshow', function (event) {
		$.getJSON( "./api/index.cfm/phonelist", function(data) { 						   
			$('#phonelistContent').empty().append('<ul data-role="listview" data-filter="true"  data-theme="b" data-dividertheme="b"></ul>');
			listItems = $('#phonelistContent').find('ul');
			$.each(data.DATA, function(i,item){
				listItems.append('<li><a href="tel:'+item[1]+'" rel="external" >'+item[0]+'</a></li>');
			});
			$('#phonelistContent ul').listview();
		});  
	});	

	$("#searchUsers").live('pageshow', function (event) {
		$.getJSON( "./api/index.cfm/users", function(data) { 			   
			$('#SearchUsersContent').empty().append('<ul data-role="listview" data-filter="true"  data-theme="b" data-dividertheme="b"></ul>');
			listItems = $('#SearchUsersContent').find('ul');
			$.each(data.DATA, function(i,item){
				listItems.append('<li><a href="viewUser.cfm?user='+item[0]+'" data-transition="slide" rel="external" class="ui-link-inherit">'+item[0]+'</a></li>');	
			});
			$('#SearchUsersContent ul').listview();
		});  
	});	


						   


	$("#viewUser").live('pageshow', function (event) {
		var url = "./api/index.cfm/categories/" + $("#user").val();								  
		$.getJSON( url, function(data) { 
			if (data.CATEGORY != null ) {
  				for (i=0; i < data.CATEGORY.split(',').length;i++){
  					$("#"+data.CATEGORY.split(',')[i].toUpperCase()).attr("checked",true).checkboxradio("refresh");
  				}
  			}
		});  

		$("#followSubmit").click(function(){
			//take checkbox and convert into list
			var categoryList = ($("#GENERAL").attr('checked')) ? "GENERAL" : "";
			categoryList += ($("#RELEASE").attr('checked')) ? ",RELEASE" : ""; 
			categoryList += ($("#CHECKIN").attr('checked')) ? ",CHECKIN" : "";

			//exec webservice to followUser
			$.post( "./api/index.cfm/followers", { 
				followUser: $("#user").val(), 
				categoryList: categoryList },
				   function(data){
						$.mobile.changePage("/mumbles/",{transition:"pop", reloadPage: true, changeHash: true });	
				   });
			return false;		
		}); 

	});		
	

	
	$("#replySubmit").click(function(){
		$.post(  "./api/index.cfm/mumble/"+ $("#replymumbleID").val(),
			{  mumble: $("#replymumble").val(),
				username: $("#username").val(),
				 photo: $("#photo").val() },
			   function(data){
					$.mobile.changePage("/mumbles/",{transition:"pop", reloadPage: true, changeHash: true });	
			   }				   
		);
		return false;
	}); 


	
	$('#compose').live('pageshow', function (event, ui) {
		$("textarea").text = '';									 
		$("textarea").focus();
		navigator.geolocation.getCurrentPosition(
			function(pos) {
				$("#lat_field").val(pos.coords.latitude);
				$("#long_field").val(pos.coords.longitude);
			}
		);
		
		$("#composeSubmit").click(function(){
			$.post(  "./api/index.cfm/mumbles",
					{  mumble: $("#txtmumble").val(), 
					   category: $("#category").val(), 
					   latitude: $("#lat_field").val(),
					   longitude: $("#long_field").val(),
					   username: $("#username").val(), 
					   photo: $("#photo").val() },
					   function(data) {
							$.mobile.changePage("/mumbles/",{transition:"pop", reloadPage: true, changeHash: true });	
					   } //function				   
			); //post
			return false;
		}); 
	});
	
	$('#viewProfile').live('pagebeforecreate', function (event, ui) {
		var url = '';										 
		url = "./api/index.cfm/followers"; // + $("#username").val();		
		$.getJSON( url, function(data) { 							   
			$('#allFollowers').empty().append('<h3>Following ('+data.DATA.length+')</h3><ul data-role="listview" data-inset="true" data-theme="b" ></ul>');
			listItems = $('#allFollowers').find('ul');
			$.each(data.DATA, function(i,item){
				listItems.append('<li role="option" ><a href="viewUser.cfm?user='+item[0]+'" data-transition="slide" class="ui-link-inherit">'+item[0]+'</a></li>');
			});
			$('#allFollowers ul').listview();
		});  		
		
		url = "./api/index.cfm/followed";	
		$.getJSON( url, function(data) { 								   
			$('#allFollowed').empty().append('<h3>Followed ('+data.DATA.length+')</h3><ul data-role="listview" data-inset="true" data-theme="b" >');
			listItems = $('#allFollowed').find('ul');
			$.each(data.DATA, function(i,item){
				listItems.append('<li role="option" ><a href="viewUser.cfm?user='+item[0]+'" data-transition="slide" class="ui-link-inherit">'+item[0]+'</a></li>');
			});
			$('#allFollowed ul').listview();
		});  	

		$('#viewProfile').live('swipeleft' ,function(event){
			$.mobile.changePage("#viewProfile1",{transition:"slide", reloadPage: false, changeHash: true });
			event.preventDefault();
		});

	});

	$('#viewProfile1').live('pagebeforecreate', function (event, ui) {
		$('#viewProfile1').live('swiperight' ,function(event){
			$.mobile.changePage("#viewProfile",{transition:"slide", reloadPage: false, changeHash: true });
			event.preventDefault();
		});
	});

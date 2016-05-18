addEventListener('load',function(e){
	console.log('login.js loaded');
})


var submitButton = document.getElementById("submitButton");


submitButton.addEventListener('click',function(e){
	e.preventDefault();
	var username = "";
	var email = "";
	var password = "";
	var userInput = document.getElementById("user").value;
	var userPassword = document.getElementById("password").value;
	console.log(userInput);
	console.log(userPassword);
	if(userInput.indexOf('\@') > -1){
		email = userInput;
	}else{
		username = userInput;
	}
	
	//make user object from form data to login
	var userObject = {
		userName:username,
		email:email,
		password:userPassword
	};
	
	//stringify the object
	var userJSON = JSON.stringify(userObject);
	
	
	var xhr = new XMLHttpRequest();

	
	xhr.open('POST','../rest/signIn');
	xhr.setRequestHeader('Content-type','application/json');
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4 && xhr.status < 400){
			console.log("login complete")
			console.log(xhr.responseText);
			var loggedInUser = JSON.parse(xhr.responseText);
			console.log("LOGGED IN USER " + loggedInUser);
		//maybe remove some stuff here then	
		}
	}
	
	xhr.send(userJSON);
	
});
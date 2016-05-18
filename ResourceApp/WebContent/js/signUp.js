addEventListener('load',function(e){
	console.log('signUp.js loaded');
})

var signUpButton = document.getElementById("signUpButton");

signUpButton.addEventListener('click',function(e){
	e.preventDefault();
	console.log('sign up clicked');
	var userName = document.getElementById("userName").value;
	var firstName = document.getElementById("firstName").value;
	var lastName = document.getElementById("lastName").value;
	var email = document.getElementById("email").value;
	var password = document.getElementById("password").value;
	
	var newUser = {
			userName:userName,
			firstName:firstName,
			lastName:lastName,
			email:email,
			password:password
	}
	var newUserJSON = JSON.stringify(newUser);
	
	console.log("new user: " + newUser.userName);
	
	var xhr = new XMLHttpRequest();
	
	xhr.open('POST','../rest/signUp');
	xhr.setRequestHeader('Content-type','application/json');
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4 && xhr.status < 400){
			//response test stuff
			console.log('Sign up (at least the controller part for now) worked');
		}
	}
	
	xhr.send(newUserJSON);
	
	
});






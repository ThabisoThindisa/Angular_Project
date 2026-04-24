import { Component, OnInit } from '@angular/core';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-sign-up',
  standalone: true,
  imports: [RouterLink, FormsModule],
  templateUrl: './SignUp.component.html',
  styleUrl: './SignUp.component.css'
})
export class SignUpComponent implements OnInit {

  constructor(private UserRequest: HttpClient) {}
  ngOnInit(): void {}

  userInput: any = { // Object to hold user input
    _name: '',
    _Lastname: '',
    _email: '',
    _password: '',
    _CornfirmPassword: ''
  };  
 
  loginUser: any = {  // Variable to hold the logged-in user
    U_name: '',
    U_Lastname: '',
    U_email: '',
    U_password: '',
  };
  
   textAreaValue: string = ''; // Variable to hold the value of the textarea

   //Check if the password and confirm password match.
   checkPassword(): boolean {
      
    if ( this.userInput._password == this.userInput._CornfirmPassword) {
      return true; // User is logged in
    } else {
      return false; // User is not logged in
    }

   }

    //Function to handle the sign-up process
  signUp() : void {
   // this.textAreaValue = ''; // Clear the textarea value before processing the sign-up 

    //If the password validation is successful, 
    if (this.checkPassword()) {

      //Store the user input 
      this.loginUser.U_name = this.userInput._name;
      this.loginUser.U_Lastname = this.userInput._Lastname;
      this.loginUser.U_email = this.userInput._email;
      this.loginUser.U_password = this.userInput._password;
      
      //this.textAreaValue = 'Sending POST request to backend with data: ' + JSON.stringify(this.loginUser); // Debug
          
      this.UserRequest.post('http://localhost:3000/api/signup', this.loginUser).subscribe({
        next: (response) => {
          console.log('Sign up successful', response);
          this.textAreaValue = 'Sign up successful! Welcome, ' + this.loginUser.U_name + ' ' + this.loginUser.U_Lastname + '.';
          window.location.href = '/home'; // Redirect to the login page after successful sign-up
          // Handle success
        },
        error: (error) => {

          this.textAreaValue = error.error.message || 'Sign up failed. Please try again.';
          // Handle error
          }
      });
    }else{
      console.log("Sign up failed due to password mismatch");
       this.textAreaValue = ' no match between password and confirm password. Please try again.';
    }
  }

}
import { Routes } from '@angular/router';
import { HomePage } from './HomePage/HomePage.component';
import { SignUpComponent } from './SignUp/SignUp.component';

export const routes: Routes = [
  { path: '', component: SignUpComponent },
  { path: 'home', component: HomePage }
];

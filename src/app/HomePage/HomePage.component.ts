import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'Home-Page',
    imports: [RouterOutlet],         
  templateUrl: './HomePage.component.html',
   styleUrl: './HomePage.component.css'
})
export class HomePage {
  protected readonly title = signal('HomePage');
}
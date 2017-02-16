import { NgModule } from '@angular/core';
import { BrowserModule }  from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { HomeModule } from './home/home.module'
import { routing, appRoutingProviders }  from './app.routing';

@NgModule({
    imports: [
        BrowserModule,
        HomeModule,
        routing
    ],
    declarations: [
        AppComponent
    ],
    providers: [
        appRoutingProviders
    ],
    bootstrap: [AppComponent]
})
export class AppModule {
}

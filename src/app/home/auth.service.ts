import { Injectable }     from '@angular/core';
import { Http, Response } from '@angular/http';
import { Observable }     from 'rxjs/Observable';
import { environment } from '../environment';

import 'rxjs/Rx';

@Injectable()
export class AuthService {
    constructor(private http:Http) {
    }

    auth(code:string):Observable<{t:string}> {
        return this.http
            .get(`${environment.protocol}://${environment.base}/auth?code=${code}`)
            .map((response) => response.json() as {t:string})
            .catch(this.handleError);
    }

    private handleError(error:any) {
        let errMsg = (error.message) ? error.message :
            error.status ? `${error.status} - ${error.statusText}` : 'Server error';
        return Observable.throw(errMsg);
    }
}

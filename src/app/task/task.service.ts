import { Injectable }     from '@angular/core';
import { Http, Response } from '@angular/http';
import { Observable }     from 'rxjs/Observable';
import { Task } from './task.model';
import { environment } from '../environment';

import 'rxjs/Rx';

@Injectable()
export class TaskService {
    constructor(private http:Http) {
    }

    list(token:string):Observable<{tasks:Task[], token:string}> {
        return this.http
            .get(`${environment.protocol}://${environment.base}/list-quest?t=${token}`)
            .map((response:Response) => {

                return {
                    tasks: response.json().quests.map((data => new Task(
                        data.quest_id,
                        data.description,
                        data.link,
                        data.title))),
                    token: response.json().t
                };
            })
            .catch(this.handleError);
    }

    private handleError(error:any) {
        let errMsg = (error.message) ? error.message :
            error.status ? `${error.status} - ${error.statusText}` : 'Server error';
        return Observable.throw(errMsg);
    }
}

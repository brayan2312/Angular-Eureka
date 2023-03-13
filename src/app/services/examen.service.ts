import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommonService } from './common.service';
import { Examen } from '../models/examen';

@Injectable({
  providedIn: 'root'
})
export class ExamenService extends CommonService<Examen>{
  protected override  baseEndPoint = 'http://localhost:8090/api/examenes';

  constructor(http: HttpClient) {
    super(http);
   }
}

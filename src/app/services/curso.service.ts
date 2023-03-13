import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommonService } from './common.service';
import { Curso } from '../models/curso';

@Injectable({
  providedIn: 'root'
})
export class CursoService extends CommonService<Curso>{

  protected override  baseEndPoint = 'http://localhost:8090/api/cursos';

  constructor(http: HttpClient) {
    super(http);
   }
}

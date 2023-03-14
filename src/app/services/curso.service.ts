import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommonService } from './common.service';
import { Curso } from '../models/curso';
import { BASE_ENDPOINT } from '../config/app';

@Injectable({
  providedIn: 'root'
})
export class CursoService extends CommonService<Curso>{

  protected override  baseEndPoint = BASE_ENDPOINT+ '/cursos';

  constructor(http: HttpClient) {
    super(http);
   }
}

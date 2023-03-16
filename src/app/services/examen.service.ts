import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommonService } from './common.service';
import { Examen } from '../models/examen';
import { BASE_ENDPOINT } from '../config/app';
import { Observable } from 'rxjs';
import { Asignatura } from '../models/asignatura';

@Injectable({
  providedIn: 'root'
})
export class ExamenService extends CommonService<Examen>{
  4
  protected override  baseEndPoint = BASE_ENDPOINT+'/examenes';

  constructor(http: HttpClient) {
    super(http);
   }

   public finalAllAsignaturas(): Observable<Asignatura[]>{
    return this.http.get<Asignatura[]>(`${this.baseEndPoint}/asignaturas`);
   }

   public filtrarPorNombre(nombre: string): Observable<Examen[]>{
    return this.http.get<Examen[]>(`${this.baseEndPoint}/filtrar/${nombre}`);
   }
}

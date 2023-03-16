import { Injectable } from '@angular/core';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { BASE_ENDPOINT } from '../config/app';
import { Respuesta } from '../models/respuesta';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class RespuestaService  {

  protected   baseEndPoint = BASE_ENDPOINT + '/respuestas';

  private cabeceras: HttpHeaders = new HttpHeaders({ 'Content-Type': 'application/json' });

  constructor(private http: HttpClient) {}

  crear(respuestas: Respuesta[]) : Observable<Respuesta[]> {
    return this.http.post<Respuesta[]>(this.baseEndPoint, respuestas, { headers: this.cabeceras });
  }

}

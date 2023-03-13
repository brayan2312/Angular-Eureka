import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Alumno } from '../models/alumno';
import { CommonService } from './common.service';

@Injectable({
  providedIn: 'root'
})

export class AlumnoService extends CommonService<Alumno> {

  protected override  baseEndPoint = 'http://localhost:8090/api/alumnos';

  constructor(http: HttpClient) {
    super(http);
   }
/*
  private cabezera: HttpHeaders = new HttpHeaders({'Content-Type': 'application/json' });

  constructor(private http: HttpClient) { }

  public listar(): Observable<Alumno[]> {
    return this.http.get<Alumno[]>(this.baseEndPoint);

  }
  public listarPaginas(page: string, size: string): Observable<any> {
    const params = new HttpParams()
    .set('page', page)
    .set('size', size);
    return this.http.get<any>(`${this.baseEndPoint}/pagina`, { params })
  }

  public ver(id:number):Observable<Alumno> {
    return this.http.get<Alumno>(`${this.baseEndPoint}/${id}`);
  }

  public crear(alumno:Alumno): Observable<Alumno>{
    return this.http.post<Alumno>(this.baseEndPoint, alumno,
      { headers : this.cabezera });
  }

  public editar(alumno:Alumno): Observable<Alumno>{
    return this.http.put<Alumno>(`${this.baseEndPoint}/${alumno.id}`, alumno ,
      { headers : this.cabezera });
  }

  public eliminar(id: number): Observable<void>{
    return this.http.delete<void>(`${this.baseEndPoint}/${id}`, { headers : this.cabezera });

  }*/
}

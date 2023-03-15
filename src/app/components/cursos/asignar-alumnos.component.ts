import { Component, OnInit, ViewChild } from '@angular/core';
import { Curso } from '../../models/curso';
import { ActivatedRoute } from '@angular/router';
import { AlumnoService } from '../../services/alumno.service';
import { CursoService } from '../../services/curso.service';
import { Alumno } from '../../models/alumno';
import { SelectionModel } from '@angular/cdk/collections';
import Swal from 'sweetalert2';
import { MatTableDataSource } from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';

@Component({
  selector: 'app-asignar-alumnos',
  templateUrl: './asignar-alumnos.component.html',
  styleUrls: ['./asignar-alumnos.component.css']
})
export class AsignarAlumnosComponent
implements OnInit {

  curso: Curso;
  alumnosAsignar: Alumno[] = [];
  alumnos: Alumno[] = [];

  datasource: MatTableDataSource<Alumno>;
  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  pageSizeOptions: number[] = [3,5,10,20,50];


  tabIndex:number = 0;

  mostrarColumnas: string[] = ['nombre', 'apellido', 'seleccion'];
  mostrarColumnasAlumnos: string[] = ['id','nombre', 'apellido', 'email', 'eliminar'];
  seleccion: SelectionModel<Alumno> = new SelectionModel<Alumno>(true, []);


  constructor(private route: ActivatedRoute,
    private cursoService: CursoService,
    private serviceAlumnos: AlumnoService) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      const id: number = +params.get('id');
      this.cursoService.ver(id).subscribe(curso =>{
        this.curso =  curso;
        this.alumnos = curso.alumnos;
        this.iniciarPaginador();

      });
    });
  }

  iniciarPaginador() : void {
    this.datasource = new MatTableDataSource<Alumno>(this.alumnos);
    this.datasource.paginator =  this.paginator;
    this.paginator._intl.itemsPerPageLabel = 'Registrar Por página';
  }

  filtrar(nombre: string): void {
    nombre =  nombre !== undefined ? nombre.trim() : '';
    if(nombre !== ''){
      this.serviceAlumnos.filtrarPorNombre(nombre)
      .subscribe(alumnos => this.alumnosAsignar = alumnos.filter(a => {
        let filtrar = true;
        this.alumnos.forEach(ca => {
          if(a.id === ca.id){
            filtrar = false;
          }
        });
        return filtrar;
      }));
    }
  }

  estanTodosSeleccionados(): boolean {
    const seleccionados = this.seleccion.selected.length;
    const numAlumnos = this.alumnosAsignar.length;
    return (seleccionados === numAlumnos);
  }

  seleccionarDesSeleccionarTodos(): void {
    this.estanTodosSeleccionados() ?
    this.seleccion.clear() :
    this.alumnosAsignar.forEach(a => this.seleccion.select(a));
  }
  asignar(): void {
    this.cursoService.asignarAlumnos(this.curso, this.seleccion.selected)
    .subscribe(c => {
      console.log(c);
      this.tabIndex = 2;
      Swal.fire(
        'Asignados',
        'Alumnos asignados con éxitp al curoso: ' + this.curso.nombre,
         'success'
      );
      this.alumnos = this.alumnos.concat(this.seleccion.selected);
      this.iniciarPaginador();
      this.alumnosAsignar = [];
      this.seleccion.clear();
    },
    e => {
      if(e.status === 500){
        const mensaje = e.error.message as string;
        if(mensaje.indexOf('ConstraintViolationException') > -1 ){
          Swal.fire(
            'Cuidado',
            'No se puede asignar al alumno ya está asociado a otro curso',
            'error'
          );

        }
      }
       //ConstraintViolationException
    })
  }

  eliminarAlumno(alumno: Alumno): void {

    Swal.fire({
      title: 'Cuidado',
      text: `¿Seguro que desea eliminar a ${alumno.nombre} ?`,
      icon: 'warning',
      showCloseButton: true,
      showCancelButton: true,
      focusConfirm: false,
      confirmButtonText: 'Si, eliminar!',
      cancelButtonText: 'Cancelar',
    }).then((result) => {
      if(result.value){
        // ********************************************************************
        this.cursoService.eliminarAlumno(this.curso, alumno)
        .subscribe(curso => {
          this.alumnos =  this.alumnos.filter(a =>  a.id != alumno.id);
          this.iniciarPaginador();
          Swal.fire(
            'Eliminado',
            `Alumno ${alumno.nombre} eliminado con éxito del curso ${curso.nombre}`,
            'success'
          );
        });
        // ********************************************************************
      }
    });

  }
}

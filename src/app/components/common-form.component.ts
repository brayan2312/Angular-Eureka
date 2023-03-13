import { OnInit, Directive } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import Swal from 'sweetalert2';
import { Generic } from '../models/generic';
import { CommonService } from '../services/common.service';

@Directive()
export abstract class CommonFormComponent<E extends Generic,
S extends CommonService<E>> implements OnInit {

  titulo: string;
  model: E;
  error: any;
  protected redirect: string;
  protected nombreModel: string;


  constructor(protected service: S,
              protected router: Router,
              protected route: ActivatedRoute) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      const id: number = +params.get('id')!;
      if(id){
        this.service.ver(id).subscribe(m => this.model = m);
      }
    })
  }

  crear(): void {
    this.service.crear(this.model).subscribe(m => {
      Swal.fire('Nuevo:',`${this.nombreModel} ${m.nombre} creado con exito`, 'success');
      this.router.navigate([this.redirect]);
    }, err => {
      if(err.status === 400){
        this.error = err.error;
        console.log(this.error);

      }
    });
  }

  editar(): void {
    this.service.crear(this.model).subscribe(m => {
      Swal.fire('Editado',`${this.nombreModel} ${m.nombre} editado con exito`, 'success');
      this.router.navigate([this.redirect]);
    }, err => {
      if(err.status === 400){
        this.error = err.error;
        console.log(this.error);

      }
    });
  }


}

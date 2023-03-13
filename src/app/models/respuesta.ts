import { Pregunta } from './pregunta';
import { Alumno } from './alumno';

export class Respuesta {
  id: string;
  texto: string;
  alumno: Alumno;
  pregunta: Pregunta;
}

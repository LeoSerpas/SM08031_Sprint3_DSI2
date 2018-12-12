<div class="row">
   <div class="col-sm-2">
      {!! form::label('Asignacion') !!}
   </div>
   <div class="col-sm-10">
      <div class="form-group">
         <i>
            <select name="id_asignacion" class="form-control">
               <option selected value="{{$asignacionAlumnoNota->asignaciones->id}}">{{$asignacionAlumnoNota->asignaciones->id}}. {{$asignacionAlumnoNota->asignaciones->Docentes->User->name}} - {{$asignacionAlumnoNota->asignaciones->grados->nombre}} {{$asignacionAlumnoNota->asignaciones->grados->seccion}}</option>
               @foreach($asignaciones as $asignacion)
               <option value="{{$asignacion->id}}">{{$asignacion->id}}. {{$asignacion->docentes->User->name}} - {{$asignacion->grados->nombre}} {{$asignacion->grados->seccion}}</option>
               @endforeach
            </select>
         </i>
      </div>
   </div>
</div>
<div class="row">
   <div class="col-sm-2">
      {!! form::label('Alumno') !!}
   </div>
   <div class="col-sm-10">
      <div class="form-group">
         <i>
            <select name="id_alumno" class="form-control">
               <option selected value="{{$asignacionAlumnoNota->alumno->id}}">{{$asignacionAlumnoNota->alumno->id}}. {{$asignacionAlumnoNota->alumno->nombres}} {{$asignacionAlumnoNota->alumno->apellidos}}</option>
               @foreach($alumnos as $alumno)
               <option value="{{$alumno->id}}">{{$alumno->id}}. {{$alumno->nombres}} {{$alumno->apellidos}}</option>
               @endforeach
            </select>
         </i>
      </div>
   </div>
</div>
<div class="row">
   <div class="col-sm-2">
      {!! form::label('Año') !!}
   </div>
   <div class="col-sm-5">
      <?php $Y= date("Y");
         $Y2=$Y+'1';
         // echo $Y2; 
         ?>
      <div class="form-group">
         <i>
            <select name="anio" class="form-control">
               <option selected value="{{$asignacionAlumnoNota->anio}}">{{$asignacionAlumnoNota->anio}}</option>
               <option value="<?php echo date("Y");?>"><?php echo date("Y");?></option>
               <!-- <option value="<?php echo $Y2;?>"><?php echo $Y2;?></option> ?-->
            </select>
         </i>
      </div>
   </div>
</div>
<br>
<div class="form-group text-center" >
   {{ Form::button(isset($model)? 'Update' : 'Guardar' , ['class'=>'btn btn-success btn-lg','type'=>'submit']) }}
   <a class="btn btn-danger btn-lg" href="{{ route('asignacionAlumnosNotas.index') }}">Cancelar</a>
</div>
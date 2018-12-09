@extends('layouts.app')
@section('content')
<div class="row">
   <div class="col-md-6 col-md-offset-3">
      <h2 style="text-align:center"> Ingreso de Asignacion Alumno Docente-Grado </h2>
      <br>
      {{ Form::open(['route'=>'asignacionAlumnosNotas.store', 'method'=>'POST']) }}
      <div class="row">
         <div class="col-sm-3">
            {!! form::label('Docente - Grado') !!}
         </div>
         <div class="col-sm-9">
            <div class="form-group">
               <i>
                  <select name="id_asignacion" class="form-control">
                     @foreach($asignaciones as $asignacion)
                     <option value="{{$asignacion->id}}">{{$asignacion->id}}. {{$asignacion->docentes->User->name}} - {{$asignacion->grados->nombre}} {{$asignacion->grados->seccion}}</option>
                     @endforeach
                  </select>
               </i>
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-sm-3">
            {!! form::label('Nombre del Alumno') !!}
         </div>
         <div class="col-sm-9">
            <div class="form-group">
               <i>
                  <select name="id_alumno" class="form-control">
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
	   <div class="col-sm-10">
	      <?php $Y= date("Y");
	         $Y2=$Y+'1';
	         // echo $Y2; 
	         ?>
	      <div class="form-group">
	         <i>
	            <select name="anio" class="form-control">
	               <option selected value="<?php echo date("Y");?>"><?php echo date("Y");?></option>
	               <option value="<?php echo $Y2;?>"><?php echo $Y2;?></option>
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
   {{ form::close() }}
</div>
</div>
@endsection
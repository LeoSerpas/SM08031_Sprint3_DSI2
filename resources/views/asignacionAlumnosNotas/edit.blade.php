@extends('layouts.app')
@section('content')
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
    	<h2 style="text-align:center"> ACTUALIZACION DE ASIGNACION ALUMNO, GRADO Y NOTA </h2>
    	<br>
      {{ Form::model($asignacionAlumnoNota,['route'=>['asignacionAlumnosNotas.update',$asignacionAlumnoNota->id],'method'=>'PATCH']) }}
      @include('asignacionAlumnosNotas.form_master')
      {{ Form::close() }}
    </div>
  </div>
@endsection
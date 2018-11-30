@extends('layouts.app')
@section('content')
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
    	<h2 style="text-align:center"> ASIGNACION DE ALUMNO, GRADO Y NOTA</h2>
    	<br>
      {{ Form::open(['route'=>'asignacionAlumnosNotas.store', 'method'=>'POST']) }}
        @include('asignacionAlumnosNotas.form_master')
      {{ form::close() }}
    </div>
  </div>
@endsection
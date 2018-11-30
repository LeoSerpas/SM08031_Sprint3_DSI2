@extends('layouts.app')
@section('content')
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
    	<h2> Actualización de Datos: </h2>
    	<br>
      {{ Form::model($alumno,['route'=>['alumnos.update',$alumno->id],'method'=>'PATCH']) }}
      @include('alumnos.form_master')
      {{ Form::close() }}
    </div>
  </div>
@endsection
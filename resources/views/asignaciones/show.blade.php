@extends('layouts.app')
@section('content')
<div class="row"  >
    <div class="col-lg-12 margin-tb">
        <div class="pull-left ">
            <h2 > DATOS DE LA ASIGNACION</h2>
            <br>
        </div>
    </div>
</div>
<div class="row">

    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Docente : </strong>
            {{ $asignacion->Docentes->User->name}}
        </div>
    </div>

    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Grado : </strong>
            {{ $asignacion->Grados->nombre}} {{ $asignacion->Grados->seccion}}
        </div>
    </div>
  
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Año : </strong>
            {{ $asignacion->anio}}
        </div>
    </div>

            <br/>
            <a class="btn btn-primary" href="{{ route('asignaciones.index') }}"> <i class="glyphicon glyphicon-arrow-left"> Regresar</i></a>
    </div>

@endsection

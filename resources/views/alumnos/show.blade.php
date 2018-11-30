@extends('layouts.app')
@section('content')
<div class="row" >
    <div class="col-lg-12 margin-tb">
        <div class="pull-left ">
            <h2 > Datos del Alumno</h2>
            <br>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Nombres : </strong>
            {{ $alumno->nombres}}
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Apellidos : </strong>
            {{ $alumno->apellidos}}
        </div>
    </div>
        
     <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Número de NIE: </strong>
            {{ $alumno->no_nie}}
        </div>
    </div>
     
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Fecha de Nacimiento: </strong>
            {{ $alumno->f_nacimiento}}
        </div>
    </div>
        <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            
            <strong>Edad: </strong>
            <?php
    $cumpleanos = new DateTime($alumno->f_nacimiento);
    $hoy = new DateTime();
    $annos = $hoy->diff($cumpleanos);
    echo $annos->y;
    ?>
        </div>
    </div>

    </div>
            <br/>
            <a class="btn btn-primary" href="{{ route('alumnos.index') }}"> <i class="glyphicon glyphicon-arrow-left"> Regresar</i></a>
    </div>

@endsection

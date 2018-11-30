@extends('layouts.app')

@section('content')
    <h3>MENU <small><i>Seleccione según Gestion</i></small></h3>
        <nav class="navbar navbar-static-top navbar-inverse" >
            <div class="container">
                <div class="navbar-header">
                    <!-- Branding Image -->
                    <ul class="nav navbar-nav">
                    <li><a href="{{ route('secretarias.index') }}"><b>Secretaria /</b></a></li>
                    <li><a href="{{ route('docentes.index') }}"><b>Docentes /</b></a></li>
                    <li><a href="{{ route('alumnos.index') }}"><b> Estudiantes /</b></a></li>
                    <li><a href="{{ route('grados.index') }}"><b>Grados / </b></a></li>
                    <li><a href="{{ route('materias.index') }}"><b>Materias / </b></a></li>
                    <li><a href="{{ route('notas.index') }}"><b>Notas / </b></a></li>
                    <li><a href="{{ route('asignaciones.index') }}"><b>Asignacion materias, grados y docentes</b></a></li>
                    <li><a href="{{ route('asignacionAlumnosNotas.index') }}"><b>Asignacion alumno y notas</b></a></li>
                    <li><a href="{{ route('asignacionNotas.index') }}"><b>Asignacion Materia a Notas</b></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <br>
            <div class="content">
                    <h3>BIENVENIDO / A <small> al Sistema de Gestión Escolar del Centro Escolar Católico Santo Tomás</small></h3>
                </div>
                <div class="text-center">
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <img src="{{URL::asset('/img/logo.png')}}" alt="profile Pic" height="100" width="100">
                    <h4><i>"Instruye al niño en el camino que debe andar, y aun cuando sea viejo no se apartará de él"</i><br> <small>Proverbios 22,6</small></h4>
                </div>
            </div>

@endsection


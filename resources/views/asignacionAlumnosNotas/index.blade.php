@extends ('layouts.app')
@section('content')
<div class="row">
   <div class ="col-sm-12">
      <div class="full.right">
         <h2>Gestionar la Asignacion Alumno Docente-Grado</h2>
         <br>
      </div>
   </div>
</div>
@if ($message = Session::get('success')) 
<div class="alert alert-success">
   <p>{{ $message }}</p>
</div>
@endif
<div>
   <a href="{{route('asignacionAlumnosNotas.create')}}" class="btn btn-success btn-lg">
   <i class="glyphicon glyphicon-plus"> NUEVO</i>
   </a>
   <a href="{{ url('/gestion') }}" class="btn btn-primary btn-lg">
   <i class="glyphicon glyphicon-arrow-left"> CANCELAR</i>
   </a>
   {!! Form::open(['route'=>'asignacionAlumnosNotas.index', 'method'=>'GET', 'class'=>'navbar-form pull-right', 'role'=>'search'])!!}
   <div class="input-group"> 
      {!! Form::text('nombre', null, ['class'=>'form-control', 'placeholder'=>'Buscar'])!!}
   </div>
   <button type="submit" class="glyphicon glyphicon-search btn-sm" data-toggle="tooltip" data-placement="top" title="Buscar"></button>
   {!! Form::close()!!}
   <br><br>
   <h4>Seleccione la pestaña adecuada para gestionar las asignaciones de alumnos.</h4>
</div>
<br>
<div class="container">
   <ul class="nav nav-tabs">
      <li class="active"><a data-toggle="tab" href="#home">Mis Asigns. Alumnos</a></li>
      <li><a data-toggle="tab" href="#menu1">Todas las Asigns.</a></li>
   </ul>
   <div class="tab-content">
      <div id="home" class="tab-pane fade in active">
         <div>
            <div class="tab-content">
               <div class="table-responsive " name="id_docente">
                  <table class="table table-striped" style="text-align:center" >
                     <thead>
                        <tr>
                           <th with="80px">No</th>
                           <th style="text-align:center">Alumno</th>
                           <th style="text-align:center">Docente</th>
                           <th style="text-align:center">Grado</th>
                           <th style="text-align:center">Año</th>
                           <th style="text-align:center">Acciones</th>
                        </tr>
                     </thead>
                     <tbody>
                        @foreach ($asignacion_alumnos as $key => $asignacion_alumno)
                        <tr>
                           <td>
                              {{ $key+1 }}
                           </td>
                           <td>
                              {{ $asignacion_alumno->alumno->nombres .' '. $asignacion_alumno->alumno->apellidos  }}
                           </td>
                           <td>
                              {{ $asignacion_alumno->asignaciones->docentes->User->name  }}
                           </td>
                           <td>
                              {{ $asignacion_alumno->asignaciones->Grados->nombre }} {{ $asignacion_alumno->asignaciones->Grados->seccion }}
                           </td>
                           <td>
                              {{ $asignacion_alumno->anio }} 
                           </td>
                           <td>
                              <a class="btn btn-info btn-lg" data-toggle="tooltip" data-placement="top" title="Detalles" 
                                 href="{{route('asignacionAlumnosNotas.show',$asignacion_alumno->id)}}">
                              <i class="glyphicon glyphicon-list-alt"></i></a>
                              <a class="btn btn-primary btn-lg" data-toggle="tooltip" data-placement="top" title="Editar" 
                                 href="{{route('asignacionAlumnosNotas.edit',$asignacion_alumno->id)}}">
                              <i class="glyphicon glyphicon-pencil"></i></a>
                           </td>
                        </tr>
                        @endforeach
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
      </div>
      <div id="menu1" class="tab-pane fade">
         <table class="table table-striped" style="text-align:center" >
            <tr>
               <th with="80px">No</th>
               <th style="text-align:center">Alumno</th>
               <th style="text-align:center">Grado</th>
               <th style="text-align:center">Docente</th>
               <th style="text-align:center">Año</th>
               <th style="text-align:center">Acciones</th>
            </tr>
            <?php $no=1; ?>
            @foreach ($asignacionAlumnosNotas as $key => $value)
            <tr>
               <td>{{$no++}}</td>
               <td>{{ $value->Alumnos->nombres }} {{ $value->Alumnos->apellidos }}<br></td>
               <td>{{$value->Asignaciones->Grados->nombre }} {{ $value->Asignaciones->Grados->seccion }}</td>
               <td>{{$value->Asignaciones->Docentes->User->name }}</td>
               <td>{{ $value->anio }}<br></td>
               <td>
                  <a class="btn btn-info btn-lg" data-toggle="tooltip" data-placement="top" title="Detalles" href="{{route('asignacionAlumnosNotas.show',$value->id)}}">
                  <i class="glyphicon glyphicon-list-alt"></i></a>
                  <a class="btn btn-primary btn-lg" data-toggle="tooltip" data-placement="top" title="Editar" href="{{route('asignacionAlumnosNotas.edit',$value->id)}}">
                  <i class="glyphicon glyphicon-pencil"></i></a>
                  {!! Form::open(['method' => 'DELETE','route' => ['asignacionAlumnosNotas.destroy', $value->id],'style'=>'display:inline']) !!}
                  <button type="submit" data-toggle="tooltip" data-placement="top" title="Eliminar" style="display: inline;" class="btn btn-danger btn-lg" onclick="return confirm('¿Esta seguro de eliminar este Registro?')"><i class="glyphicon glyphicon-trash" ></i></button>
                  {!! Form::close() !!}<br>
               </td>
            </tr>
            @endforeach
         </table>
      </div>
   </div>
   {!!$asignacionAlumnosNotas->render()!!}
   <div class="text-center">
   <a href="{{ url('/gestion') }}" class="btn btn-primary btn-lg">
   <i class="glyphicon glyphicon-arrow-left"> CANCELAR</i>
   </a>
   </div>
</div>
@endsection
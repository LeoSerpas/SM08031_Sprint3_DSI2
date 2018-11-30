@extends ('layouts.app')
@section('content')
  <div class="row">
    <div class ="col-sm-12">
      <div class="full.right">
      <h2>GESTION DE ASIGNACION</h2>
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
        {!! Form::open(['route'=>'asignacionAlumnosNotas.index', 'method'=>'GET', 'class'=>'navbar-form pull-right', 'role'=>'search'])!!}
        <div class="input-group"> 
            {!! Form::text('nombre', null, ['class'=>'form-control', 'placeholder'=>'Buscar'])!!}
        </div>
         <button type="submit" class="glyphicon glyphicon-search btn-sm" data-toggle="tooltip" data-placement="top" title="Buscar"></button>
        {!! Form::close()!!}
      </div>
      <br>


 <div>

    <div class="tab-content">
      @foreach ($docentes as $id => $docente)
          <div class="table-responsive " name="id_docente" value="{{ $id }}">
    
            <table class="table table-striped" style="text-align:center" >
              <thead>
                <tr>
                  <th with="80px">No</th>
                  <th style="text-align:center">Alumno</th>
                  <th style="text-align:center">Docente</th>
                  <th style="text-align:center">Grado</th>
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
                    <input  required type="hidden" name="notas[asignacion][{{ $key  }}][id_docente]" value="{{ $docente->id }}">
                    <input  required type="hidden" name="notas[asignacion][{{ $key  }}][id_docente]" value="{{ $id }}">
                    @php ($alumnos_de_grado = $asignacion_alumno->AsignacionNotas->where('id_docente', $id )->first())
                    {{ $asignacion_alumno->alumno->nombres .' '. $asignacion_alumno->alumno->apellidos  }}
                  </td>
                  <td>
                    {{ $asignacion_alumno->asignaciones->docentes->User->name  }}
                  </td>
                  <td>
                    {{ $asignacion_alumno->asignaciones->Grados->nombre }} {{ $asignacion_alumno->asignaciones->Grados->seccion }}
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
      @endforeach
    </div>
</div>



  <table class="table table-striped" style="text-align:center" >
    <tr>
      <th with="80px">No</th>
      <th style="text-align:center">Docente</th>
      <th style="text-align:center">Grado</th>
      <th style="text-align:center">Alumno</th>
      <th style="text-align:center">Acciones</th>
    </tr>
    <?php $no=1; ?>
    @foreach ($asignacionAlumnosNotas as $key => $value)
    <tr>
        <td>{{$no++}}</td>
        <td>{{$value->Asignaciones->Docentes->User->name }}</td>
        <td>{{$value->Asignaciones->Grados->nombre }} {{ $value->Asignaciones->Grados->seccion }}</td>
        <td>{{ $value->Alumnos->nombres }} {{ $value->Alumnos->apellidos }}<br></td>
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
  {!!$asignacionAlumnosNotas->render()!!}


 <div class="text-center">
    <a class="btn btn-primary" href="{{ url('/gestion') }}">Regresar</a>
  </div>
@endsection
@extends ('layouts.app')
@section('content')
  <div class="row">
    <div class ="col-sm-12">
      <div class="full.right">
      <h2>GESTION DE ASIGNACION DE NOTAS</h2>
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
        <a href="{{route('asignacionNotas.create')}}" class="btn btn-success btn-lg">
            <i class="glyphicon glyphicon-plus"> NUEVO</i>
        </a>
        {!! Form::open(['route'=>'asignacionNotas.index', 'method'=>'GET', 'class'=>'navbar-form pull-right', 'role'=>'search'])!!}
        <div class="input-group"> 
            {!! Form::text('nombre', null, ['class'=>'form-control', 'placeholder'=>'Buscar'])!!}
        </div>
         <button type="submit" class="glyphicon glyphicon-search btn-sm" data-toggle="tooltip" data-placement="top" title="Buscar"></button>
        {!! Form::close()!!}
      </div>
      <br>
  <table class="table table-striped" style="text-align:center" >
    <tr>
      <th with="80px">No</th>
      <th style="text-align:center">Alumnos</th>
      <th style="text-align:center">Materia</th>
      <th style="text-align:center">Trimestre</th>
      <th style="text-align:center">Observacion</th>


    </tr>
    <?php $no=1; print_r ($asignacionnotas);?>

    @foreach ($asignacionnotas as $key => $value)
    <tr>
        <td>{{$no++}}</td>
        <td>{{ $value->AsignacionAlumnosNotas->Alumnos->nombres}}
            {{ $value->AsignacionAlumnosNotas->Alumnos->apellidos}}</td>
        <td>{{ $value->materias->nombre }}</td>
        <td>{{ $value->trimestre }}</td>
        <td>{{ $value->observaciones }}</td>

        <td>
          <a class="btn btn-info btn-lg" data-toggle="tooltip" data-placement="top" title="Detalles" href="{{route('asignacionNotas.show',$value->id)}}">
              <i class="glyphicon glyphicon-list-alt"></i></a>
          <a class="btn btn-primary btn-lg" data-toggle="tooltip" data-placement="top" title="Editar" href="{{route('asignacionNotas.edit',$value->id)}}">
              <i class="glyphicon glyphicon-pencil"></i></a>

            {!! Form::close() !!}<br>
        
        </td>
      </tr>
    @endforeach
  </table>
  {!!$asignacionnotas->render()!!}
 <div class="text-center">
    <a class="btn btn-primary" href="{{ url('/gestion') }}">Regresar</a>
  </div>
@endsection

@extends ('layouts.app')
@section('content')
<div class="row">
  <div class="row">
    <div class ="col-sm-12">
      <div class="full.right">
        <h2>GESTION DE NOTAS
        </h2>
        <br>
      </div>
    </div>
  </div>
  <form class="select_grado">
  <h5>Seleccione la Materia a Ingresar Notas</h5>
  <select name="id_grado" id='id_grado' class="form-control">
    <option disabled selected>Seleccione la materia
    </option>
    @foreach($materias as $asigAlumno)
    <option value="{{$asigAlumno->id}}">{{$asigAlumno->nombre}}
    </option>
    @endforeach
  </select>
<br>
<button class="btn btn-success btn-lg" type="submit" name="button">Ingresar Notas por Materia
</button>
</form>
<br>
<H4>Seleccione una Materia para consultar las Notas de los Alumnos</H4>
<br>
  <div>
    <ul class="nav nav-tabs" role="tablist">
      @php($indice = 0)
      @foreach ($materias as $id => $materia)
      <li role="presentation" class=" {{ $indice === 0 ? 'active' : ''}}"><a href="#materia_{{ $materia->id }}" aria-controls="#materia_{{ $materia->id }}" role="tab" data-toggle="tab">{{ $materia->nombre }}</a></li>
      @php($indice++) 

      @endforeach
    </ul>
    <div class="tab-content">
      @php($indice = 0)
      @foreach ($materias as $id => $materia)
      <div role="tabpanel" class="tab-pane {{ $indice === 0 ? 'active' : ''}}" id="materia_{{ $materia->id }}">
          <div class="table-responsive ">
    
            <table class="table table-striped" id= "{{ $materia->nombre }}" style="text-align:center" >
              <thead>
                <tr>
                  <th with="80px">No
                  </th>
                  <th style="text-align:center">Alumno
                  </th>
                  <th style="text-align:center">Act. Integradora 1
                  </th>
                  <th style="text-align:center">Act. Integradora 2
                  </th>
                  <th style="text-align:center">Promedio
                  </th>
                  <th style="text-align:center">35% Integradora
                  </th>
                  <th style="text-align:center">Act. Cotidiana
                  </th>
                  <th style="text-align:center">35% Cotidiana
                  </th>
                  <th style="text-align:center">Laboratorio
                  </th>
                  <th style="text-align:center">Examen
                  </th>
                  <th style="text-align:center">Promedio
                  </th>
                  <th style="text-align:center">30% Pruebas
                  </th>
                  <th style="text-align:center">Promedio Trimestral
                  </th>
                </tr>
              </thead>
              <tbody>
                @foreach ($asignacion_alumnos as $key => $asignacion_alumno)
                <tr>
                  <td>
                    {{ $key+1 }}
                  </td>
                  <td>
                    <input  required type="hidden" name="notas[asignacion][{{ $key  }}][id_materia]" value="{{ $materia->id }}">
                    <input  required type="hidden" name="notas[asignacion][{{ $key  }}][id_materia]" value="{{ $id }}">
                    @php ($notasAsignada = $asignacion_alumno->AsignacionNotas->where('id_materia', $materia->id )->first())
                    {{ $asignacion_alumno->alumno->nombres .' '. $asignacion_alumno->alumno->apellidos  }}
                  </td>
                  <td>
                    {{ is_null($notasAsignada) ? '0' : $notasAsignada->ActividadIntegradora->first()->activi_1  }}
                  </td>
                  <td>
                    {{ is_null($notasAsignada) ? '0' : $notasAsignada->ActividadIntegradora->first()->activi_2  }}
                  </td>
                  <td>
                   {{ is_null($notasAsignada) ? '0' : $notasAsignada->ActividadIntegradora->first()->promedio_i }}
                  </td>
                  <td>
                   {{ is_null($notasAsignada) ? '0' : $notasAsignada->ActividadIntegradora->first()->prom_i_porcent  }}
                  </td>
                  <td>
                    {{ is_null($notasAsignada) ? '0' : $notasAsignada->ActividadCotidiana->first()->nota_cotidiana  }}
                  </td>
                  <td>
                    {{ is_null($notasAsignada) ? '0' : $notasAsignada->ActividadCotidiana->first()->nota_porcent  }}
                  </td>
                  <td>
                    {{ is_null($notasAsignada) ? '0' : $notasAsignada->Prueba->first()->laboratorio }}
                  </td>
                  <td>
                    {{ is_null($notasAsignada) ? '0' : $notasAsignada->Prueba->first()->examen }}
                  </td>
                  <td>
                    {{ is_null($notasAsignada) ? '0' : $notasAsignada->Prueba->first()->promedio_p }}
                  </td>
                  <td>
                    {{ is_null($notasAsignada) ? '0' : $notasAsignada->Prueba->first()->prom_p_porcent }}
                  </td>
                  <td>
                    {{ is_null($notasAsignada) ? '0' : $notasAsignada->nota_trimestral }}
                  </td>

                </tr>
                @endforeach
              </tbody>
          </table>
        </div>
      </div> 
      @php($indice++) 

      @endforeach
    </div>
</div>
</div>
@if ($message = Session::get('success'))
<div class="alert alert-success">
  <p>{{ $message }}
  </p>
</div>
@endif
<div class="text-center">
  <a class="btn btn-primary" href="{{ url('/gestion') }}">Regresar
  </a>
</div>
<script >
  $('.select_grado').submit(function( event ) {
    event.preventDefault();
    if ($("#id_grado" ).val() !== null) {
      window.location.href = "/notas/grado/"+$("#id_grado" ).val();
    }
  }
                           )
</script>
<script type="text/javascript">
  $('#{{ $materia->nombre }} a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
</script>
@endsection
​

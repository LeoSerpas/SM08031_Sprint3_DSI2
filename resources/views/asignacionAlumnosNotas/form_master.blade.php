      <div class="row">
    <div class="col-sm-2">
      {!! form::label('Asignacion') !!}
    </div>
     <div class="col-sm-10">
      <div class="form-group">
      <i><select name="id_asignacion" class="form-control">
                <option disabled selected>Seleccione docente, grado y materia</option>
                @foreach($asignaciones as $asignacion)
                      <option value="{{$asignacion->id}}">{{$asignacion->id}}. {{$asignacion->docentes->User->name}} - {{$asignacion->grados->nombre}} {{$asignacion->grados->seccion}}</option>
                 @endforeach
            </select></i>  
  </div>
</div>
 </div>

   <div class="row">
    <div class="col-sm-2">
      {!! form::label('Alumno') !!}
    </div>
     <div class="col-sm-10">
      <div class="form-group">
      <i><select name="id_alumno" class="form-control">
                <option disabled selected>Seleccione Alumno</option>
                @foreach($alumnos as $alumno)
                      <option value="{{$alumno->id}}">{{$alumno->id}}. {{$alumno->nombres}} {{$alumno->apellidos}}</option>
                 @endforeach
            </select></i>  
  </div>
</div>
 </div>

  

    <br>
       <div class="form-group text-center" >
      {{ Form::button(isset($model)? 'Update' : 'Guardar' , ['class'=>'btn btn-success btn-lg','type'=>'submit']) }}
      <a class="btn btn-danger btn-lg" href="{{ route('asignacionAlumnosNotas.index') }}">Cancelar</a>
    </div>
 
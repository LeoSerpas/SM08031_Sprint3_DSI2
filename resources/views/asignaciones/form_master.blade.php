      <div class="row">
    <div class="col-sm-2">
      {!! form::label('Docente') !!}
    </div>
     <div class="col-sm-10">
      <div class="form-group {{ $errors->has('id_docente') ? 'has-error' : "" }}">
      <i><select name="id_docente" class="form-control">
                <option disabled selected>Seleccione docente</option>
                @foreach($docentes as $docente)
                      <option value="{{$docente->id}}">{{$docente->id}}. {{$docente->user->name}}</option>
                 @endforeach
            </select></i> 
            <div class="help-block"> 
                <strong>{{ $errors->first('id_docente', 'Seleccione uno') }}</strong>
          </div> 
  </div>
</div>
 </div>

   <div class="row">
    <div class="col-sm-2">
      {!! form::label('Grado') !!}
    </div>
     <div class="col-sm-10">
      <div class="form-group {{ $errors->has('id_grado') ? 'has-error' : "" }}">
      <i><select name="id_grado" class="form-control">
                <option disabled selected>Seleccione grado</option>
                @foreach($grados as $grado)
                      <option value="{{$grado->id}}">{{$grado->id}}. {{$grado->nombre}} {{$grado->seccion}}</option>
                 @endforeach
            </select></i>  
            <div class="help-block"> 
                <strong>{{ $errors->first('id_grado', 'Seleccione uno') }}</strong>
          </div> 
  </div>
</div>
 </div>

 <div class="row">
    <div class="col-sm-2">
      {!! form::label('anio','Año') !!}
    </div>
    <div class="col-sm-4">
      <div class="form-group {{ $errors->has('anio') ? 'has-error' : "" }}">
       <i>{{ Form::text('anio',NULL, ['class'=>'form-control', 'id'=>'anio', 'placeholder'=>'20xx','maxlength' => 4]) }} </i> 
        <div class="help-block"> 
          <strong>{{ $errors->first('anio', '**Ingrese un año correctamente') }}</strong>
      </div>
    </div>
  </div>
      </div>

    <br>
       <div class="form-group text-center" >
      {{ Form::button(isset($model)? 'Update' : 'Guardar' , ['class'=>'btn btn-success btn-lg','type'=>'submit']) }}
      <a class="btn btn-danger btn-lg" href="{{ route('asignaciones.index') }}">Cancelar</a>
    </div>
 
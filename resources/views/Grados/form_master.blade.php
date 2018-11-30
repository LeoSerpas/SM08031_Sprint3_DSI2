 <div class="row">
    <div class="col-sm-2">
      {!! form::label('nombre','Grado') !!}
    </div>

    <div class="col-sm-10">
    <div class="form-group {{ $errors->has('nombre') ? 'has-error' : "" }}">
      
            <select name="nombre" class="form-control">
                <option value="" disabled selected>Seleccione uno</option>
                <option>Kinder</option>
                <option>Preparatoria</option>
                <option>Primero</option>
                <option>Segundo</option>
                <option>Tercero</option>
                <option>Cuarto</option>
                <option>Quinto</option>
                <option>Sexto</option>
                <option>Séptimo</option>
                <option>Octavo</option>
                <option>Noveno</option>
            </select>
           
            <div class="help-block" >
               <strong>{{ $errors->first('nombre', 'Obligatorio') }}</strong> 
           </div>
        </div>
    </div>
  </div>

   <div class="row">
    <div class="col-sm-2">
      {!! form::label('seccion','Sección') !!}
    </div>
    <div class="col-sm-4">
         <div class="form-group {{ $errors->has('seccion') ? 'has-error' : "" }}">
           <select name="seccion" id="seccion" class="form-control" >
                <option value="" disabled selected>Seleccione uno</option>
                <option>A</option>
                <option>B</option>
            </select>
            <div class="help-block" >
        <strong>{{ $errors->first('seccion', 'Obligatorio') }}</strong> 
      </div>
        </div>
   </div>
  </div>

  <div class="row">
    <div class="col-sm-2">
      {!! form::label('capacidad','Capacidad') !!}
    </div>
    <div class="col-sm-10">
      <div class="form-group {{ $errors->has('capacidad') ? 'has-error' : "" }}">
        <i>{{ Form::text('capacidad',NULL, ['class'=>'form-control', 'id'=>'capacidad', 'placeholder'=>'Capacidad del grado...']) }}</i>
        <div class="help-block" >
        <strong>{{ $errors->first('Capacidad', '**Ingrese datos válidos A-Z') }}</strong> 
      </div>
      </div>
    </div>
    </div>

    <div class="form-group text-center">
      {{ Form::button(isset($model)? 'Update' : 'Guardar' , ['class'=>'btn btn-success btn-lg','type'=>'submit']) }}
      <a class="btn btn-danger btn-lg" href="{{ route('grados.index') }}">Cancelar</a>
    </div>
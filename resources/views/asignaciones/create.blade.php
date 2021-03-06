@extends('layouts.app')
@section('content')
<div class="row">
   <div class="col-md-6 col-md-offset-3">
      <h2 style="text-align:center"> Ingreso de Asignacion Docente-Grado</h2>
      <br>
      {{ Form::open(['route'=>'asignaciones.store', 'method'=>'POST']) }}
      <div class="row">
         <div class="col-sm-2">
            {!! form::label('Docente') !!}
         </div>
         <div class="col-sm-10">
            <div class="form-group {{ $errors->has('id_docente') ? 'has-error' : "" }}">
            <i>
               <select name="id_docente" class="form-control">
                  <option disabled selected>Seleccione docente</option>
                  @foreach($docentes as $docente)
                  <option value="{{$docente->id}}">{{$docente->id}}. {{$docente->user->name}}</option>
                  @endforeach
               </select>
            </i>
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
         <i>
            <select name="id_grado" class="form-control">
               <option disabled selected>Seleccione grado</option>
               @foreach($grados as $grado)
               <option value="{{$grado->id}}">{{$grado->id}}. {{$grado->nombre}} {{$grado->seccion}}</option>
               @endforeach
            </select>
         </i>
         <div class="help-block"> 
            <strong>{{ $errors->first('id_grado', 'Seleccione uno') }}</strong>
         </div>
      </div>
   </div>
</div>
<div class="row">
   <div class="col-sm-2">
      {!! form::label('Año') !!}
   </div>
   <div class="col-sm-10">
      <?php $Y= date("Y");
         $Y2=$Y+'1'; // echo $Y2; 
         ?>
      <div class="form-group">
         <i>
            <select name="anio" class="form-control">
               <option selected value="<?php echo date("Y");?>"><?php echo date("Y");?></option>
               <option value="<?php echo $Y2;?>"><?php echo $Y2;?></option> 
            </select>
         </i>
      </div>
   </div>
</div>
<br>
<div class="form-group text-center" >
   {{ Form::button(isset($model)? 'Update' : 'Guardar' , ['class'=>'btn btn-success','type'=>'submit']) }}
   <a class="btn btn-danger" href="{{ route('asignaciones.index') }}">Cancelar</a>
</div>
{{ form::close() }}
</div>
</div>
@endsection
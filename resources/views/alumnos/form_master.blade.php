   <div class="row">
    <div class="col-sm-2">
      {!! form::label('nombres','Nombres') !!}
    </div>
    <div class="col-sm-10">
      <div class="form-group {{ $errors->has('nombres') ? 'has-error' : "" }}">
       <i>{{ Form::text('nombres',NULL, ['class'=>'form-control', 'id'=>'nombres', 'placeholder'=>'Nombres del alumno...']) }}</i> 
        <div class="help-block" > 
          <strong>{{ $errors->first('nombres', '**Ingrese datos válidos A-Z') }}</strong>
      </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-sm-2">
      {!! form::label('apellidos','Apellidos') !!}
    </div>
    <div class="col-sm-10">
      <div class="form-group {{ $errors->has('apellidos') ? 'has-error' : "" }}">
        <i>{{ Form::text('apellidos',NULL, ['class'=>'form-control', 'id'=>'apellidos', 'placeholder'=>'Apellidos del alumno...']) }}</i>
        <div class="help-block" >
        <strong>{{ $errors->first('apellidos', '**Ingrese datos válidos A-Z') }}</strong> 
      </div>
      </div>
    </div>
    </div>

    <div class="row">
    <div class="col-sm-5">
      {!! form::label('no_nie','Numero de NIE') !!}
    </div>
    <div class="col-sm-5">
      <div class="form-group {{ $errors->has('no_nie') ? 'has-error' : "" }}">
       <i>{{ Form::text('no_nie',NULL, ['class'=>'form-control', 'id'=>'no_nie', 'placeholder'=>'xxxxxxx','maxlength' => 7]) }} </i> 
        <div class="help-block"> 
          <strong>{{ $errors->first('no_nie', '**Ingrese NIE correctamente') }}</strong>
      </div>
    </div>
  </div>
</div>

  <div class="row">
    <div class="col-sm-5">
      {!! form::label('f_nacimiento','Fecha de nacimiento') !!}
    </div>
    <div class="col-sm-5">
      <div class="input-group {{ $errors->has('f_nacimiento') ? 'has-error' : "" }}">
       <i>{{ Form::text('f_nacimiento',NULL, ['class'=>'form-control', 'id'=>'f_nacimiento','type'=>'text', 'placeholder'=>'Fecha(yyyy-mm-dd)']) }} </i>
               <div class="help-block"> 
          <strong>{{ $errors->first('f_nacimiento', '**Ingrese la Fecha correctamente') }}</strong>
      </div>
    </div>
  </div>
      </div>

   <br>
       <div class="form-group text-center" >
      {{ Form::button(isset($model)? 'Update' : 'Guardar' , ['class'=>'btn btn-success btn-lg','type'=>'submit']) }}
      <a class="btn btn-danger btn-lg" href="{{ route('alumnos.index') }}">Cancelar</a>
   </div>
   
<script>
 $.datepicker.regional['es'] = {
 closeText: 'Cerrar',
 prevText: '< Ant',
 nextText: 'Sig >',
 currentText: 'Hoy',
 monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
 monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
 dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
 dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
 dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
 changeMonth: true,
 changeYear: true,
 yearRange: '-30:+0',
 weekHeader: 'Sm',
 dateFormat: 'yy-mm-dd',
 firstDay: 1,
 isRTL: false,
 showMonthAfterYear: false,
 yearSuffix: ''
 };
 $.datepicker.setDefaults($.datepicker.regional['es']);
$(function () {
$("#f_nacimiento").datepicker();
});
</script>
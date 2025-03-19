<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Notas;
use App\ActCotidianas;
use App\ActIntegradoras;
use App\Pruebas;
use App\Conducta;
use App\AsignacionNotas;
use App\Materias;
use App\AsignacionAlumnosNotas;
use App\Asignaciones;
Use App\Alumnos;
Use App\Trimestre;
use notas1\http\Request\NotasRequest;
use App\Conductas;
use App\Docentes;
use App\Grados;
use App\AsignacionConductas;
use Illuminate\Support\Facades\Auth;

class NotasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        
        $materias = Materias::all();
        $trimestres = Trimestre::all();
        $asignacionConductas = AsignacionConductas::all();
        $asignacionNotas=AsignacionNotas::all();
        $trimestral =$request->get('trimestral');
        $notas = AsignacionNotas::orderBy('id','ASC')->trimestral($trimestral)->paginate(10);
        $asignacion_alumnos = Auth::user()->docente->asignacion;

        $asignaDocente=Asignaciones::all();
        $Y= date("Y");
        $asi = Auth::user()->docente;
        $asignacionAl = AsignacionAlumnosNotas::all();
        $docentes= Docentes::all();
        $grados = Grados::all();

        //Para mostrar las asignaciones de alumnos del año Actual del docente logeado
        $asig_docente = $asignaDocente->where('id_docente', $asi->id)->where('anio', $Y )->first();
        if ($asig_docente !== null){
            $asig_alumno = $asignacionAl->where('id_asignacion', $asig_docente->id);
            $grado_actual = $grados->where('id', $asig_docente->id_grado)->first();
        }
        elseif ($asig_docente == null) {
           $asig_alumno = null;
           $grado_actual = null;
        }

        return view('notas.index',compact('notas', 'materias','asignacionNotas','asignaDocente','trimestres', 'asignacionConductas','asi','asignacionAl','grados','asig_alumno', 'asig_docente','grado_actual','Y'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function create()
    {
        $materias = Materias::all();
        $asignaAlumno = AsignacionAlumnosNotas::all();
        return view('notas.create', compact('materias','asignaAlumno'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

        public function store(Request $request)
    {
        $this->validate($request,[

          'nota_trimestral' => '',
          'nota_cotidiana' => '',
          'nota_porcent'=>'',
          'activi_1'=>'',
          'activi_2'=>'',
          'promedio_i'=>'',
          'prom_i_porcent'=>'',
          'laboratorio'=>'',
          'examen'=>'',
          'promedio_p'=>'',
          'prom_p_porcent'=>'',
          'moral_civica'=>'',
          'nota_conducta'=>'',
          'id_materia'=>'',
          'id_trimestre'=>'',
          'id_asignacion_alumno'=>'',
        ]);

        $cotidiana = ActCotidianas::create($request->all());
        $integradora = ActIntegradoras::create($request->all());
        $prueba = Pruebas::create($request->all());
        $conducta = Conducta::create($request->all());

        AsignacionNotas::create([
            'id_integradoras' => $integradora->id,
            'id_cotidianas' => $cotidiana->id,
            'id_pruebas' => $prueba->id,
            'id_conducta' => $conducta->id,
            'id_materia' => $request['id_materia'],
            'id_asignacion_alumno' => $request['id_asignacion_alumno'],
            'nota_trimestral' => $request['nota_trimestral'],
        ]);

        return redirect()->route('notas.index')->with('success','Notas guardado con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $nota = AsignacionNotas::find($id);
        return view('notas.show',compact('nota'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $materias = Materias::all();
        $asignaAlumno = AsignacionAlumnosNotas::all();
        $cotidiana = ActCotidianas::find($id);
        $integradora = ActIntegradoras::find($id);
        $prueba = Pruebas::find($id);
        $conducta = Conducta::find($id);

        $nota = AsignacionNotas::find($id);
       return view('notas.edit',compact('nota','materias','asignaAlumno','integradora','cotidiana','prueba','conducta'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request,[
          'nota_trimestral' => '',
          'nota_cotidiana' => '',
          'nota_porcent'=>'',
          'activi_1'=>'',
          'activi_2'=>'',
          'promedio_i'=>'',
          'prom_i_porcent'=>'',
          'laboratorio'=>'',
          'examen'=>'',
          'promedio_p'=>'',
          'prom_p_porcent'=>'',
          'moral_civica'=>'',
          'nota_conducta'=>'',
          'id_materia'=>'',
          'id_asignacion_alumno'=>'',
        ]);

            AsignacionNotas::find($id)->update([
            'id_materia' => $request['id_materia'],
            'id_asignacion_alumno' => $request['id_asignacion_alumno'],
            'nota_trimestral' => $request['nota_trimestral'],
        ]);
            Conducta::find($id)->update([
            'moral_civica' => $request['moral_civica'],
            'nota_conducta' => $request['nota_conducta'],
        ]);


      return redirect()->route('notas.index')->with('success','Nota actualizado con exito');
    }

    public function notasGrado($id, $trimestre)
    {
      Asignaciones::all();
      $asignacionNota=AsignacionNotas::all();
      $materias = Materias::find($id);
      $trimestres = Trimestre::find($trimestre);
      

      $asignaDocente=Asignaciones::all();
      $Y= date("Y");
      $asi = Auth::user()->docente;
      $asignacionAl = AsignacionAlumnosNotas::all();
      $docentes= Docentes::all();
      $grados = Grados::all();

      //Para mostrar las asignaciones de alumnos del año Actual del docente logeado
      $asig_docente = $asignaDocente->where('id_docente', $asi->id)->where('anio', $Y )->first();
      if ($asig_docente !== null){
          $asig_alumno = $asignacionAl->where('id_asignacion', $asig_docente->id);
          $grado_actual = $grados->where('id', $asig_docente->id_grado)->first();
      }
      elseif ($asig_docente == null) {
         $asig_alumno = null;
         $grado_actual = null;
      }
      return view('notas.por_materia',compact('id','trimestre','trimestres','materias','asignacionNota','asi','asignacionAl','grados','asig_alumno', 'asig_docente','grado_actual','Y'));
    }

    public function bulk(Request $request, $id, $trimestre)
    {
      $notas = $request->get('notas');
      foreach ($notas['asignacion'] as $key => $nota) {
        $inputs = array(
          'nota_trimestral' => $nota['nota_trimestral'],
        );
        $filter = array(
          'id_asignacion_alumno' => $nota['id_asignacion_alumno'],
          'id_materia' => $nota['id_materia'],
          'id_trimestre' => $nota['id_trimestre'],
        );
        $valor = '';
        $valor = AsignacionNotas::updateOrCreate($filter, $inputs);

        print_r($valor->id);
        echo "<br>";
        print_r($valor->id_asignacion_alumno);
        echo "<br>";
        print_r($valor->trimestre);
        echo "<br>";

        $integradora=$notas['integradora'][$key];
        $inputs = array(
          'activi_1' => $integradora['activi_1'],
          'activi_2' => $integradora['activi_2'],
          'promedio_i' => $integradora['promedio_i'],
          'prom_i_porcent' => $integradora['prom_i_porcent'],
        );
        $filter = array(
          'id_asignacion_notas' => $valor->id,
        );
        $valor1 = '';
        $valor1 = ActIntegradoras::updateOrCreate($filter, $inputs);

        $cotidiana=$notas['cotidiana'][$key];
        $inputs = array(
          'nota_cotidiana' => $cotidiana['nota_cotidiana'],
          'nota_porcent' => $cotidiana['nota_porcent'],
        );
        $filter = array(
          'id_asignacion_notas' => $valor->id,
        );
        $valor2 = '';
        $valor2= ActCotidianas::updateOrCreate($filter, $inputs);

        $pruebas=$notas['pruebas'][$key];
        $inputs = array(
          'laboratorio' => $pruebas['laboratorio'],
          'examen' => $pruebas['examen'],
          'promedio_p' => $pruebas['promedio_p'],
          'prom_p_porcent' => $pruebas['prom_p_porcent'],

        );
        $filter = array(
          'id_asignacion_notas' => $valor->id,
        );
        $valor3 = '';
        $valor3= Pruebas::updateOrCreate($filter, $inputs);

      }
      return redirect()->route('notas.index')->with('success','Notas ingresadas con éxito');
    }

      public function notasConducta($trimestre)
    {
      Asignaciones::all();
      $asignacionNota=AsignacionNotas::all();
      $trimestres = Trimestre::find($trimestre);
      
      $conductas= Conductas::all();

      $asignaDocente=Asignaciones::all();
      $Y= date("Y");
      $asi = Auth::user()->docente;
      $asignacionAl = AsignacionAlumnosNotas::all();
      $docentes= Docentes::all();
      $grados = Grados::all();

      //Para mostrar las asignaciones de alumnos del año Actual del docente logeado
      $asig_docente = $asignaDocente->where('id_docente', $asi->id)->where('anio', $Y )->first();
      if ($asig_docente !== null){
          $asig_alumno = $asignacionAl->where('id_asignacion', $asig_docente->id);
          $grado_actual = $grados->where('id', $asig_docente->id_grado)->first();
      }
      elseif ($asig_docente == null) {
         $asig_alumno = null;
         $grado_actual = null;
      }
      
      return view('notas.conductas',compact('trimestre','trimestres','asignacionNota','conductas','asi','asignacionAl','grados','asig_alumno', 'asig_docente','grado_actual','Y'));
    }

        public function cond(Request $request, $trimestre)
    {
      $conductas = $request->get('conductas');
      foreach ($conductas['asignacion'] as $key => $conducta) {

        $filter = array(
          'id_asignacion_alumno' => $conducta['id_asignacion_alumno'],
          'id_trimestre' => $conducta['id_trimestre'],
        );
        $valor = '';
        $valor = AsignacionConductas::updateOrCreate($filter);

        $notas_conducta=$conductas['conductas'][$key];
        $inputs = array(
          'moral_civica' => $notas_conducta['moral_civica'],
          'nota_conducta' => $notas_conducta['nota_conducta'],
          'observaciones' => $notas_conducta['observaciones'],
        );
        $filter = array(
          'id_asignacion_conductas' => $valor->id,
        );
        $valor1 = '';
        $valor1 = Conductas::updateOrCreate($filter, $inputs);
      }
      return redirect()->route('notas.index')->with('success','Notas de Conducta ingresadas con éxito');
    }

    public function apro_repro(Request $request)
    {
      $materias = Materias::all();
      $trimestres = Trimestre::all();
      $asignacionNotas=AsignacionNotas::all();
      $trimestral =$request->get('trimestral');
      $notas = AsignacionNotas::orderBy('id','ASC')->trimestral($trimestral)->paginate(10);

      $asignaDocente=Asignaciones::all();
      $Y= date("Y");
      $asi = Auth::user()->docente;
      $asignacionAl = AsignacionAlumnosNotas::all();
      $docentes= Docentes::all();
      $grados = Grados::all();

      //Para mostrar las asignaciones de alumnos del año Actual del docente logeado
      $asig_docente = $asignaDocente->where('id_docente', $asi->id)->where('anio', $Y )->first();
      if ($asig_docente !== null){
          $asig_alumno = $asignacionAl->where('id_asignacion', $asig_docente->id);
          $grado_actual = $grados->where('id', $asig_docente->id_grado)->first();
      }
      elseif ($asig_docente == null) {
         $asig_alumno = null;
         $grado_actual = null;
      }
      foreach ($materias as $ids => $materia){
        foreach ($asig_alumno as $key => $asignacion_alumno) {
          $notasAsignada1 = $asignacion_alumno->AsignacionNotas->where('id_materia', $materia->id )->where('id_trimestre', 1 )->first();
          $notasAsignada2 = $asignacion_alumno->AsignacionNotas->where('id_materia', $materia->id )->where('id_trimestre', 2 )->first();
          $notasAsignada3 = $asignacion_alumno->AsignacionNotas->where('id_materia', $materia->id )->where('id_trimestre', 3 )->first();
          $notasAsignada1 = is_null($notasAsignada1) ? '0' : $notasAsignada1->nota_trimestral;
          $notasAsignada2 = is_null($notasAsignada2) ? '0' : $notasAsignada2->nota_trimestral;
          $notasAsignada3 = is_null($notasAsignada3) ? '0' : $notasAsignada3->nota_trimestral;
          $notasAsignada4 = $asignacion_alumno->AsignacionNotas->where('id_materia', $materia->id )->where('id_trimestre', 4 )->first();
          
          $prom = round(($notasAsignada1 + $notasAsignada2 + $notasAsignada3)/3, 2);
          if (is_null($notasAsignada4) ) {
            AsignacionNotas::create([  
              'id_materia' => $materia->id,
              'id_asignacion_alumno' => $asignacion_alumno->id,
              'id_trimestre' => 4,
              'nota_trimestral' => $prom,
            ]);   
          }
          else{
            $notasAsignada4->update(['nota_trimestral'=> $prom]);
          }
          //$estado = "Reprobado";
          //if ($prom >=6) {
          //  $estado = 'Aprobado';
          //}
          //$asignacion_alumno->update(['estado_academico' => $estado] );
        }
      }
      foreach ($asig_alumno as $key => $asignacion_alumno){
        $trimestre_promedio = $asignacion_alumno->AsignacionNotas->where('id_trimestre', 4);
        $nota_prom = 0;
        //$total_materias = count($trimestre_promedio);
        $estado = "Aprobado";
        foreach ($trimestre_promedio as $key => $value) {
          $nota_prom = $value->nota_trimestral;
          if ($nota_prom  <= 6) {
            $estado = 'Reprobado';
          }
          $asignacion_alumno->update(['estado_academico' => $estado] );
        }          
      }
      return redirect()->route('notas.index')->with('success','Promedios Finales Calculados con Éxito.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        $nota = AsignacionNotas::find($id)->delete();
        Conducta::find($nota->conducta->id)->delete();
        return redirect()->route('notas.index')->with('success','Nota eliminada con exito');
    }
}

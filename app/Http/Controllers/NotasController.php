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
use notas1\http\Request\NotasRequest;

class NotasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
      $asignacion_alumnos = \Auth::user()->docente->asignacion->AsignacionesAlumnos;

        $materias = Materias::all();
        $trimestral =$request->get('trimestral');
        $notas = AsignacionNotas::orderBy('id','ASC')->trimestral($trimestral)->paginate(10);
        return view('notas.index',compact('notas', 'materias','asignacion_alumnos'));
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

    public function notasGrado($id)
    {
      Asignaciones::all();
      $asignacion_alumnos = \Auth::user()->docente->asignacion->AsignacionesAlumnos;

      return view('notas.por_materia',compact('nota','id','integradora','cotidiana','asignacion_alumnos'));
    }

    public function bulk(Request $request, $id)
    {
      $notas = $request->get('notas');
      foreach ($notas['asignacion'] as $key => $nota) {
        $inputs = array(
          'nota_trimestral' => $nota['nota_trimestral'],
        );
        $filter = array(
          'id_asignacion_alumno' => $nota['id_asignacion_alumno'],
          'id_materia' => $nota['id_materia']
        );
        $valor = '';
        $valor = AsignacionNotas::updateOrCreate($filter, $inputs);
        print_r($valor->id);
        echo "<br>";
        print_r($valor->id_asignacion_alumno);
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
        print_r($valor1->id);
        echo "<br>";
        print_r($valor1->id_asignacion_notas);
        echo "<br>";

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
        print_r($pruebas);
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
      return redirect()->route('notas.index')->with('success','Notas guardado con éxito');
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


        return redirect()->route('notas.index')->with('success','Nota eliminado con exito');
    }
}

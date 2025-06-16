<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\ActCotidianas;
use App\ActIntegradoras;
use App\Pruebas;
use App\Conducta;
use App\AsignacionNotas;
use App\Materias;
use App\Asignaciones;
use App\Alumnos;
use App\AsignacionAlumnosNotas;
use asignacionNotas1\http\Request\AsignacionNotasRequest;
use App\AsignacionConductas;
use App\Grados;
use App\Docentes;
use App\Conductas;
use Barryvdh\DomPDF\Facade as PDF;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;


class AsignacionNotasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $Y= date("Y");
        $asignaciones = Asignaciones::all();
        $alumnos = Alumnos::all();
        $nombre =$request->get('nombre');
        $asi = Auth::user()->docente;
        $asignacionAl = AsignacionAlumnosNotas::all();
        $asignacionAlumnosNotas = AsignacionAlumnosNotas::orderBy('id','desc')->nombre($nombre)->paginate(10);
        $materias = Materias::all();
        $grados = Grados::all();

        //Para mostrar las asignaciones de alumnos del año Actual del docente logeado
        $asig_docente = $asignaciones->where('id_docente', $asi->id)->where('anio', $Y )->first();
        if ($asig_docente !== null){
            $asig_alumno = $asignacionAl->where('id_asignacion', $asig_docente->id);
            $grado_actual = $grados->where('id', $asig_docente->id_grado)->first();
        }
        elseif ($asig_docente == null) {
           $asig_alumno = null;
           $grado_actual = null;
        }
        return view('asignacionNotas.index',compact('materias','Y','asig_docente','asi','asig_alumno','grado_actual'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $integradora = ActIntegradoras::all();
        $cotidiana = ActCotidianas::all();
        $prueba = Pruebas::all();
        $conducta = Conducta::all();
        $materias = Materias::all();
        return view('asignacionNotas.create', compact('integradora','cotidiana','prueba','conducta','materias'));
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
          'id_materia'=>'required|numeric',  
          'trimestre'=>'required|numeric',
        ]);
        AsignacionNotas::create($request->all());
        return redirect()->route('asignacionNotas.index')->with('success','Asignacion de Nota guardada con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
      $asignacionnotas = AsignacionNotas::find($id);
      return view('asignacionNotas.show',compact('asignacionnotas'));
    }

    public function repor1($id)
    {
        $materias = Materias::all();
        $asignacionConductas = AsignacionConductas::all();
        $asignacionNotas=AsignacionNotas::all();
        $notas = AsignacionNotas::orderBy('id','ASC')->paginate(10);
        
        $conductas= Conductas::all();
        $asignaDocente=Asignaciones::all();
        $Y= date("Y");
        $asi = Auth::user()->docente;
        $asignacionAl = AsignacionAlumnosNotas::all();
        $docentes= Docentes::all();
        $grados = Grados::all();
        $mes= date("m");

        //Para mostrar las asignaciones de alumnos del año Actual del docente logeado
        $asig_docente = $asignaDocente->where('id_docente', $asi->id)->where('anio', $Y )->first();
        if ($asig_docente !== null){
            $asig_alumno = $asignacionAl->where('id', $id);

            $grado_actual = $grados->where('id', $asig_docente->id_grado)->first();
        }
        elseif ($asig_docente == null) {
           $asig_alumno = null;
           $grado_actual = null;
        }
        if ($mes==01) {
            $mes_año = "ENERO";
        }
        if ($mes==2) {
            $mes_año = "FEBRERO";
        }
        if ($mes==3) {
            $mes_año = "MARZO";
        }
        if ($mes==4) {
            $mes_año = "ABRIL";
        }
        if ($mes==5) {
            $mes_año = "MAYO";
        }
        if ($mes==6) {
            $mes_año = "JUNIO";
        }
        if ($mes==7) {
            $mes_año = "JULIO";
        }
        if ($mes==8) {
            $mes_año = "AGOSTO";
        }
        if ($mes==9) {
            $mes_año = "SEPTIEMBRE";
        }
        if ($mes==10) {
            $mes_año = "OCTUBRE";
        }
        if ($mes==11) {
            $mes_año = "NOVIEMBRE";
        }
        if ($mes==12) {
            $mes_año = "DICIEMBRE";
        }

        return view('asignacionNotas/reportes.trimestre1',compact('id','notas', 'materias','asignacionNotas','asignaDocente','asignacionConductas','asi','asignacionAl','grados','asig_alumno', 'asig_docente','grado_actual','Y','mes_año','conductas'));
                
    }
    public function repor1PDF(request $request )
    {
        $materias = Materias::all();
        $asignacionConductas = AsignacionConductas::all();
        $asignacionNotas=AsignacionNotas::all();
        $notas = AsignacionNotas::orderBy('id','ASC')->paginate(10);
        
        $conductas= Conductas::all();
        $asignaDocente=Asignaciones::all();
        $Y= date("Y");
        $asi = Auth::user()->docente;
        $asignacionAl = AsignacionAlumnosNotas::all();
        $docentes= Docentes::all();
        $grados = Grados::all();
        $mes= date("m");

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
        if ($mes==01) {
            $mes_año = "ENERO";
        }
        if ($mes==2) {
            $mes_año = "FEBRERO";
        }
        if ($mes==3) {
            $mes_año = "MARZO";
        }
        if ($mes==4) {
            $mes_año = "ABRIL";
        }
        if ($mes==5) {
            $mes_año = "MAYO";
        }
        if ($mes==6) {
            $mes_año = "JUNIO";
        }
        if ($mes==7) {
            $mes_año = "JULIO";
        }
        if ($mes==8) {
            $mes_año = "AGOSTO";
        }
        if ($mes==9) {
            $mes_año = "SEPTIEMBRE";
        }
        if ($mes==10) {
            $mes_año = "OCTUBRE";
        }
        if ($mes==11) {
            $mes_año = "NOVIEMBRE";
        }
        if ($mes==12) {
            $mes_año = "DICIEMBRE";
        }

        $pdf = PDF::loadView('asignacionNotas/reportes.trimestre1', compact('id','notas', 'materias','asignacion_alumnos','asignacionNotas','asignaDocente','asignacionConductas','asi','asignacionAl','grados','asig_alumno', 'asig_docente','grado_anterior','grado_actual','mismo_grado_año_anterior','Y','mes_año','conductas'));
        return $pdf->download('listado.pdf');
    }
        public function repor2($id)
    {
        $materias = Materias::all();
        $asignacionConductas = AsignacionConductas::all();
        $asignacionNotas=AsignacionNotas::all();
        $notas = AsignacionNotas::orderBy('id','ASC')->paginate(10);
        
        $conductas= Conductas::all();
        $asignaDocente=Asignaciones::all();
        $Y= date("Y");
        $asi = Auth::user()->docente;
        $asignacionAl = AsignacionAlumnosNotas::all();
        $docentes= Docentes::all();
        $grados = Grados::all();
        $mes= date("m");

        //Para mostrar las asignaciones de alumnos del año Actual del docente logeado
        $asig_docente = $asignaDocente->where('id_docente', $asi->id)->where('anio', $Y )->first();
        if ($asig_docente !== null){
            $asig_alumno = $asignacionAl->where('id', $id);

            $grado_actual = $grados->where('id', $asig_docente->id_grado)->first();
        }
        elseif ($asig_docente == null) {
           $asig_alumno = null;
           $grado_actual = null;
        }
        if ($mes==01) {
            $mes_año = "ENERO";
        }
        if ($mes==2) {
            $mes_año = "FEBRERO";
        }
        if ($mes==3) {
            $mes_año = "MARZO";
        }
        if ($mes==4) {
            $mes_año = "ABRIL";
        }
        if ($mes==5) {
            $mes_año = "MAYO";
        }
        if ($mes==6) {
            $mes_año = "JUNIO";
        }
        if ($mes==7) {
            $mes_año = "JULIO";
        }
        if ($mes==8) {
            $mes_año = "AGOSTO";
        }
        if ($mes==9) {
            $mes_año = "SEPTIEMBRE";
        }
        if ($mes==10) {
            $mes_año = "OCTUBRE";
        }
        if ($mes==11) {
            $mes_año = "NOVIEMBRE";
        }
        if ($mes==12) {
            $mes_año = "DICIEMBRE";
        }

        return view('asignacionNotas/reportes.trimestre2',compact('id','notas', 'materias','asignacionNotas','asignaDocente','asignacionConductas','asi','asignacionAl','grados','asig_alumno', 'asig_docente','grado_actual','Y','mes_año','conductas'));
                
    }

        public function repor3($id)
    {
        $materias = Materias::all();
        $asignacionConductas = AsignacionConductas::all();
        $asignacionNotas=AsignacionNotas::all();
        $notas = AsignacionNotas::orderBy('id','ASC')->paginate(10);
        
        $conductas= Conductas::all();
        $asignaDocente=Asignaciones::all();
        $Y= date("Y");
        $asi = Auth::user()->docente;
        $asignacionAl = AsignacionAlumnosNotas::all();
        $docentes= Docentes::all();
        $grados = Grados::all();
        $mes= date("m");

        //Para mostrar las asignaciones de alumnos del año Actual del docente logeado
        $asig_docente = $asignaDocente->where('id_docente', $asi->id)->where('anio', $Y )->first();
        if ($asig_docente !== null){
            $asig_alumno = $asignacionAl->where('id', $id);

            $grado_actual = $grados->where('id', $asig_docente->id_grado)->first();
        }
        elseif ($asig_docente == null) {
           $asig_alumno = null;
           $grado_actual = null;
        }
        if ($mes==01) {
            $mes_año = "ENERO";
        }
        if ($mes==2) {
            $mes_año = "FEBRERO";
        }
        if ($mes==3) {
            $mes_año = "MARZO";
        }
        if ($mes==4) {
            $mes_año = "ABRIL";
        }
        if ($mes==5) {
            $mes_año = "MAYO";
        }
        if ($mes==6) {
            $mes_año = "JUNIO";
        }
        if ($mes==7) {
            $mes_año = "JULIO";
        }
        if ($mes==8) {
            $mes_año = "AGOSTO";
        }
        if ($mes==9) {
            $mes_año = "SEPTIEMBRE";
        }
        if ($mes==10) {
            $mes_año = "OCTUBRE";
        }
        if ($mes==11) {
            $mes_año = "NOVIEMBRE";
        }
        if ($mes==12) {
            $mes_año = "DICIEMBRE";
        }

        return view('asignacionNotas/reportes.trimestre3',compact('id','notas', 'materias','asignacionNotas','asignaDocente','asignacionConductas','asi','asignacionAl','grados','asig_alumno', 'asig_docente','grado_actual','Y','mes_año','conductas'));
                
    }

        public function repor123($id)
    {
        $materias = Materias::all();
        $asignacionConductas = AsignacionConductas::all();
        $asignacionNotas=AsignacionNotas::all();
        $notas = AsignacionNotas::orderBy('id','ASC')->paginate(10);
        
        $conductas= Conductas::all();
        $asignaDocente=Asignaciones::all();
        $Y= date("Y");
        $asi = Auth::user()->docente;
        $asignacionAl = AsignacionAlumnosNotas::all();
        $docentes= Docentes::all();
        $grados = Grados::all();
        $mes= date("m");

        //Para mostrar las asignaciones de alumnos del año Actual del docente logeado
        $asig_docente = $asignaDocente->where('id_docente', $asi->id)->where('anio', $Y )->first();
        if ($asig_docente !== null){
            $asig_alumno = $asignacionAl->where('id', $id);

            $grado_actual = $grados->where('id', $asig_docente->id_grado)->first();
        }
        elseif ($asig_docente == null) {
           $asig_alumno = null;
           $grado_actual = null;
        }
        if ($mes==01) {
            $mes_año = "ENERO";
        }
        if ($mes==2) {
            $mes_año = "FEBRERO";
        }
        if ($mes==3) {
            $mes_año = "MARZO";
        }
        if ($mes==4) {
            $mes_año = "ABRIL";
        }
        if ($mes==5) {
            $mes_año = "MAYO";
        }
        if ($mes==6) {
            $mes_año = "JUNIO";
        }
        if ($mes==7) {
            $mes_año = "JULIO";
        }
        if ($mes==8) {
            $mes_año = "AGOSTO";
        }
        if ($mes==9) {
            $mes_año = "SEPTIEMBRE";
        }
        if ($mes==10) {
            $mes_año = "OCTUBRE";
        }
        if ($mes==11) {
            $mes_año = "NOVIEMBRE";
        }
        if ($mes==12) {
            $mes_año = "DICIEMBRE";
        }

        return view('asignacionNotas/reportes.trimestre123',compact('id','notas', 'materias','asignacionNotas','asignaDocente','asignacionConductas','asi','asignacionAl','grados','asig_alumno', 'asig_docente','grado_actual','Y','mes_año','conductas'));
                
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
        $asignacionnotas = AsignacionNotas::find($id);
        return view('asignacionNotas.edit',compact('asignacionnotas','materias'));
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
          ' id_materia'=>'',  
          'trimestre'=>'',
        ]);
        AsignacionNotas::find($id)->update($request->all());
        return redirect()->route('asignacionNotas.index')->with('success','Asignacion de Notas actualizada con exito');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        AsignacionNotas::find($id)->delete();
        return redirect()->route('asignacionNotas.index')->with('success','Asignacion de Notas eliminada con exito');
    }

    public function reporteAPIJson(Request $request): \Illuminate\Http\JsonResponse
    {
        $response = null;

        $validator = Validator::make($request->all(), [
            'nie'       => ['bail', 'required', 'numeric', 'digits:7'],
            'anio'      => ['bail', 'required', 'numeric', 'digits:4'],
            'trimestre' => ['bail', 'required', 'integer', 'in:1,2,3'],
        ]);

        if ($validator->fails()) {
            $response = response()->json(['errors' => $validator->errors()], 422);
        } else {
            $validated = $request->only(['nie', 'anio', 'trimestre']);

            $alumno = Alumnos::where('no_nie', $validated['nie'])
                ->first(['id', 'nombres', 'apellidos', 'no_nie']);

            if (!$alumno) {
                $response = response()->json(['error' => 'Alumno no encontrado'], 404);
            } else {
                $reporte = $this->buildReporteData($alumno->id, $validated['anio'], $validated['trimestre']);

                $response = !$reporte
                    ? response()->json(['error' => "No hay asignación del alumno para el año {$validated['anio']}"], 404)
                    : response()->json(['alumno' => $alumno] + $reporte);
            }
        }

        return $response;
    }


    private function buildReporteData(int $idAlumno, int $anio, int $trimestre): array
    {
        // 1. Obtener asignación del alumno (incluye grado mediante la relación en cadena)
        $asigAlumno = AsignacionAlumnosNotas::where('id_alumno', $idAlumno)
            ->where('anio', $anio)
            ->with(['Asignacion.Grado']) // importante: carga la relación del grado
            ->first();

        if (!$asigAlumno) {
            return [];
        }

        // 2. Obtener notas del trimestre
        $asigNotas = AsignacionNotas::where('id_asignacion_alumno', $asigAlumno->id)
            ->where('id_trimestre', $trimestre)
            ->get();

        $materias = Materias::whereIn('id', $asigNotas->pluck('id_materia'))->get()->keyBy('id');

        // 3. Construir estructura por materia
        $filas = $asigNotas->map(function ($nota) use ($materias) {
            $inte = ActIntegradoras::where('id_asignacion_notas', $nota->id)->first();
            $coti = ActCotidianas::where('id_asignacion_notas', $nota->id)->first();
            $prue = Pruebas::where('id_asignacion_notas', $nota->id)->first();

            return [
                'materia'             => $materias[$nota->id_materia]->nombre ?? 'Sin nombre',
                'act_integradora'     => $inte->promedio_i ?? null,
                'integradora_35'      => $inte->prom_i_porcent ?? null,
                'act_cotidiana'       => $coti->nota_cotidiana ?? null,
                'cotidiana_35'        => $coti->nota_porcent ?? null,
                'pruebas'             => $prue->promedio_p ?? null,
                'pruebas_30'          => $prue->prom_p_porcent ?? null,
                'promedio_trimestral' => $nota->nota_trimestral,
            ];
        })->values();

        // 4. Conducta
        $conducta = null;
        if ($asigCond = AsignacionConductas::where('id_asignacion_alumno', $asigAlumno->id)
            ->where('id_trimestre', $trimestre)->first()) {
            $conducta = Conductas::where('id_asignacion_conductas', $asigCond->id)
                ->first(['moral_civica', 'nota_conducta', 'observaciones']);
        }

        // 5. Nombre del mes (en español)
        setlocale(LC_TIME, 'Spanish_Spain.1252');
        $mesActual = Carbon::now()->month;
        $mesNombre = strtoupper(strftime('%B'));

        // 6. Obtener nombre del grado
        $grado = null;
        $seccion = null;

        if ($asigAlumno->Asignacion && $asigAlumno->Asignacion->Grado) {
            $grado = $asigAlumno->Asignacion->Grado->nombre;
            $seccion = $asigAlumno->Asignacion->Grado->seccion;
        } else {
            $grado = 'Sin grado asignado';
            $seccion = '';
        }
        
        // 7. Docente
        $docente = null;

        $docente = $asigAlumno->Asignacion->Docente->Usuario->name ?? 'Sin nombre';

        // 7. Devolver datos
        return [
            'grado'      => $grado,
            'seccion'    => $seccion,
            'trimestre'  => $trimestre,
            'anio'       => $anio,
            'mesActual'  => $mesActual,
            'mesNombre'  => $mesNombre,
            'docente'    => $docente,
            'notas'      => $filas,
            'conductas'  => $conducta
        ];
    }

}
<?php
namespace App\Http\Controllers;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\AsignacionAlumnosNotas;
use App\Asignaciones;
use App\Alumnos;
use App\Docentes;
use Auth;
use App\Grados;
use asignacionAlumnosNotas1\http\Request\AsignacionesRequest;

class AsignacionAlumnosNotasController extends Controller
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
        $asignacion_alumnos = \Auth::user()->docente->asignacion->AsignacionesAlumnos;
        $asi = \Auth::user()->docente;
        $asignacionAl = AsignacionAlumnosNotas::all();
        $asignacionAlumnosNotas = AsignacionAlumnosNotas::orderBy('id','desc')->nombre($nombre)->paginate(10);
        $docentes= Docentes::all();
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

        //Para mostrar las asignacione de alumnos del año y grado Anterior de todos los docentes que los impartieron

        if ($grado_actual == null){
            $grado_anterior=null;
        }
        elseif ($grado_actual !== null) {
        if ($grado_actual->nombre == 'Kinder')
          $grado_anterior = $grados->where('nombre', 'Kinder');
        if ($grado_actual->nombre == 'Preparatoria')
          $grado_anterior = $grados->where('nombre', 'Kinder');
        if ($grado_actual->nombre == 'Primero')
          $grado_anterior = $grados->where('nombre', 'Preparatoria');
        if($grado_actual->nombre == 'Segundo') 
          $grado_anterior = $grados->where('nombre', 'Primero'); 
        if($grado_actual->nombre == 'Tercero') 
          $grado_anterior = $grados->where('nombre', 'Segundo');
        if($grado_actual->nombre == 'Cuarto') 
          $grado_anterior = $grados->where('nombre', 'Tercero');
        if($grado_actual->nombre == 'Quinto') 
          $grado_anterior = $grados->where('nombre', 'Cuarto');
        if($grado_actual->nombre == 'Sexto') 
          $grado_anterior = $grados->where('nombre', 'Quinto');
        if($grado_actual->nombre == 'Séptimo') 
          $grado_anterior = $grados->where('nombre', 'Sexto');
        if($grado_actual->nombre == 'Octavo') 
          $grado_anterior = $grados->where('nombre', 'Séptimo');
        if($grado_actual->nombre == 'Noveno') 
          $grado_anterior = $grados->where('nombre', 'Octavo');
                  }     

        //Para mostrar las asignacione de alumnos del año Anterior y Grado actual impartido, de todos los docentes que los impartieron    
        
        if ($grado_actual == null){
        $mismo_grado_año_anterior=null;
        }
        elseif ($grado_actual !== null) {
        if ($grado_actual->nombre == 'Kinder')
          $mismo_grado_año_anterior = $grados->where('nombre', 'Kinder');
        if ($grado_actual->nombre == 'Preparatoria')
          $mismo_grado_año_anterior = $grados->where('nombre', 'Preparatoria');
        if ($grado_actual->nombre == 'Primero')
          $mismo_grado_año_anterior = $grados->where('nombre', 'Primero');
        if($grado_actual->nombre == 'Segundo') 
          $mismo_grado_año_anterior = $grados->where('nombre', 'Segundo'); 
        if($grado_actual->nombre == 'Tercero') 
          $mismo_grado_año_anterior = $grados->where('nombre', 'Tercero');
        if($grado_actual->nombre == 'Cuarto') 
          $mismo_grado_año_anterior = $grados->where('nombre', 'Cuarto');
        if($grado_actual->nombre == 'Quinto') 
          $mismo_grado_año_anterior = $grados->where('nombre', 'Quinto');
        if($grado_actual->nombre == 'Sexto') 
          $mismo_grado_año_anterior = $grados->where('nombre', 'Sexto');
        if($grado_actual->nombre == 'Séptimo') 
          $mismo_grado_año_anterior = $grados->where('nombre', 'Séptimo');
        if($grado_actual->nombre == 'Octavo') 
          $mismo_grado_año_anterior = $grados->where('nombre', 'Octavo');
        if($grado_actual->nombre == 'Noveno') 
          $mismo_grado_año_anterior = $grados->where('nombre', 'Noveno');
                  } 
        return view('asignacionAlumnosNotas.index',compact('asignacionAlumnosNotas','asignaciones','alumnos','asignacion_alumnos','docentes','asi','asignacionAl','grados','asig_alumno', 'asig_docente','grado_anterior','grado_actual','mismo_grado_año_anterior'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $asignaciones = Asignaciones::all();
        //$alumnos = Alumnos::all();
         $alumnos = DB::table('alumnos')
                ->whereNotExists(function ($query)
                    {
                        $query->select(DB::raw(1))
                        ->from('asignacion_alumnos_notas')
                        ->whereRaw('asignacion_alumnos_notas.id_alumno = alumnos.id');
                    })
                    ->get();

        $asig_Alumno_all =AsignacionAlumnosNotas::all();
        $asignacion_alumnos = \Auth::user()->docente->asignacion;
        return view('asignacionAlumnosNotas.create', compact('asignaciones','alumnos','asignacion_alumnos','asig_Alumno_all'));
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
          'id_asignacion'=>'required|numeric',  
          'id_alumno'=>'required|numeric',
          'anio'=>'required|numeric',
          ]);
        $asignacionAlumno = AsignacionAlumnosNotas::where('id_alumno', $request->id_alumno)
        ->where('anio', $request->anio)->exists(); //true or false
        if($asignacionAlumno)
        {
          return redirect()->route('asignacionAlumnosNotas.index')
          ->with('error','ERROR!. El Alumno ya ha sido asignado en otro grado en este año!');
        }
        //$asignacionAlumno2 = AsignacionAlumnosNotas::where('id_asignacion', $request->id_asignacion)
        //->where('anio', $request->anio)
        //->exists(); //true or false
        //if($asignacionAlumno2)
        //{
        //  return redirect()->route('asignacionAlumnosNotas.index')
        //  ->with('error','ERROR!. El Alumno ya ha sido asignado en un grado que imparte otro Docente!');
        //}
        AsignacionAlumnosNotas::create($request->all());
        return redirect()->route('asignacionAlumnosNotas.index')->with('success','Asignacion guardada con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $asignacionAlumnoNota = AsignacionAlumnosNotas::find($id);
      return view('asignacionAlumnosNotas.show',compact('asignacionAlumnoNota'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $Y= date("Y");
        $asignaciones = Asignaciones::all();
        $alumnos = Alumnos::all();
        $al = Alumnos::find($id);
        $asignacionAlumnoNota = AsignacionAlumnosNotas::find($id);
        $asignacionAl = AsignacionAlumnosNotas::all();
        $asi = \Auth::user()->docente;
        $docentes= Docentes::all();
        $grados = Grados::all();
         //Para mostrar las asignaciones de alumnos del año Actual del docente logeado
        $asig_docente = $asignaciones->where('id_docente', $asi->id)->where('anio', $Y )->first();
        if ($asig_docente !== null){
            $asig_alumno = $asignacionAl->where('id_asignacion', $asig_docente->id);
            $grado_actual = $grados->where('id', $asig_docente->id_grado)->first();
            $grados_actual = $grados->where('nombre', $grado_actual->nombre);
        }
        elseif ($asig_docente == null) {
           $asig_alumno = null;
           $grado_actual = null;
           $grados_actual = null;
           $AsigDocente_paraCambio = null;
        }

        return view('asignacionAlumnosNotas.edit',compact('asignacionAlumnoNota','asignaciones','alumnos','al','asi','asig_docente','asig_alumno','grado_actual','Y','grados_actual','asignacionAl'));
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
          'id_asignacion'=>'required|numeric',  
          'id_alumno'=>'required|numeric',
          'anio'=>'required|numeric',
          ]);
        $asignacion = AsignacionAlumnosNotas::where('id_asignacion', $request->id_asignacion)
        ->where('id_alumno', $request->id_alumno)
        ->exists(); //true or false
        if($asignacion)
        {
          return redirect()->route('asignacionAlumnosNotas.index')
          ->with('error','¡ERROR! La asignación no pudo actualizarse,  Registro repetido!!');
        }
        AsignacionAlumnosNotas::find($id)->update($request->all());
        return redirect()->route('asignacionAlumnosNotas.index')->with('success','Asignacion actualizada con exito');
    }

    public function alumnosGrado($id)
    {
      AsignacionAlumnosNotas::all();
      $asignacion_alumnos = \Auth::user()->docente->asignacion->AsignacionesAlumnos;

      return view('asignacionAlumnosNotas.index',compact('nota','id','integradora','cotidiana','asignacion_alumnos'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

     public function destroy($id)
    {
        try {
            AsignacionAlumnosNotas::find($id)->delete();
            return redirect()->route('asignacionAlumnosNotas.index')->with('success','Asignacion eliminada con exito');
        } catch (\Illuminate\Database\QueryException $e) {
            return redirect()->route('asignacionAlumnosNotas.index')
            ->with('error','¡ERROR! La asignación Contiene notas asignadas, no se puede borrar!!');
        }  
    }
}
 
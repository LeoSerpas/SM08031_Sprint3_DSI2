<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\AsignacionAlumnosNotas;
use App\Asignaciones;
use App\Alumnos;
use App\Docentes;
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
        $asignaciones = Asignaciones::all();
        $alumnos = Alumnos::all();
        $nombre =$request->get('nombre');
        $asignacion_alumnos = \Auth::user()->docente->asignacion->AsignacionesAlumnos;
        $asignacionAlumnosNotas = AsignacionAlumnosNotas::orderBy('id','ASC')->nombre($nombre)->paginate(10);
        $docentes= Docentes::all();
        return view('asignacionAlumnosNotas.index',compact('asignacionAlumnosNotas','asignaciones','alumnos','asignacion_alumnos','docentes'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $asignaciones = Asignaciones::all();
        $alumnos = Alumnos::all();
        $asignacion_alumnos = \Auth::user()->docente->asignacion;
        return view('asignacionAlumnosNotas.create', compact('asignaciones','alumnos','asignacion_alumnos'));
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
        ->where('anio', $request->anio)
        ->exists(); //true or false
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
        $asignaciones = Asignaciones::all();
        $alumnos = Alumnos::all();
        $al = Alumnos::find($id);
        $asignacionAlumnoNota = AsignacionAlumnosNotas::find($id);
        return view('asignacionAlumnosNotas.edit',compact('asignacionAlumnoNota','asignaciones','alumnos','al'));
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
 
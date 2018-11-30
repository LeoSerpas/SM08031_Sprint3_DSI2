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
        return view('asignacionAlumnosNotas.create', compact('asignaciones','alumnos'));
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
          ]);
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
        $asignacionAlumnoNota = AsignacionAlumnosNotas::find($id);
        return view('asignacionAlumnosNotas.edit',compact('asignacionAlumnoNota','asignaciones','alumnos'));
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
          ]);
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
        AsignacionAlumnosNotas::find($id)->delete();
        return redirect()->route('asignacionAlumnosNotas.index')->with('success','Asignacion eliminada con exito');
    }
}
 
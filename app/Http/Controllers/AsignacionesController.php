<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Asignaciones;
use App\Docentes;
use App\Grados;
use asignaciones1\http\Request\AsignacionesRequest;

class AsignacionesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $docentes = Docentes::all();
        $grados = Grados::all();
        $nombre =$request->get('nombre');
        $asignaciones = Asignaciones::orderBy('id','ASC')->nombre($nombre)->paginate(10);
        return view('asignaciones.index',compact('asignaciones','docentes','grados'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $docentes = Docentes::all();
        $grados = Grados::all();
        return view('asignaciones.create', compact('docentes','grados'));
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
          'id_docente'=>'required|numeric',  
          'id_grado'=>'required|numeric',
          'anio'=>'required|numeric',
        ]);
        Asignaciones::create($request->all());
        return redirect()->route('asignaciones.index')->with('success','Asignacion guardada con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $asignacion = Asignaciones::find($id);
      return view('asignaciones.show',compact('asignacion'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $docentes = Docentes::all();
        $grados = Grados::all();
        $asignacion = Asignaciones::find($id);
        return view('asignaciones.edit',compact('asignacion','docentes','grados'));
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
          'id_docente'=>'required|numeric',  
          'id_grado'=>'required|numeric',
          'anio'=>'required|numeric',
        ]);
        Asignaciones::find($id)->update($request->all());
        return redirect()->route('asignaciones.index')->with('success','Asignacion actualizada con exito');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Asignaciones::find($id)->delete();
        return redirect()->route('asignaciones.index')->with('success','Asignacion eliminada con exito');
    }
}
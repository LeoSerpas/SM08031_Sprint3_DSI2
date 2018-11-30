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
use asignacionNotas1\http\Request\AsignacionNotasRequest;

class AsignacionNotasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $integradora = ActIntegradoras::all();
        $cotidiana = ActCotidianas::all();
        $prueba = Pruebas::all();
        $materias = Materias::all();
        $trimestre =$request->get('trimestre');  
        $asignacionnotas = AsignacionNotas::orderBy('id','ASC')->trimestral($trimestre)->paginate(20);
        return view('asignacionNotas.index',compact('asignacionnotas','integradora','cotidiana','prueba','materias'));
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
}
 
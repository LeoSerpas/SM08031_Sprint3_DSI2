<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Alumnos;
use alumnos1\http\Request\AlumnosRequest;

class AlumnosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $nombre =$request->get('nombre');
        $alumnos = Alumnos::orderBy('id','DESC')->nombre($nombre)->paginate(20);
        return view('alumnos.index',compact('alumnos'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('alumnos.create');
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
            'nombres'=>'required|alpha_spaces',
            'apellidos'=>'required|alpha_spaces',
            'no_nie'=>'required|numeric|unique:alumnos',
            'f_nacimiento'=>'required|date'
        ]);
        Alumnos::create($request->all());
        return redirect()->route('alumnos.index')->with('success','Alumno guardado con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $alumno = Alumnos::find($id);
      return view('alumnos.show',compact('alumno'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
         $alumno = Alumnos::find($id);
        return view('alumnos.edit',compact('alumno'));
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
            'nombres'=>'required|alpha_spaces',
            'apellidos'=>'required|alpha_spaces',
            'no_nie'=>'required|numeric',
            'f_nacimiento'=>'required|date'
        ]);
        Alumnos::find($id)->update($request->all());
        return redirect()->route('alumnos.index')->with('success','Alumno actualizado con exito');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Alumnos::find($id)->delete();
        return redirect()->route('alumnos.index')->with('success','Alumno eliminado con exito');
    }
}
 

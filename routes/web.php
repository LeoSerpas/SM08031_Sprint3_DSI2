<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/SGECECST', function () {
    return view('welcome');
});


Route::get('logout', '\App\Http\Controllers\Auth\LoginController@logout');
Route::get('/home', 'HomeController@index')->name('home');

Route::get('/home', 'HomeController@index')->name('home');

	Auth::routes();
	Auth::routes();

Route::group(['middleware' => 'auth'], function() {
  Route::resource('docentes','DocentesController');
	Route::resource('grados','GradosController');
	Route::resource('alumnos','AlumnosController');
  Route::get('notas/grado/{id}', 'NotasController@notasGrado' )->name('notas.por_materia');
  Route::post('notas/grado/{id}', 'NotasController@bulk' )->name('notas.bulk');
	Route::resource('secretarias','SecretariasController');
	Route::resource('materias','MateriasController');
	Route::resource('notas','NotasController');
	Route::resource('asignacionAlumnosNotas','AsignacionAlumnosNotasController');
	Route::resource('asignaciones','AsignacionesController');
	Route::resource('asignacionNotas','asignacionNotasController');
  Route::get('gestion', function()
	{
    return view('gestion');
	});
});

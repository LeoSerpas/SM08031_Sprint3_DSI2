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

Route::get('/gestion', 'HomeController@index')->name('gestion');

	Auth::routes();
	Auth::routes();

Route::group(['middleware' => 'auth'], function() {
Route::resource('docentes','DocentesController');
Route::resource('grados','GradosController');
Route::resource('alumnos','AlumnosController');
Route::get('notas/materia/{id}/trimestre/{id_trimestre}', 'NotasController@notasGrado' )->name('notas.por_materia');
Route::post('notas/materia/{id}/trimestre/{id_trimestre}', 'NotasController@bulk' )->name('notas.bulk');
Route::get('notas/conducta/trimestre/{id_trimestre}', 'NotasController@notasConducta' )->name('notas.conductas');
Route::post('notas/conducta/trimestre/{id_trimestre}', 'NotasController@cond' )->name('notas.cond');
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

Route::post('asignacionAlumnosNotas/{id}', 'AsignacionAlumnosNotasController@deleted' )->name('asignacionAlumnosNotas.deleted');
});

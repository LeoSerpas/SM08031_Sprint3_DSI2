<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Controllers\AsignacionNotasController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:api');


Route::get('test-reporte', function () {
    return 'Funciona correctamente';
});



Route::group(['middleware' => 'auth.token'], function () {
    Route::post('/alumnos/reporte', 'AsignacionNotasController@reporteAPIJson');
});


Route::post('/login', 'Api\AuthController@login');

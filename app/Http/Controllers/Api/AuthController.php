<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Carbon\Carbon;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        // Validar que email y password estén presentes
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'error' => 'Faltan datos o formato inválido.',
                'detalles' => $validator->errors()
            ], 422);
        }

        // Intentar autenticación con email y password
        if (!Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            return response()->json(['error' => 'Credenciales inválidas'], 401);
        }

        // Si pasa, recuperar el usuario autenticado
        $user = Auth::user();

        // Generar token personalizado con expiración
        $token = Str::random(60);
        $expiresAt = Carbon::now()->addMinutes(60); // Token válido por 60 minutos

        // Guardar token en tabla personalizada api_tokens
        DB::table('api_tokens')->insert([
            'user_id'    => $user->id,
            'token'      => $token,
            'expires_at' => $expiresAt,
            'created_at' => Carbon::now()
        ]);

        return response()->json([
            'token'     => $token,
            'expira_en' => $expiresAt->toDateTimeString(),
        ]);
    }
}

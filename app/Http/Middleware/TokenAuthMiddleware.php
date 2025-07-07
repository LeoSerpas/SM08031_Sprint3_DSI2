<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class TokenAuthMiddleware
{
    public function handle($request, Closure $next)
    {
        $token = $request->header('Authorization');

        if (!$token) {
            return response()->json(['error' => 'Token requerido'], 401);
        }

        $registro = DB::table('api_tokens')
            ->where('token', $token)
            ->where('expires_at', '>', Carbon::now())
            ->first();

        if (!$registro) {
            return response()->json(['error' => 'Token inválido o expirado'], 401);
        }

        // Opcional: puedes guardar el ID del usuario autenticado en el request
        $request->merge(['user_id' => $registro->user_id]);

        return $next($request);
    }
}

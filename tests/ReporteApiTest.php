<?php

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class ReporteApiTest extends TestCase
{
    use DatabaseTransactions;

    public function test_reporte_api_requiere_token()
    {
        $response = $this->json('POST', '/api/alumnos/reporte', [
            'nie' => '3437999',
            'anio' => '2025',
            'trimestre' => '1'
        ]);

        $this->assertEquals(401, $response->getStatusCode()); // o 403 según cómo tu middleware lo maneje
        $this->assertContains('Token requerido', $response->getContent());
    }

    public function test_reporte_api_con_token_valido()
    {
        
        $user = \App\User::first(); // o crea un usuario nuevo si es necesario
        if (!$user) {
            $this->markTestSkipped('No hay usuarios en la base de datos para realizar la prueba.');
        }

        $token = Str::random(60);
        DB::table('api_tokens')->insert([
            'user_id'    => $user->id,
            'token'      => $token,
            'expires_at' => Carbon::now()->addMinutes(5),
            'created_at' => Carbon::now(),
        ]);

        $response = $this->call('POST', '/api/alumnos/reporte', [
            'nie' => '3437999',
            'anio' => '2025',
            'trimestre' => '1'
        ], [], [], [
            'HTTP_Authorization' => $token,
            'HTTP_Accept' => 'application/json',
        ]);

        $this->assertEquals(200, $response->getStatusCode());
        $this->assertJson($response->getContent());
    }
    public function test_reporte_api_con_token_invalido()
    {
        $tokenInvalido = 'TOKEN_INVALIDO';

        $response = $this->call('POST', '/api/alumnos/reporte', [
            'nie' => '3437999',
            'anio' => '2025',
            'trimestre' => '1'
        ], [], [], [
            'HTTP_Authorization' => $tokenInvalido,
            'HTTP_Accept' => 'application/json',
        ]);

        $data = json_decode($response->getContent(), true);
        $this->assertEquals('Token inválido o expirado', $data['error']);

    }
    public function test_reporte_api_con_parametros_incompletos()
    {
        $user = \App\User::first();
        $token = Str::random(60);
        DB::table('api_tokens')->insert([
            'user_id'    => $user->id,
            'token'      => $token,
            'expires_at' => Carbon::now()->addMinutes(5),
            'created_at' => Carbon::now(),
        ]);

        // Petición sin el campo 'anio'
        $response = $this->call('POST', '/api/alumnos/reporte', [
            'nie' => '3437999',
            'trimestre' => '1'
        ], [], [], [
            'HTTP_Authorization' => $token,
            'HTTP_Accept' => 'application/json',
        ]);

        $data = json_decode($response->getContent(), true);
        $this->assertEquals('El campo año es obligatorio.', $data['errors']['anio'][0]);

    }
    public function test_reporte_api_con_todos_los_parametros_incompletos()
    {
        $user = \App\User::first(); // o crea un usuario nuevo si es necesario
        if (!$user) {
            $this->markTestSkipped('No hay usuarios en la base de datos para realizar la prueba.');
        }

        $token = Str::random(60);
        DB::table('api_tokens')->insert([
            'user_id'    => $user->id,
            'token'      => $token,
            'expires_at' => Carbon::now()->addMinutes(5),
            'created_at' => Carbon::now(),
        ]);

        $response = $this->call('POST', '/api/alumnos/reporte', [
            // Dejamos los campos vacíos o sin incluir
        ], [], [], [
            'HTTP_Authorization' => $token,
            'HTTP_Accept' => 'application/json',
        ]);

        $data = json_decode($response->getContent(), true);

        $this->assertEquals(422, $response->getStatusCode()); // Laravel suele usar 422 para errores de validación

        $this->assertEquals('El campo año es obligatorio.', $data['errors']['anio'][0]);
        $this->assertEquals('El campo NIE es obligatorio.', $data['errors']['nie'][0]);
        $this->assertEquals('El campo trimestre es obligatorio.', $data['errors']['trimestre'][0]);
    }
    public function test_reporte_api_alumno_no_encontrado()
    {
        $user = \App\User::first();
        if (!$user) {
            $this->markTestSkipped('No hay usuarios en la base de datos para realizar la prueba.');
        }

        $token = Str::random(60);
        DB::table('api_tokens')->insert([
            'user_id'    => $user->id,
            'token'      => $token,
            'expires_at' => Carbon::now()->addMinutes(5),
            'created_at' => Carbon::now(),
        ]);

        $response = $this->call('POST', '/api/alumnos/reporte', [
            'nie' => '9999999', // NIE que no existe
            'anio' => '2025',
            'trimestre' => '1'
        ], [], [], [
            'HTTP_Authorization' => $token,
            'HTTP_Accept' => 'application/json',
        ]);

        $data = json_decode($response->getContent(), true);

        $this->assertEquals(404, $response->getStatusCode());
        $this->assertEquals('Alumno no encontrado', $data['error']);
        

    }
    public function test_reporte_api_sin_asignacion_en_anio()
    {
        $user = \App\User::first();
        if (!$user) {
            $this->markTestSkipped('No hay usuarios en la base de datos para realizar la prueba.');
        }

        $token = Str::random(60);
        DB::table('api_tokens')->insert([
            'user_id'    => $user->id,
            'token'      => $token,
            'expires_at' => Carbon::now()->addMinutes(5),
            'created_at' => Carbon::now(),
        ]);

        $response = $this->call('POST', '/api/alumnos/reporte', [
            'nie' => '3437999',      // NIE existente
            'anio' => '2021',        // Año sin asignación
            'trimestre' => '1'
        ], [], [], [
            'HTTP_Authorization' => $token,
            'HTTP_Accept' => 'application/json',
        ]);

        $data = json_decode($response->getContent(), true);

        $this->assertEquals(404, $response->getStatusCode());
        $this->assertEquals('No hay asignación del alumno para el año 2021', $data['error']);
    }

}
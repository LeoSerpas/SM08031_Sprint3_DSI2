<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Carbon\Carbon;

class AsignacionNotasControllerTest extends TestCase
{
    use DatabaseTransactions;

    protected function setUp(): void
    {
        parent::setUp();
        $this->withoutMiddleware(); // <-- Desactiva el middleware de auth
    }

    public function test_reporte_api_falla_por_parametros_incompletos()
    {
        $response = $this->postJson('/api/alumnos/reporte', []);

        $response->assertStatus(422);
        $response->assertJsonStructure(['errors' => ['nie', 'anio', 'trimestre']]);
    }
}
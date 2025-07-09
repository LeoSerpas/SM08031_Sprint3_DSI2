<?php

namespace Tests\Browser;

use Laravel\Dusk\Browser;
use Tests\DuskTestCase;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class ReporteNotasTest extends DuskTestCase
{
    public function test_ver_reporte_trimestre1()
    {
        $this->browse(function (Browser $browser) {
            $browser->visit('http://127.0.0.1:8080/login')
                    ->type('email', 'leon_s054@hotmail.com')  // campo "Correo Electrónico"
                    ->type('password', 'leonardo')           // campo "Contraseña"
                    ->press('Ingresar')
                    ->pause(2000)                          // espera la redirección
                    ->assertPathIs('/gestion')            // confirma que redirigió
                    ->assertSee('BIENVENIDO')            // botón "Ingresar"
                    ->assertPathIsNot('/login')         // verificar que NO siga en login
                    ->visit('/notas')
                    ->assertSee('Gestion de Asignacion de Notas')
                    ->select('id_materia', '1')                 // ID de Matemática es 1 según <option value="1">
                    ->select('trimestre', '1')                  // Primer Trimestre tiene value="1"
                    ->pause(2000)
                    ->press('Ingresar Notas por Materia')
                    ->pause(3000)                               // espera la carga/redirección
                    ->assertPathBeginsWith('/notas/materia/1/trimestre/1')
                    ->assertSee('Asignacion de Notas');                    // verifica que se muestre el contenido esperado
        });
    }
}

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
                    ->visit('/asignacionNotas')
                    ->pause(1000)
                    ->assertSee('Reporte de Notas')
                    ->click('table tbody tr:nth-child(2) td:nth-child(3) form button')
                    ->pause(1000)
                    ->assertPathBeginsWith('/asignacionNotas/reporte1/4')
                    ->assertSee('CENTRO ESCOLAR CATOLICO SANTOTOMAS');
        });
    }
}

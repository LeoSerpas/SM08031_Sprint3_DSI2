<?php

namespace Tests\Browser;

use Laravel\Dusk\Browser;
use Tests\DuskTestCase;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class LoginTest extends DuskTestCase
{
    public function test_login_correcto()
    {
        $this->browse(function (Browser $browser) {
            $browser->visit('http://127.0.0.1:8080/login')
                    ->type('email', 'leon_s054@hotmail.com')  // campo "Correo Electrónico"
                    ->type('password', 'leonardo')           // campo "Contraseña"
                    ->press('Ingresar')
                    ->pause(2000)                          // espera la redirección
                    ->assertPathIs('/gestion')            // confirma que redirigió
                    ->assertSee('BIENVENIDO')            // botón "Ingresar"
                    ->assertPathIsNot('/login');        // verificar que NO siga en login
        });
    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Alumnos extends Model
{
    protected $fillable = ['id','nombres','apellidos','no_nie','f_nacimiento'];
    protected $dates = ['created_at','updated_at'];

    public function scopeNombre($query, $nombre)
	{
		return $query->where('nombres', 'LIKE', "%$nombre%");
	}
  public function nombreCompleto()
  {
    return $this->nombres . ' ' . $this->apellidos;
  }

}

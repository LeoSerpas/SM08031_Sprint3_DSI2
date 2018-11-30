<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AsignacionAlumnosNotas extends Model
{
    protected $fillable = ['id_asignacion','id_alumno','id_asignacion_alumno','id_materia'];
    protected $dates = ['created_at','updated_at'];

    public function scopeNombre($query, $id_alumno)
	{
		return $query->where('id_alumno', 'LIKE', "%$id_alumno%");
	}

	public function Asignaciones(){
    return $this->belongsTo('App\Asignaciones', 'id_asignacion');
  }

	public function Alumnos(){
    return $this->belongsTo('App\Alumnos', 'id_alumno');
}
  public function alumno(){
    return $this->belongsTo('App\Alumnos', 'id_alumno');
  }

  public function Materia(){
    return $this->belongsTo('App\Materias', 'id_materia');
  }

  public function AsignacionNotas(){
    return $this->hasMany('App\AsignacionNotas', 'id_asignacion_alumno');
  }

  public function Docentes(){
    return $this->hasMany('App\Docentes', 'id_docente');
  }

  

}

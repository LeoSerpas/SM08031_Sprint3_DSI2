
<div class="row">

</div>
<br><br>
<div>
   <div class="table-responsive ">
      <table class="table table-striped" id= "" style="text-align:center" >
         <thead>
            <tr>
               <th style="text-align:center">ASIGNATURAS
               </th>
               <th style="text-align:center">Act. Integradora
               </th>
               <th style="text-align:center">35% Integradora
               </th>
               <th style="text-align:center">Act. Cotidiana
               </th>
               <th style="text-align:center">35% Cotidiana
               </th>
               <th style="text-align:center">Pruebas
               </th>
               <th style="text-align:center">30% Pruebas
               </th>
               <th style="text-align:center">Promedio Trimestral
               </th>
            </tr>
         </thead>
         <tbody>
            
            @foreach ($asig_alumno as $key => $asignacion_alumno)
            <tr>
               <td>
                  @php ($notasAsignada = $asignacion_alumno->AsignacionNotas->where('id_trimestre', 1 )->first())
                  
               </td>
               <td>
                  {{ is_null($notasAsignada) ? '0' : $notasAsignada->ActividadIntegradora->first()->promedio_i }}
               </td>
               <td>
                  {{ is_null($notasAsignada) ? '0' : $notasAsignada->ActividadIntegradora->first()->prom_i_porcent  }}
               </td>
               <td>
                  {{ is_null($notasAsignada) ? '0' : $notasAsignada->ActividadCotidiana->first()->nota_cotidiana  }}
               </td>
               <td>
                  {{ is_null($notasAsignada) ? '0' : $notasAsignada->ActividadCotidiana->first()->nota_porcent  }}
               </td>
               <td>
                  {{ is_null($notasAsignada) ? '0' : $notasAsignada->Prueba->first()->promedio_p }}
               </td>
               <td>
                  {{ is_null($notasAsignada) ? '0' : $notasAsignada->Prueba->first()->prom_p_porcent }}
               </td>
               <td>
                  {{ is_null($notasAsignada) ? '0' : $notasAsignada->nota_trimestral }}
               </td>
            </tr>
            @endforeach
            
         </tbody>
      </table>
   </div>
</div>
      <div class="container col-sm-12">
        <br><br>
        <div class="col-sm-3"></div>
            <div class="table-responsive col-sm-6">
               <table class="table table-striped" id= "tabla_conductas">

                  <thead>
                    <tr></tr>
                     <tr>
                        <th with="80px">ASPECTOS DE CONDUCTA
                        </th>
                        <th with="80px" style="text-align:center">TM
                        </th>
                     </tr>
                  </thead>
                  <tbody>
                     @foreach ($asig_alumno as $key => $asignacion_alumno)
                        @php ($notaCond1 = $asignacion_alumno->asignacionConductas->where('id_trimestre', 1 )->first())
                     <tr>
                        <th>Practica valores morales y cívicos</th>
                        <td>{{ is_null($notaCond1) ? 'No asignada' : $notaCond1->Conductas->first()->moral_civica}}</td>
                      </tr>
                      <tr>
                        <th>Conducta</th>
                        <td>{{ is_null($notaCond1) ? '0' : $notaCond1->Conductas->first()->nota_conducta}}</td>
                      </tr>
                     @endforeach
                  </tbody>
               </table>
            </div>
         </div>
         <div class="col-sm-12">
          <div class="col-sm-1"></div>
           <div class="col-sm-10">
             <strong> Observaciones:</strong><br> 
            {{ is_null($notaCond1) ? '' : $notaCond1->Conductas->first()->observaciones }}
            <br><br><br><br><br>
           </div>
         </div>
         <div class="col-sm-12">F.______________________
          <div class="col-sm-8">  
          <div class="col-sm-4">F.______________________
            </div>
          </div>
        </div>
        <div class="col-sm-12">LCDA.SILVIA RAMIREZ DE UMAÑA.
          <div class="col-sm-8">  
          <div class="col-sm-4">DOCENTE 
            </div>
          </div>
        </div>
        <div class="col-sm-12">SUB-DIRECTOR
          <div class="col-sm-8">  
          <div class="col-sm-4"> 
            </div>
          </div>
        </div>        

class ColaboradoresController < ApplicationController
  def asignar_sucursal
    collaborator = Collaborator.find(params[:id])
    sucursal = Sucursal.find(params[:sucursal_id])
    distancia = params[:distancia_km]

    if distancia <= 0 || distancia > 50
      return render json: { message: "La distancia debe ser mayor que 0 y menor o igual a 50" }, status: :unprocessable_entity
    end

    if collaborator.sucursales.exists?(sucursal.id)
      return render json: { message: "El colaborador ya tiene asignada esta sucursal" }, status: :unprocessable_entity
    end

    collaborator.sucursales << sucursal
    collaborator.update(distancia_km: distancia)
    render json: { message: "Sucursal asignada correctamente" }, status: :ok
  end
end

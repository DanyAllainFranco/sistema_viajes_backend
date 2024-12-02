class ViajesController < ApplicationController
  before_action :authenticate_manager, only: [ :create ]

  def create
    viaje = Viaje.new(viaje_params)
    viaje.user_user_id = current_user.user_user_id

    total_distancia = viaje.distancias.sum { |d| d[:distancia_km] }

    if total_distancia > 100
      return render json: { message: "La suma de las distancias no puede superar los 100 km" }, status: :unprocessable_entity
    end

    viaje.total_km = total_distancia
    viaje.total_a_pagar = viaje.calculate_payment

    if viaje.save
      render json: viaje, status: :created
    else
      render json: { message: "Error al registrar el viaje" }, status: :unprocessable_entity
    end
  end

  private

  def viaje_params
    params.require(:viaje).permit(:sucu_id, :trans_id, :viaj_fecha, distancias: [ :cola_id, :distancia_km ])
  end

  def authenticate_manager
    unless current_user.role == "Gerente de tienda"
      render json: { message: "Acceso denegado" }, status: :forbidden
    end
  end
end

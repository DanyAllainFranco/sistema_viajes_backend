class ReportesController < ApplicationController
  def viajes
    viajes = Viaje.joins(:transportista)
                  .where(trans_id: params[:trans_id])
                  .where(viaj_fecha: params[:fecha_inicio]..params[:fecha_fin])
                  .select("tbviajes.*, SUM(tbviajes_detalle.distancia_km) AS total_distancia")

    total_a_pagar = viajes.sum { |viaje| viaje.total_a_pagar }

    render json: { viajes: viajes, total_a_pagar: total_a_pagar }, status: :ok
  end
end

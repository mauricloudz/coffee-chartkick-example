class HomeController < ApplicationController
  content_security_policy only: :index do |policy|
    policy.style_src :self, :unsafe_inline
  end

  def dashboard
    # Graficos de barras --------------------------------------
    @sales_last_12_months = Sale.where(:created_at => (Time.now.beginning_of_month - 12.months)..Time.now.end_of_month)
    .group("strftime('%m-%Y', created_at)")
    .order(created_at: :asc)
    .sum(:amount)

    @quantity_last_12_months = Sale.where(:created_at => (Time.now.beginning_of_month - 12.months)..Time.now.end_of_month)
    .group("strftime('%m-%Y', created_at)")
    .order(created_at: :asc)
    .count

    @monthly_average_sales = Sale.where(:created_at => (Time.now.beginning_of_month - 12.months)..Time.now.end_of_month)
    .group("strftime('%m-%Y', created_at)")
    .order(created_at: :asc)
    .average(:amount)

    # Graficos de torta por ventas segun origen del cafe
    # Ultimos 12 meses
    @pie_charts_origin_12_months = Sale.where(:created_at => (Time.now.beginning_of_month - 12.months)..Time.now.end_of_month)
    .group(:origin)
    .count

    # Ultimos 6 meses
    @pie_charts_origin_6_months = Sale.where(:created_at => (Time.now.beginning_of_month - 6.months)..Time.now.end_of_month)
    .group(:origin)
    .count

    # Ultimos 3 meses
    @pie_charts_origin_3_months = Sale.where(:created_at => (Time.now.beginning_of_month - 3.months)..Time.now.end_of_month)
    .group(:origin)
    .count

    # Ultimo mes
    @pie_charts_origin_last_month = Sale.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month)
    .group(:origin)
    .count

    # Graficos de torta por ventas segun mezcla de cafe
    # Ultimos 12 meses
    @pie_charts_blend_name_12_months = Sale.where(:created_at => (Time.now.beginning_of_month - 12.months)..Time.now.end_of_month)
    .group(:blend_name)
    .count

    # Ultimos 6 meses
    @pie_charts_blend_name_6_months = Sale.where(:created_at => (Time.now.beginning_of_month - 6.months)..Time.now.end_of_month)
    .group(:blend_name)
    .count

    # Ultimos 3 meses
    @pie_charts_blend_name_3_months = Sale.where(:created_at => (Time.now.beginning_of_month - 3.months)..Time.now.end_of_month)
    .group(:blend_name)
    .count

    # Ultimo mes
    @pie_charts_blend_name_last_month = Sale.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month)
    .group(:blend_name)
    .count

  end

end

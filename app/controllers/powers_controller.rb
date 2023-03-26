class PowersController < ApplicationController
  before_action :set_power, only: [:show, :update]

  def index
    powers = Power.all
    render json: powers
  end

  def show
    if power
      render json: power
    else
      render json: { error: "Power not found" }, status: :not_found
    end
  end

  def create
    power = Power.new(power_params)

    if power.save
      render json: power, status: :created, location:   power
    else
      render json: { errors: power.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if power.update(power_params)
      render json: power
    else
      render json: { errors: power.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_power
    power = Power.find_by(id: params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :description)
  end
end

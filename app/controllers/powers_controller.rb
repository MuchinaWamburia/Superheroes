class PowersController < ApplicationController
  before_action :set_power, only: [:show, :update]

  # GET /powers
  def index
    powers = Power.all
    render json: powers.as_json(except: [:created_at, :updated_at])
  end

  # GET /powers/:id
  def show
    if @power
      render json: @power.as_json(except: [:created_at, :updated_at])
    else
      render json: { error: "Power not found" }, status: :not_found
    end
  end

  # POST /powers
  def create
    power = Power.new(power_params)

    if power.save
      render json: power, status: :created, location: power
    else
      render json: { errors: power.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH /powers/:id
  def update
    if @power
      if @power.update(power_params)
        render json: @power.as_json(only: [:id, :name, :description])
      else
        render json: { errors: @power.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Power not found" }, status: :not_found
    end
  end

  private

  def set_power
    @power = Power.find_by(id: params[:id])
  end

  def power_params
    params.require(:power).permit(:description)
  end
end
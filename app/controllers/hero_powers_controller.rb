class HeroPowersController < ApplicationController
  # before_action :set_hero_power, only: [:show, :update, :destroy]

  # # POST /hero_powers
  # def create
  #   hero_power = HeroPower.new(hero_power_params)

  #   if hero_power.save
  #     render json: hero_power.hero, include: :powers, status: :created
  #   else
  #     render json: { errors: hero_power.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

  # private

  # # Use callbacks to share common setup or constraints between actions.
  # def set_hero_power
  #   hero_power = HeroPower.find(params[:id])
  # end

  # # Only allow a trusted parameter "white list" through.
  # def hero_power_params
  #   params.require(:hero_power).permit(:strength, :power_id, :hero_id)
  # end
    def create
        hero_power = HeroPower.create(hero_power_params)
        if hero_power
          hero = Hero.includes(:powers).find_by(id: params[:hero_id])
          render json: hero, include: { powers: { only: [:id, :name, :description] } }, only: [:id, :name, :super_name]
        else
          render json: { errors: hero_power.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def hero_power_params
        params.permit(:strength, :hero_id, :power_id)
    end
  end
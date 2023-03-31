class HeroPowersController < ApplicationController
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
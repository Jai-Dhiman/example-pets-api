class PetsController < ApplicationController
  def index
    @pets = Pet.all
    render :index
  end

  def create
    @pet = Pet.new(
    name: params[:name],
    age: params[:age],
    breed: params[:breed],
    user_id: current_user.id
    )

    if @pet.save
      render :show
    else
      render json: {errors: @pet.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @pet = Pet.find_by(id: params[:id])
    render :show
  end
end

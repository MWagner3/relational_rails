class ZoosController < ApplicationController
  def index
    @zoos = Zoo.all
  end

  def show
    @zoo = Zoo.find(params[:id])
  end

  def new

  end

  def create
    zoo = Zoo.create(zoo_params)
    zoo.save
    redirect_to "/zoos"
  end

  private
  def zoo_params
    params.permit(:name, :free_admission, :number_of_employees)
  end
end

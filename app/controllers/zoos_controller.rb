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

  def edit
    @zoo = Zoo.find(params[:id])
  end

  def update
    @zoo = Zoo.find(params[:id])
    @zoo.update(zoo_params)
    redirect_to "/zoos/#{@zoo.id}"
  end

  private
  def zoo_params
    params.permit(:name, :free_admission, :number_of_employees)
  end
end

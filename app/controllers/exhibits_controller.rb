class ExhibitsController < ApplicationController
  def index
    @exhibits = Exhibit.all
  end

  def show
    @exhibit = Exhibit.find(params[:id])
  end

  def edit
    @exhibit = Exhibit.find(params[:id])
  end

  def update
    @exhibit = Exhibit.find(params[:id])
    @exhibit.update(exhibit_params)
    redirect_to "/exhibits/#{@exhibit.id}"
  end

  private
  def exhibit_params
    params.permit(:name, :houses_deadly_creatures, :number_of_occupants)
  end
end

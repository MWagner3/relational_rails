class ZooExhibitsController < ApplicationController

  def index
    @zoo = Zoo.find(params[:zoo_id])
    @exhibits = @zoo.exhibits
  end

end

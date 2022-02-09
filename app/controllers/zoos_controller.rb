class ZoosController < ApplicationController
  def index
    @zoos = Zoo.all
  end

  def show
    @zoo = Zoo.find(params[:id])
  end

  def new
    @zoo = Zoo.new
  end
end

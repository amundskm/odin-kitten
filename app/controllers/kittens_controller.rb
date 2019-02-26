class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end

  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.create(kitten_params)
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten.update_attributes(kitten_params)
  end

  def destroy
    @kitten.find(params[:id]).destroy
  end

  private

    def kitten_params
      params.require(:kitten).premit(:name, :age, :cuteness, :softness)
    end

end

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
    redirect_to root_url
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:sucess] = "Kitten updated"
      redirect_to @kitten
    else
      flash.now[:warning] = "The kitten was not updated"
      render 'edit'
    end
  end

  def destroy
    if Kitten.find(params[:id]).destroy
      flash[:sucess] = "Kitten deleted"
      redirect_to root_url
    else
      flash.now[:warning] = "The kitten was not deleted"
    end
  end

  private

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end

end

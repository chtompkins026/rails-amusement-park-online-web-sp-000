class AttractionsController < ApplicationController 
  
  def new 
    @attraction = Attraction.new 
  end 
  
  def edit
    @attraction = Attraction.find(params[:id])
  end
  
  def index 
    @attractions = Attraction.all 
    @user = current_user 
  end 
  
  def show 
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end 
  
  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end
  
  def update
    @attraction.update(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end
  
  private 
  
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :hapiness_rating, :nausea_rating)
  end 

end 
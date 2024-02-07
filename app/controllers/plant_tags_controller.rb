class PlantTagsController < ApplicationController
  def new 
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  
  # multi select
  def create 
    @plant = Plant.find(params[:plant_id])
    
    params[:plant_tag][:tag].delete("")

    params[:plant_tag][:tag].each do |tag_id|
      tag = Tag.find(tag_id)
      @plant_tag = PlantTag.new
      @plant_tag.tag = tag
      @plant_tag.plant = @plant
      @plant_tag.save
    end
    
    redirect_to garden_path(@plant.garden)
  end

  # def create 
  #   @plant = Plant.find(params[:plant_id])
  #   @tag = Tag.find(params[:plant_tag][:tag])
    
  #   @plant_tag = PlantTag.new

  #   @plant_tag.plant = @plant
  #   @plant_tag.tag = @tag

  #   if @plant_tag.save
  #     redirect_to garden_path(@plant.garden)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end
end

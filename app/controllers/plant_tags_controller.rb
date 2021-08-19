class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @tags = Tag.where(id: params[:plant_tag][:tag])
    @plant = Plant.find(params[:plant_id])
    @tags.each do |current_tag|
      @plant_tag = PlantTag.new
      @plant_tag.plant = @plant
      @plant_tag.tag = current_tag
      @plant_tag.save
    end
    redirect_to garden_path(@plant.garden)
  end
end

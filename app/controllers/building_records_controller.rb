class BuildingRecordsController < ApplicationController

  def index
    @building_records = BuildingRecord.all
  end

  def new
    @building_record = BuildingRecord.new
  end

  def create
    @building_record = BuildingRecord.new(building_record_params)
    if @building_record.save
      redirect_to new_building_record_path,
        notice: 'Your building was recorded.'
    else
      render 'new'
    end
  end

  def show
    @building_record = BuildingRecord.find(params[:id])
  end

  def destroy
    @building_record = BuildingRecord.find(params[:id])
    @building_record.delete
    redirect_to owners_path
  end

  private
  def building_record_params
    params.require(:building_record).permit(
      :address,
      :city,
      :state,
      :postal_code
      )
  end
end

class Api::AddressUserController < ApplicationController
  def load_province
    @provinces = Province.all
    render json:
    {
      message: 'Success',
      data: @provinces
    }
  end

  def load_district_by_province_id
    @districts = District.where(_province_id: params[:id])
    render json:
    {
      message: 'Success',
      data: @districts
    }
  end

  def load_ward
    @wards = Ward.where(_district_id: params[:id])
    render json:
    { 
      message: 'Success',
      data: @wards
    }
  end
end

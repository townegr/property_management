class OwnersController < ApplicationController
  def new
    @owner = Owner.new
  end

  def index
    @owners = Owner.all
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to new_owner_path,
        notice: 'Successfully created owner'
    else
      render 'new'
    end
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy!
    redirect_to new_owner_path, notice: 'Add a new owner?'
  end

  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email)
  end
end

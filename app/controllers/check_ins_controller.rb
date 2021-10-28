class CheckInsController < ApplicationController
  before_action :find_check_in, only: [:show, :destroy]
  # before_action :require_user, only: [:show]

  def index
    @check_ins = CheckIn.all
  end

  def show; end

  def new
    @check_in = CheckIn.new
  end

  def create
    @check_in = CheckIn.new(check_in_params)

    if @check_in.valid?
      @check_in.save
      redirect_to check_in_path(@check_in)
    else
      flash[:error] = "bruh"
      render :new
    end
  end

  def destroy
    @check_in.destroy!

    redirect_to check_ins_path
  end

private

  def find_check_in
    @check_in = CheckIn.find(params[:id])
  end

  def check_in_params
    params.require(:check_in).permit(:name, :role_happiness, :company_happiness, :comment, :emotion)
  end
end
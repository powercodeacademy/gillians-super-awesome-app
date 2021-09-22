class CheckInsController < ApplicationController
  def index
    @check_ins = CheckIn.all
  end

  def show
    @check_in = CheckIn.find(params[:id])
  end

  def new
    @check_in = CheckIn.new
  end

  def create
  end
end
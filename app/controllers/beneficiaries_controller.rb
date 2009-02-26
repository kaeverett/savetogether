class BeneficiariesController < ApplicationController
  def index
    @photos = Photo.find(:all)
  end

  def new
    @photo = Photo.new
  end

  def show
    @photo = Photo.find params[:id]
  end

  def create
    @photo = Photo.create! params[:photo]
    redirect_to :action => 'show', :id => @photo
  rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end
end

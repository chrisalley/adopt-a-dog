class DogsController < ApplicationController  
  load_and_authorize_resource
  
  def index
    @dogs = Dog.order("created_at desc").page(params[:page]).per(9)
  end

  def show
    # @dog_photos = @dog.dog_photos.page(params[:page]).per(1)
  end

  def new
    @dog = Dog.new
  end

  def edit
  end
  
  def create 
    @dog = Dog.new(params[:dog])
    if @dog.save
      redirect_to @dog, :notice => "Successfully created dog."
    else
      render 'new'
    end
  end
  
  def update
    if @dog.update_attributes(params[:dog])      
      redirect_to @dog, :notice => "Successfully updated dog."
    else
      render 'edit'
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path, :notice => "Successfully destroyed dog."
  end
end
class HappyTailsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @happy_tails = HappyTail.order("created_at desc").page(params[:page]).per(5)  
  end

  def show
  end

  def new
    @happy_tail = HappyTail.new
  end

  def edit
  end
  
  def create 
    @happy_tail = HappyTail.new(params[:happy_tail])
    if @happy_tail.save
      redirect_to @happy_tail, :notice => "Successfully created happy tail."
    else
      render 'new'
    end
  end
  
  def update
    if @happy_tail.update_attributes(params[:happy_tail])      
      redirect_to @happy_tail, :notice => "Successfully updated happy tail."
    else
      render 'edit'
    end
  end

  def destroy
    @happy_tail.destroy
    redirect_to happy_tails_path, :notice => "Successfully destroyed happy tail."
  end
end
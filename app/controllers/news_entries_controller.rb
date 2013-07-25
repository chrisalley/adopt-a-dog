class NewsEntriesController < ApplicationController
  before_filter :load_resource
  authorize_resource
  
  def index
    @news_entries = NewsEntry.order("created_at desc").page(params[:page]) 
  end

  def show
  end

  def new
    @news_entry = NewsEntry.new
  end

  def edit
  end
  
  def create 
    @news_entry = NewsEntry.new(params[:news_entry])
    if @news_entry.save
      redirect_to @news_entry, :notice => "Successfully created news entry."
    else
      render 'new'
    end
  end
  
  def update
    if @news_entry.update_attributes(params[:news_entry])      
      redirect_to @news_entry, :notice => "Successfully updated news entry."
    else
      render 'edit'
    end
  end

  def destroy    
    @news_entry.destroy
    redirect_to news_path, :notice => "Successfully destroyed news entry."
  end

private

  def load_resource
    @news_entry = NewsEntry.find_by_url(params[:id])
  end
end
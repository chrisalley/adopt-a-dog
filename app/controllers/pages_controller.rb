class PagesController < ApplicationController
  before_filter :load_resource
  authorize_resource
  
  def index
    @pages = Page.order("title").page(params[:page]) 
  end

  def show
    @page = Page.find_by_url(params[:id])
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find_by_url(params[:id])
  end
  
  def create 
    @page = Page.new(params[:page])
    if @page.save
      redirect_to @page, :notice => "Successfully created page."
    else
      render 'new'
    end
  end
  
  def update
        @page = Page.find_by_url(params[:id])
    if @page.update_attributes(params[:page])      
      redirect_to @page, :notice => "Successfully updated page."
    else
      render 'edit'
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_path, :notice => "Successfully destroyed page."
  end

private

  def load_resource
    @page = Page.find_by_url(params[:id])
  end
end
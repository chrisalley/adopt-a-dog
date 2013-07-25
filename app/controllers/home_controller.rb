class HomeController < ApplicationController
  def index
    @news_entries = NewsEntry.order("created_at desc").page(params[:page]).per(5)
  end
end
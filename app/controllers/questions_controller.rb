class QuestionsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @questions = Question.order("question").page(params[:page]) 
  end

  def new
    @question = Question.new
  end

  def edit
  end
  
  def create 
    @question = Question.new(params[:question])
    if @question.save
      redirect_to questions_path, :notice => "Successfully created question."
    else
      render 'new'
    end
  end
  
  def update
    if @question.update_attributes(params[:question])      
      redirect_to questions_path, :notice => "Successfully updated question."
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, :notice => "Successfully destroyed question."
  end
end
class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      redirect_to success_feedbacks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def success
  end

  private
  
  def feedback_params
    params.require(:feedback).permit(:name, :rating, :comment)
  end
end

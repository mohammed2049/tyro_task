class FeedbacksController < ApplicationController
  has_scope :number
  has_scope :company_token
  has_scope :by_company_token
  # GET /feedbacks
  def index
    @feedbacks = apply_scopes(Feedback)
    
    render json: @feedbacks
  end

  def show_feedback
    feedback = Feedback.find_by(number: params[:number], company_token: params[:company_token])
    render json: feedback
  end

  # POST /feedbacks
  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.state = State.new(state_params)
    if @feedback.valid?
      FeedbackJob.perform_later(@feedback.attributes, @feedback.state.attributes)
      number = Rails.cache.read(@feedback.company_token) || 0
      render json: { number: number + 1 }, status: :created
    else
      render json: @feedback.errors, status: :unprocessable_entity
    end
  end

  # GET /feedbacks/count
  def count
    render json: Rails.cache.fetch(params[:company_token]) { apply_scopes(Feedback).count }, status: 200
  end

  private

  def feedback_params
    params.require(:feedback).permit(:company_token, :number, :priority)
  end

  def state_params
    params.require(:state).permit(:device, :os, :memory, :storage)
  end
end

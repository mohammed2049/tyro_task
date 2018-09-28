class FeedbackJob < ApplicationJob
  queue_as :default

  def perform(feedback_attributes, state_attributes)
    feedback = Feedback.new(feedback_attributes)
    feedback.state = State.new(state_attributes)
    feedback.save!
  end
end

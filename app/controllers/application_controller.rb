class ApplicationController < ActionController::API
  rescue_from Exception, :with => :render_exception_response

  def render_exception_response(exception)
    backtrace_cleaner = request.get_header 'action_dispatch.backtrace_cleaner'
    code = ActionDispatch::ExceptionWrapper.new(backtrace_cleaner, exception).status_code
    render json: {error: exception.message}, status: code
  end
end

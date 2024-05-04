class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def return_response(api_response)
    render json: api_response.except(%i[code status]), status: api_response[:code] || api_response[:status]
  end
end

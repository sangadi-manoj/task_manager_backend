class BaseService
  attr_accessor :params

  def initialize(params = {})
    @params = params
  end

  def success_response(response, message=nil)
    APIPayloadBuilder::Success.build(response, message)
  end

  def error_response(response, type)
    APIPayloadBuilder::Error.failure(response, type)
  end
end

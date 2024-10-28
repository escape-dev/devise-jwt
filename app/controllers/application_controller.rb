class ApplicationController < ActionController::API

  def default_response data, message, status 
    render json: { req_id: SecureRandom.uuid, message: message, data: data }, status: status
  end

  def paginate_response data, message, status
    render json: { req_id: SecureRandom.uuid, message: message, data: data, meta: paginate(data) }, status: status
  end

  def paginate data 
    {
      prev_page: data.prev_page,
      next_page: data.next_page,
      current_page: data.current_page,
      total_pages: data.total_pages
    }
  end

end

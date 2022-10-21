class RakutensController < ApplicationController
  rescue_from StandardError, with: :error500
  def search
      @items = RakutenWebService::Gora::Course.search(keyword: params[:keyword])

  end

  def error500(error)
    @items = nil
    redirect_to root_path
  end
end

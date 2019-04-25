class API::RestaurantsController < API::BaseController
  def index
    @restaurants = Restaurant.all
  end
end

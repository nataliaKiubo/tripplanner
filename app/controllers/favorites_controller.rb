class FavoritesController < ApplicationController
  def index
    policy_scope(Favorite)
     @user = User.find(params[:user_id])
    @favorite_trips = @user.favorites.map do |favorite|
        Trip.find(favorite.favoritable_id)
    end
  end
end

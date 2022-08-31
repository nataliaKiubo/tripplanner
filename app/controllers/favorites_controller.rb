class FavoritesController < ApplicationController
  def index
    @favorites = policy_scope(Favorite)

    #@favorite_trips = Favorite.joins(:trips, :users)
    #@favorites = Favorite.all
    @user = User.find(params[:user_id])
    @favorites = Favorite.where(favoritor_id: @user.id)
    @favorite_trips = @favorites.map do |favorite|
        Trip.find(favorite.favoritable_id)
    end


    # sql_query = <<~SQL
    #   favorites.user_id = :query
    #   AND trips.user_id = :query
    # SQL
    # @favorites = Favorite.joins(:trip).where(sql_query, query: current_user.id)

    authorize @favorites
  end
end

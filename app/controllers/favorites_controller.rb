class FavoritesController < ApplicationController
  def index
    @favorites = policy_scope(Favorite)
    sql_query = <<~SQL
      favorites.user_id = :query
      OR trips.user_id = :query
    SQL
    @favorites = Favorite.joins(:trip).where(sql_query, query: current_user.id)
    authorize @favorites
  end
end

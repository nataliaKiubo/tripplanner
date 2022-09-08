class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @trips = Trip.last(6)
    @users = User.last(4)
  end
end

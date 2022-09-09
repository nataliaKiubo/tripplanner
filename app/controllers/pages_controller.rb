class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @trips = Trip.where(id: [35, 37, 60, 38, 61, 97])
    @users = User.where(id: [13, 14, 15, 16, 17, 18])
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: [ :root ]

  def home
  end
end

class UserController < ApplicationController
  before_action :authenticate_user!
  layout "user"
  def welcome
  end
end

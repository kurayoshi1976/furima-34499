class ItemsController < ApplicationController
  before_action :authenticate_user!, expect: [:new]

  def new
    @item = Item.new
  end

  private
    def move_to_signed_in?
      unless user_signed_in?
        redirect_to '/users/sign_in'
end

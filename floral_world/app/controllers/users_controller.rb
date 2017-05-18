class UsersController < ApplicationController

  def index
    @products_user = Product.where('user_id = ?', current_user.id)
  end

end
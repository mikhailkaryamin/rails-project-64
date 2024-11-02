# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super

    @minimum_password_length = User.password_length.min
  end
end

class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end

  protected

  def build_resource(hash = nil)
    super

    if session[:omniauth]
      resource.authentications.build(session[:omniauth])
    end
  end
end

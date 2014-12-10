class Users::AuthenticationsController < Devise::OmniauthCallbacksController

  def twitter
    callback
  end

  def facebook
    callback
  end

  def github
    callback
  end

  private

  def omniauth
    @omniauth ||= request.env['omniauth.auth'].slice(:provider, :uid)
  end

  def authentication
    @authentication ||= Authenticaiton.find_by(provider: omniauth[:provider], uid: omniauth[:uid])
  end

  def callback
    render text: omniauth    
  end

end

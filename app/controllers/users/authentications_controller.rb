class Users::AuthenticationsController < Devise::OmniauthCallbacksController

  def twitter
    redirect_to_next
  end

  def facebook
    redirect_to_next
  end

  def github
    redirect_to_next
  end

  private

  def omniauth
    @omniauth ||= request.env['omniauth.auth'].slice(:provider, :uid)
  end

  def authentication
    @authentication ||= Authentication.find_by(provider: omniauth[:provider], uid: omniauth[:uid])
  end

  def redirect_to_next
    if authentication
      sign_in(authentication.user)
      redirect_to root_path, notice: "User signed in."
    elsif user_signed_in?
      redirect_to root_path, notice: "User has signed in."
    else
      user = User.new(oauth_user_params)
      user.authentications.build(provider: omniauth.provider, uid: omniauth.uid)

      if user.save
        sign_in(user)
        redirect_to root_path, notice: "User created."
      end

      redirect_to new_user_session_path, notice: "Could not create the account."
    end
  end

  def oauth_user_params
    hash = request.env['omniauth.auth'][:info].slice(:name, :nickname, :image)
    if hash.key?(:nickname)
      { name: hash[:nickname], icon: hash[:image] }
    else
      hash
    end
  end

end

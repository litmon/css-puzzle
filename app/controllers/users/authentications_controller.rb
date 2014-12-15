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
    redirect_params = user_signed_in? && { path: edit_user_session_path, notice: 'Add authentication' } || { path: authenticated_root_path }

    user = current_user || authentication.try(:user) || User.new(oauth_user_params)
    auth = authentication || user.authentications.build(provider: omniauth.provider, uid: omniauth.uid)

    if user.save
        sign_in(user) unless user_signed_in?
        redirect_to redirect_params[:path], redirect_params.slice(:notice)
    else
      redirect_to new_user_session_path
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

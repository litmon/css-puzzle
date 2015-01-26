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

  def redirect_to_next
    redirect_params = user_signed_in? && 
      { path: edit_user_session_path, notice: 'Add authentication' } || 
      { path: authenticated_root_path }

    user = current_user || authentication.try(:user) || User.new(oauth_user_params)
    auth = authentication || user.authentications.build(omniauth.merge(oauth_tokens))

    if user.save
        sign_in(user) unless user_signed_in?
        redirect_to redirect_params[:path], redirect_params.slice(:notice)
    else
      redirect_to new_user_session_path
    end
  end

  def oauth_params
    @oauth_params ||= ActionController::Parameters.new(request.env['omniauth.auth'])
  end

  def oauth_user_params
    @oauth_user_params ||= oauth_params.permit(info: [:name, :image])[:info]
  end

  def oauth_tokens
    @oauth_tokens ||= oauth_params.permit(credentials: [:token, :secret])[:credentials]
  end

  def omniauth
    @omniauth ||= oauth_params.permit(:provider, :uid)
  end

  def authentication
    @authentication ||= Authentication.find_by(omniauth)
  end

end

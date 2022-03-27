module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # @current_userにすでに現在のログインユーザが代入されていたら何もせず、
    # 代入されていなかったらUser.find_by(...)からログインユーザを取得し、
    # @current_userに代入する処理を1行で書いたものです。
  end

  def logged_in?
    !!current_user
  end

end

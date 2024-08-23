module ApplicationCable
    class Connection < ActionCable::Connection::Base
      # 必要に応じて、接続時の認証やユーザー識別のロジックをここに追加します
      # 例:
      # identified_by :current_user
      #
      # def connect
      #   self.current_user = find_verified_user
      # end
      #
      # private
      #
      # def find_verified_user
      #   if verified_user = User.find_by(id: cookies.signed[:user_id])
      #     verified_user
      #   else
      #     reject_unauthorized_connection
      #   end
      # end
    end
end
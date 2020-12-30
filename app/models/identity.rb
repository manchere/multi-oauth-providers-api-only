class Identity < ApplicationRecord
  belongs_to :user

  def find_or_create(auth)
    unless auth_user = find_by_provider_and_uid(auth['provider'], auth['uid'])
      user = User.create name: auth['info']['name'], email: auth['info']['email']
      auth_user = User.create user: user, uid: auth['uid'], provider: auth['provider']
    end
    
    auth_user
  end
end

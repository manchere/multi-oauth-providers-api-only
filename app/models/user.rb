class User < ApplicationRecord

  has_secure_password

  #Association
  has_many :identities

  
  def add_provider(auth)
    unless identities.find_by_provider_and_uid(auth['provider'],auth['uid'])
      Identity.create user: self, provider: auth['provider'], uid: auth['uid']
    end
  end
end

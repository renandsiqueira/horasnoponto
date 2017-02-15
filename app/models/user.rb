class User < ApplicationRecord
	has_many :authorizations
	validates :email, presence: true

	def self.create_from_hash!(hash)
  	create(email: hash.info.email)
  end
end

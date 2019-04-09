class Author < ApplicationRecord
    has_many :article, dependent: :destroy
    BCrypt::Engine.cost = 15
    has_secure_password

    enum role: [:creator, :reviewer, :admin]
    after_initialize :set_default_role, :if => :new_record?

    def set_default_role
      self.role ||= :creator
    end

    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

    def self.searchByEmail(email)
      if email
        suggestions= where('email LIKE ?', "%#{email}_%")
        suggestions.limit(10).map { |t| { label: t.email, value: t.id } }
      end
    end
end

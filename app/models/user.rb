class User < ApplicationRecord
  has_secure_password validations: false
  validates :name, presence: true, length: {minimum: 3}, uniqueness: true,
            format: {with: /\A([a-zA-Z]+)(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])\z/,
                     message: (I18n.t 'activerecord.errors.models.user.attributes.name.invalid_format')}
  validates :password, presence: true, confirmation: true, length: {in: 6..20}

  scope :admins, -> {where(admin: true)}

  after_destroy :ensure_an_admin_remains

  class Error < StandardError
  end

  private

  def ensure_an_admin_remains
    if User.admins.empty?
      raise Error.new I18n.t 'exceptions.user.last_admin'
    end
  end
end

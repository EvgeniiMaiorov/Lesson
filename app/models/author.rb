class Author < ApplicationRecord
  before_create -> { self.token = generate_token }
  has_many :books

  validates :name, presence: true

  private

  def generate_token
    loop do
      token = SecureRandom.hex
      return token unless Author.exists?({ token: token })
    end
  end
end

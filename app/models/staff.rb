class Staff < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :staff_tel, presence: true, length: { maximum: 13 },
                    format: { with: /\A[0-9]+-[0-9]+-[0-9]+\z/i }
    validates :cheo_id, presence: true, length: { maximum: 13 },
                    format: { with: /\A[a-z0-9]+\z/i }
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
end


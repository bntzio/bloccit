class Summary < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :description, length: { minimum: 12, maximum: 140 }, presence: true
end

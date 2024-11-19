class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  has_one_attached :image

  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "Category can't be blank"}
  validates :sales_status_id, numericality: { other_than: 1 , message: "Sales status can't be blank"}
  validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "Shipping fee status can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "Prefecture can't be blank"}
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "Scheduled delivery can't be blank"}
  validates :price, presence: true, numericality: { in: 300..9_999_999 }, format: { with: /\A\d+\z/ }
  validates :image, presence: true

end

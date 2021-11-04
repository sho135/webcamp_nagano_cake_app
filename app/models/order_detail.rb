class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  validates :item_id, :order_id, :amount, :price, presence: true

  enum making_status: {
    着手不可: 0,
    制作待ち: 1,
    製作中: 2,
    制作完了: 3
  }

end

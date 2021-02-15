module EndUser::OrdersHelper
   # 小数点切り捨てはfloor,３桁区切りはto_s(:delimited)
    # 税込の計算
    def tax_price(price)
      (price*1.1).floor
    end

    # 小計の計算
    def sub_price(sub)
      (tax_price(sub.item.price) * sub.amount)
    end
    
    # 合計金額の計算
    def total_price(totals)
      price = 0
      totals.each do |total|
        price += sub_price(total)
      end
      return price
    end
    
    # 請求金額の計算
    def billing(order)
      total_price(current_end_user.cart_items) + order.postage
    end
end

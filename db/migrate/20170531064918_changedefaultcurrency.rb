class Changedefaultcurrency < ActiveRecord::Migration[5.0]
  def change
    change_column_default :movies, :price_currency, 'AUD'
  end
end

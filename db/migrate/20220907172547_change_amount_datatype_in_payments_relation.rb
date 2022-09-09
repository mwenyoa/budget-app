class ChangeAmountDatatypeInPaymentsRelation < ActiveRecord::Migration[7.0]
  def change
    change_column(:payments, :amount, :integer, default: 0)
  end
end

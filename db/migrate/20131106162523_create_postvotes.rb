class CreatePostvotes < ActiveRecord::Migration
  def change
    create_table :postvotes do |t|
      t.belongs_to :post
      t.timestamps
    end
  end
end

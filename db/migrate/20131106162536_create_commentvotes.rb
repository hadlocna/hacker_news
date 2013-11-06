class CreateCommentvotes < ActiveRecord::Migration
  def change
    create_table :commentvotes do |t|
      t.belongs_to :comment
      t.timestamps
    end
  end
end

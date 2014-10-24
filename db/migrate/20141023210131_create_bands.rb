class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :title
    end
  end
end

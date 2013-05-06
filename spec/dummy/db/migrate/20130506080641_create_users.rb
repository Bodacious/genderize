class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.with_options(null: false) do |r|
        r.string :name, limit: 20
        r.string :gender, limit: 1
      end
      t.timestamps
    end
  end
end

class CreateUserWithOpts < ActiveRecord::Migration
  def change
    create_table :user_with_opts do |t|
      t.string :gender

      t.timestamps null: false
    end
  end
end

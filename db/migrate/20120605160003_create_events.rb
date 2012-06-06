class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :gid
      t.string :name
      t.string :description
      t.string :status
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end

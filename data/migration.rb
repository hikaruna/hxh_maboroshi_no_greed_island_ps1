class Migration < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
    end
    create_table :dungeons do |t|
      t.string  :name
      t.integer :floors
      t.boolean :hidden
      t.text    :remarks
      t.references :area
    end
    create_table :abillities do |t|
      t.string :name
      t.integer :ap
      t.integer :np
      t.integer :time
      t.text :remarks
    end
  end
end

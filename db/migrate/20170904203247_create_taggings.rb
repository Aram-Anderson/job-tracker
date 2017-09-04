class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true

      t.timestamps
    end
  end
end

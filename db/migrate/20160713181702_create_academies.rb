class CreateAcademies < ActiveRecord::Migration[5.0]
  def change
    create_table :academies do |t|
      t.string :name
      t.text :description
      t.string :cnpj
      t.string :phone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

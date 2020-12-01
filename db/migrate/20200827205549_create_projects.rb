class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.enum :status
      t.belongs_to :client, index: true

      t.timestamps
    end
  end
end

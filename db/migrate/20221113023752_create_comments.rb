class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text 'comment'
      t.references 'report'
      t.references 'manager'
    end
  end
end

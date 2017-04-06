class CreateStaffMenbers < ActiveRecord::Migration
  def change
    create_table :staff_menbers do |t|
      t.string  :email,                null: false                    #メールアドレス
      t.string  :email_for_index,      null: false                    #検索用メールアドレス
      t.string  :family_name,          null: false
      t.string  :given_name,           null: false
      t.string  :family_name_kana,     null: false                    #姓カナ
      t.string  :given_name_kana,      null: false                    #名カナ
      t.string  :hashed_passwordered
      t.date    :start_date,           null: false
      t.date    :end_date
      t.boolean :suspended,            null: false, default: false   #停止フラグ

      

      t.timestamps null: false
    end

    add_index :staff_menbers,     :email_for_index,   unique: true
    add_index :staff_menbers,     [ :family_name_kana, :given_name_kana ]

  end
end

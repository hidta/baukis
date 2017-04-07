StaffMember.create!(
  email:           Faker::Internet.email, 
  familiy_name:    "田中",
  given_name:      "太郎",
  familiy_name_kana: "ヤマダ",
  given_name_kana:   "タロウ",
  password:         "password",
  start_date:       "Date.today"
)
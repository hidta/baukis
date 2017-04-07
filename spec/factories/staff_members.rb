FactoryGirl.define do
  factory   :staff_member do
    sequence(:email) { |n| "member#{n}@example.com"}
    family_name       "田中",
    given_name        "太郎",
    family_name_kana  "ヤマダ",
    given_name_kana   "タロウ",
    password          "password",
    start_date      { Date.yesterday }
    end_date nil
    suspeded false
  end
end
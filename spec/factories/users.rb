FactoryBot.define do
  factory :user do
    nickname              {'abe'}
    email                 {'test@example'}
    password              {'a1b2c3'}
    encrypted_password    {password}
    surname               {'阿部'}
    name                  {'太郎'}
    surname_kana          {'アベ'}
    name_kana             {'タロウ'}
    birthday              {'2000-01-01'}
  end
end
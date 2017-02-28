FactoryGirl.define do
  factory(:worker) do
    email('worker@person.com')
    password('password')
    password_confirmation('password')
  end
end

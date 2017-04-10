require 'spec_helper'

describe 'routing' do
  example 'staff top page' do
    expect(get: 'http://baukis.example.com').to route_to(
      # get:~ で指定したURLにアクセスした場合にparamsにセットされるハッシュの内容を()に記述
      # get: は適宜postなどに変更するべし namespace :admin do
      host: 'baukis.example.com',
      controller: 'staff/top',
      action: 'index'
    )
  end

  example 'admin login form' do
    expect(get: 'http://baukis.example.com/admin/login').to route_to(
      host: 'baukis.example',
      controller: 'admin/sessions',
      action: 'new'
    )
  end
end
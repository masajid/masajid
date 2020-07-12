every :day, at: '4:00 am' do
  rake 'content:purge_authentication_tokens'
end

every :day, at: '4:30 am' do
  rake 'content:newsletters'
end

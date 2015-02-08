namespace :th do
  desc "TODO"
  task update_out: :environment do
    puts Profile.count
    u = User.first
    u.update_out_profiles2
    puts Profile.count
  end

  desc "TODO"
  task update_in: :environment do
    puts Profile.count
    u = User.first
    u.update_in_profiles
    puts Profile.count
  end
end

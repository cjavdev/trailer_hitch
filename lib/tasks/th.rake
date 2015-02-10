namespace :th do
  desc "TODO"
  task update_out: :environment do
    puts Profile.count
    u = User.first
    begin
      u.update_out_profiles2
    ensure
      puts Profile.count
    end
  end

  desc "TODO"
  task update_in: :environment do
    puts Profile.count
    u = User.first
    begin
      u.update_in_profiles2
    ensure
      puts Profile.count
    end
  end

  task update: :environment do
    puts Profile.count
    u = User.first
    begin
      puts "UPDATING IN --- "
      u.update_in_profiles2
      puts "UPDATING OUT --- "
      u.update_out_profiles2
      puts "DONE --- "
    ensure
      puts Profile.count
    end
  end
end

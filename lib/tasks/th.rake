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
    # begin
      puts "UPDATING IN --- "
      u.update_in_profiles2
      puts "UPDATING OUT --- "
      u.update_out_profiles2
      puts "DONE --- "
    # rescue => e
    #   puts e.message
    #   puts "Going to try again in 20 min"
    #   # UpdateFollowersJob.set(wait_until: 20.minutes.from_now).perform_later(u)
    #   puts Profile.count
    # ensure
      puts Profile.count
    # end
  end

  task unfollow_non_followers: :environment do
    u = User.first
    u.followed_non_followers.find_each do |p|
      puts "Unfollowing #{ p.name }"
      begin
        p.unfollow!
      rescue
        debugger
      end
    end
  end

  task follow_followers_of: :environment do
    u = User.first
    u.twitter_client.followers("insidermonkey").each do |follower|
      next if u.out_profile_exists_for?(follower.id)
      puts "Following #{ follower.name }"
      u.twitter_client.follow(follower.id)
    end
  end
end

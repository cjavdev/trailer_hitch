class AddProfileDmFlags < ActiveRecord::Migration
  def change
    add_column :profiles, :thanked_for_following, :boolean, default: false
    add_column :profiles, :asked_initial_question, :boolean, default: false

    Profile.update_all(
      thanked_for_following: true,
      asked_initial_question: true
    )
  end
end

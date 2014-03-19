# This migration comes from farm_tools_engine (originally 20140317061105)
class CreateSocialNetworkingProfiles < ActiveRecord::Migration
  def change
    create_table :social_networking_profiles do |t|
      t.string :fb_app_id
      t.string :fb_app_secret
      t.string :fb_fan_page
      t.string :fb_person_id
      t.string :twitter_id
      t.string :twitter_handle

      t.string :has_social_networking_id
      t.string :has_social_networking_type

      t.timestamps
    end
  end
end

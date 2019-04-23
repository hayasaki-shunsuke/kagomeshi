# frozen_string_literal: true

namespace :db do
  namespace :files do
    desc "Upload files."
    task load: :"db:fixtures:load" do
      User.order(:created_at).each do |user|
        filename = "#{user.email}.jpg"
        dir = Rails.root.join("test", "fixtures", "files", "users", "avatars")
        path = Rails.root.join(dir, filename)
        unless File.exist?(path)
          filename = "default.jpg"
          path = Rails.root.join(dir, filename)
        end
        user.avatar.attach(io: open(path), filename: filename)
      end

      Restaurant.order(:created_at).each do |restaurant|
        filename = "#{restaurant.name}.jpg"
        dir = Rails.root.join("test", "fixtures", "files", "restaurants", "images")
        path = Rails.root.join(dir, filename)
        unless File.exist?(path)
          filename = "default.jpg"
          path = Rails.root.join(dir, filename)
        end
        restaurant.image.attach(io: open(path), filename: filename)
      end
    end
  end
end

Rake::Task["db:fixtures:load"].enhance do
  Rake::Task["db:files:load"].execute
end

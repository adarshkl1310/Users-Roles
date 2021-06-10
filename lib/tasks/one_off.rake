desc “populate roles”
task :populate_roles => :environment do
Role.where(code: ‘default’).first_or_create.update(name: ‘Default’)
Role.where(code: ‘moderator’).first_or_create.update(name: ‘Moderator’)
Role.where(code: ‘contributor’).first_or_create.update(name: ‘Contributor’)
end

desc “set default role”
task :default_roles => :environment do
default = Role.where(code: ‘default’)
moderator = Role.where(code: ‘moderator’)
contributor = Role.where(code: ‘contributor’)

User.update_all(role_id: default.id)
User.find_by(username: ‘adarsh’, last_name: ‘Bush’).update(role_id: moderator.id)
User.find_by(username: ‘adarsh’, last_name: ‘Bush’).update(role_id: contributor.id)
end

desc “role tasks”
task :roles_all => [:populate_roles, :default_roles] do
puts “Finished Role Tasks”
end
def select_applications
  app_config_dir = 'config/projects/'
  app_dirs = Dir.entries(app_config_dir).select do
    |entry| File.directory? File.join(app_config_dir,entry) and !(entry =='.' || entry == '..')
  end
  puts "Selecte applications to deploy:"

  app_dirs.each_with_index do |app, index|
    puts "[#{index}] #{app}"
  end
  print "Select application: "
  selection = STDIN.gets.chomp.to_i

  app_dirs[selection]
end

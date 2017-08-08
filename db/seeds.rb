User.delete_all
Bicycle.delete_all
Usage.delete_all
Category.delete_all
Suggestion.delete_all

Category.create([{name: 'Cruizer'}, {name: 'BMX'}, {name: 'Hybrit'}, {name: 'Mountain'}, {name: 'Road'}, {name: 'Folding'}])
Rake::Task["database:import_data"].invoke

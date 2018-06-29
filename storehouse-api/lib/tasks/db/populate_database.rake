namespace :db do
  desc 'Populate database with prepared data'
  task populate: :environment do
    files_content = TaskServices::JsonFilesParse.get_content(
      "#{Rails.root}/#{ENV['DATA_FILES_DIR']}"
    )
    data = TaskServices::PopulateData.new(files_content)
    data.write_in!
    puts "All categories and products were created"
  end
end

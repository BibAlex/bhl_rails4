namespace :I18n_difference do
  desc 'check_i18n_locales_differences'
  task :check_i18n_differences => :environment do
    English_file = HashWithIndifferentAccess.new(YAML.load(File.read("/home/ba/work/bhl_rails4/config/locales/en.yml")))
    Arabic_file = HashWithIndifferentAccess.new(YAML.load(File.read("/home/ba/work/bhl_rails4/config/locales/ar.yml")))
    diff_main_items = English_file["en"].keys - Arabic_file["ar"].keys
    print diff_main_items
    print "\n"
    English_file["en"].each do |key, value|
      unless Arabic_file["ar"][key].nil?
        diff = English_file["en"][key].keys - Arabic_file["ar"][key].keys
        unless diff.blank?
          print key
          print "\n"
          print diff
          print "\n"
        end
      end
    end
  end
end

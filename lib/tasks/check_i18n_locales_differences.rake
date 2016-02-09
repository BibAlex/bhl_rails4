require 'i18n_compare_yaml_files'

namespace :I18n_difference do
  desc 'check_i18n_locales_differences'
  task :check_i18n_differences => :environment do
    i18n_lang_files = []

    Dir.glob(File.join(Rails.root, "config", "locales", "*.yml")).each do |lang_file|
      # only add files with names more than 6 digits
      # (anything looks like en.yml)
      if lang_file.split("/")[-1].length == 6
        i18n_lang_files << {file_name: lang_file.split("/")[-1], content: File.read(lang_file)}
      end
    end

    i18n_lang_files.each do |main_lang_file|
      puts "\n#{main_lang_file[:file_name]}"
      puts "======"
      i18n_lang_files.each do |compare_to_lang_file|
        unless main_lang_file[:file_name] == compare_to_lang_file[:file_name]
          compare_results = I18nCompareYamlFiles.compare(main_lang_file[:content], compare_to_lang_file[:content])
          compare_results.each do |k,v|
            puts "#{k}: #{v}"
          end
        end
      end
    end
  end
end

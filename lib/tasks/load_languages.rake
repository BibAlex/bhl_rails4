namespace :bhl do
  desc 'Fill database with languages(code, title)'
  task :load_languages => :environment do
    xml_file_path = File.open(File.join(Rails.root, "lib", "assets", "languages.xml"))
    languages_xml = Nokogiri::XML(xml_file_path)
    languages_xml.xpath("//languages//code").each do |lang_xml|
      lng_code = lang_xml.attr("val")
      language = Language.find_or_create_by(code: lng_code)
      language.name = lang_xml.xpath(".//lang").text
      language.save
    end
  end
end
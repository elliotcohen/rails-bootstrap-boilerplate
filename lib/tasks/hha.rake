desc "Get list of home health agencies from Home Care Alliance"
task :hha_get_list do
  agent = Mechanize.new
  page = agent.get("http://www.thinkhomecare.org/associations/1892/agency")
  
  hha_r = [['Name', 'Address', 'Phone', 'Website', 'Description']]
  
  hha_list = page.search("div#divResults/table[2]")[0]
  hha_list.children.each do |row|
    row.children.css('a').each do |hha|
      name = hha.text.strip
      
      pop_up = agent.get("http://www.thinkhomecare.org/" + hha['href'])
      
      addr1 = pop_up.search('#recDetailData22').text.strip
      addr2 = pop_up.search('#recDetailData25').text.strip
      phone = pop_up.search('#recDetailData20').text.strip
      website = pop_up.search('#recDetailData30').text.strip
      service_codes = pop_up.search('#recDetailData122').text.strip
      service_desc = pop_up.search('#recDetailData121').text.strip
      description = service_codes + "\n\n" + service_desc
      
      hha_r << [name, addr1 + " " + addr2, phone, website, description]
    end
  end
  
  #output hha_r as a CSV
  fname = Rails.root.join("tmp/hha.csv")
  CSV.open(fname, 'wb') do |csv|
    hha_r.each do |row|
      csv << row
    end
  end
end
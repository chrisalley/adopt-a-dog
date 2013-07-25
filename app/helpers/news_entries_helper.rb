module NewsEntriesHelper
  
  def short_date(news_entry)
    month = Date::MONTHNAMES[news_entry.created_at.month].capitalize.slice(0..2)
    day = news_entry.created_at.day.to_s
    return month + " " + day
  end 
  
end

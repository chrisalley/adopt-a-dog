atom_feed do |feed|
  feed.title("Adopt a Dog")
  feed.updated(@news_entries.first.created_at)

  for news_entry in @news_entries
    feed.entry(news_entry) do |entry|
      entry.title(news_entry.title)
      entry.content(markdown_to_html(news_entry.content), :type => 'html')
    end
  end
end
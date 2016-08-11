#recents.record-list.col-md-6
  h2
    | Recents
  - recents.each_with_index do |recent,i|
    - data = recent["data"]
    - title = recent["title"]
    - description = recent["description"]
    .panel.panel-default
      .panel-heading
        a href="#{data}"
          = "#{title}"
        a href="\#recent-#{i}" aria-expanded="false" data-toggle="collapse"
          | More
      .collapse id="recent-#{i}"
        .panel-body
          = "#{description}"

#bests.record-list.col-md-6

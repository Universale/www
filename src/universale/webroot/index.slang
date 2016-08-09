#recents.record-list.col-md-6
  h2
    | Recents
  ul
    - recents.each do |recent|
      li.record
        - data = recent["data"]
        - title = recent["title"]
        a href="#{data}"
          = "#{title}"

#bests.record-list.col-md-6

#recents.record-list.col-md-12
  h2 Categories
  ul
    - categories.each do |category|
      li.record
        - name = category[:name]
        a href="/categories/#{name}/records"
          = "#{name}"

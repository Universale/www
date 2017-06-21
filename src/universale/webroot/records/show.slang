.record
  h1 = record[:title]
  - data = record[:data]
  a.data href="#{data}" data
  .description = record[:description]

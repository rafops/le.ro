class Page
  include MongoMapper::Document

  # download page html
  # remove all javascript
  # only allowed to download if logged through twitter
  # put job on queue to download page assets when possible
  # until assets not downloaded, use the original assets
  # joint an minifize all css
  # compress images to lowest quality
  # replace page assets reference
  # use only body, remove all head. if there is some css inline on head, put it on assets ball
end

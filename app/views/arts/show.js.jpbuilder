json.extract! @art, :name, :content, :preview, :preview_thumb, :source, :date, :views, :votes, :tags, :sequence, :colors
json.nextArt Art.where({:_id => {:$lt => @art}}).sort({:_id => 1}).last
json.previousArt Art.where({:_id => {:$gt => @art}}).sort({:_id => 1}).first


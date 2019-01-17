class Application

#  Item.new("Tome de chevre", 4.58)
#  Item.new("Foie gras de canard", 12.73)

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("items").last
      if item = @@items.find{ |i| i.name == item_name }
        resp.write item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
#    resp = Rack::Response.new
#    req = Rack::Request.new(env)

#    if req.path.match(/items/)
#      item_name = req.path.split("items").last
#      if my_item = @@items.find{|item| item.name == item_name}
#        resp.write "#{my_item.price}"
#      else
#        resp.status = 400
#        resp.write "Item not found"
#      end
#    else
#      resp.status = 404
#      resp.write "Route not found"
#    end

#    resp.finish
#  end

end

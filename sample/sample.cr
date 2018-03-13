require "../src/router"

struct WebServer
  # Add Router functions to WebServer
  include Router

  # Define a method to draw routes of your server
  # Here we define
  # GET  "/"
  # GET  "/user/:id"
  # POST "/user"
  def draw
    # Define index access for this server
    # We just print a result "Hello router.cr!" here
    get "/" do |context, params|
      context.response.print "Hello router.cr!"
      context
    end

    # You can get path parameter from `params` param
    # It's a Hash of String => String
    get "/user/:id" do |context, params|
      context.response.print params["id"]
      context
    end

    # Currently you can define a methods in following list
    # get     -> GET
    # post    -> POST
    # put     -> PUT
    # patch   -> PATCH
    # delete  -> DELETE
    # options -> OPTIONS
    # Here we define POST route
    post "/user" do |context, params|
      context
    end
  end

  # Running this server on port 3000
  # router_handler getter of RouteHandler
  # that's defined in Router module

end

WebServer.new.run 3000

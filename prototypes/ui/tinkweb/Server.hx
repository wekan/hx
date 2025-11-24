#if js
import tink.http.Response;
import tink.web.routing.*;
import tink.core.Outcome;
import tink.io.Source;
import tink.http.containers.NodeContainer;
import tink.http.Header;
import tink.http.Header.HeaderField;
#elseif php
import tink.http.Response;
import tink.web.routing.*;
import tink.core.Outcome;
import tink.io.Source;
import tink.http.containers.PhpContainer;
import tink.http.Header.HeaderField;
#end

class Server {
    static function main() {
#if js
        var container = new NodeContainer(8080); 
#elseif php
        var container =  PhpContainer.inst; //use PhpContainer instead of NodeContainer when targeting PHP
#end
        var router = new Router<Root>(new Root());
        container.run(function(req) {
            trace("Received request: " + req.header.url);
            return router.route(Context.ofRequest(req))
                .map(outcome -> {
                    var response = switch outcome {
                        case Success(r):
                            trace("Sending response");
                            r;
                        case Failure(e):
                            trace("Error: " + Std.string(e));
                            new OutgoingResponse(
                                new ResponseHeader(500, "Internal Server Error", [
                                    HeaderField.contentType("text/plain")
                                ]),
                                tink.Chunk.ofString("Internal Server Error")
                            );
                    };
                    return response;
                });
        });

        // Removed the infinite loop to prevent blocking the PHP server
    }
}

class Root {
    public function new() {}
    
    @:get('/')
    @:get('/$name')
    public function hello(name = 'World'):OutgoingResponse {
        return new OutgoingResponse(
            new ResponseHeader(200, "OK", [
                HeaderField.contentType("text/html")
            ]),
            tink.Chunk.ofString("<html><body><h1>Hello, $name!</h1></body></html>")
        );
    }
}

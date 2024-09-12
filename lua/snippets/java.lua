local ls = require("luasnip")
ls.setup_snip_env()


local START_SNIPPET = [[public class <> {
    public static void main(String[] args) {
        <>
    }
}]]

local HTTP_HANDLER_SNIPPET = [[import java.io.OutputStream;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;

public class <> implements HttpHandler {
    public void handle(HttpExchange exchange) throws IOException {
        exchange.sendResponseHeaders(<>,<>);
        OutputStream response = exchange.getResponseBody();
        <>
        response.close();
    }
}]]

ls.add_snippets("java",{
    s("start",fmt(START_SNIPPET,{i(1),i(2)},{delimiters="<>"})),
    s(
        "httphandler",
        fmt(
            HTTP_HANDLER_SNIPPET,
            {i(1),i(2),i(3),i(4),},
            {delimiters="<>"}
        )
    ),
})

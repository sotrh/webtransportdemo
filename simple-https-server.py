import http.server
import ssl

server_address = ('localhost', 4443)
context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
context.load_cert_chain("certs/certificate.pem", "certs/certificate.key")

with http.server.HTTPServer(server_address, http.server.SimpleHTTPRequestHandler) as server:
    server.socket = context.wrap_socket(server.socket, server_side=True)
    print(f'serving on https://{server_address[0]}:{server_address[1]}')
    server.serve_forever()

import App
import Vapor

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)
//配置本地地址
app.http.server.configuration.hostname = "192.168.8.106"
//app.http.server.configuration.port = 23
defer { app.shutdown() }
try configure(app)
try app.run()

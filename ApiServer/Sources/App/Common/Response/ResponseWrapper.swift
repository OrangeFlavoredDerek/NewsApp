//
//  ResponseWrapper.swift
//  App
//
//  Created by RandyWei on 2021/3/26.
//

import Vapor

class ResponseWrapper<T:Codable>: Codable {
    private var code: ApiCode!
    private var msg: String = ""
    private var data: T?
    
    init(code: ApiCode) {
        self.code = code
        self.msg = code.getMsg()
    }
    
    init(data: T) {
        self.code = ApiCode.success
        self.data = data
        self.msg = ApiCode.success.getMsg()
    }
    
    init(code: ApiCode , data: T) {
        self.code = code
        self.msg = ApiCode.success.getMsg()
        self.data = data
    }
    
    init(code: ApiCode, msg: String) {
        self.code = code
        self.msg = msg
    }
    
    func makeResponse() -> String {
        var result = ""
        
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(self)
            result = String(data: data, encoding: .utf8)!
        } catch {
            print("Encode error")
        }
        return result
    }
    
    func makeFutureResponse(req: Request) -> EventLoopFuture<String> {
        /*
         当应用程序启动时，它通常会为运行它的CPU中的每个核心创建一个 event loop。每个 event loop 只有一个线程。
         每次客户端连接到服务器时，它将被分配给一个event loops。
         从这时候开始，服务器和客户端之间的所有通信都将发生在同一个 event loop 上(通过关联，该 event loop 的线程)。
         event loop 负责跟踪每个连接的客户机的状态。
         如果客户端有一个等待读取的请求，event loop 触发一个读取通知，然后数据被读取。一旦读取了整个请求，等待该请求数据的任何 futures 都将完成。
         */
        let promise = req.eventLoop.makePromise(of: String.self) // 在路由闭包中，你可以通过 Request 访问当前事件循环。
        
        var result = ""
        
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(self)
            result = String(data: data, encoding: .utf8)!
        } catch {
            print("Encoder error")
        }
        promise.succeed(result)
        
        return promise.futureResult
    }
}

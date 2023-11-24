import Foundation
import Moya

class BaseProvider<T : BaseAPITarget> : MoyaProvider<T> {
    
    required init(isLogger:Bool) {
        
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
        
        var plugins = [PluginType]()
        if(isLogger){
            plugins.append(networkLogger)
        }
        super.init(plugins: plugins)
    }
}

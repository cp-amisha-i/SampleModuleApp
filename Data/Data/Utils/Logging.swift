//
//  Logging.swift
//  NoLonely
//
//  Created by Amisha I on 04/03/22.
//

import Foundation
import CocoaLumberjack
import CocoaLumberjackSwift

public func LogD(_ message: @autoclosure () -> String) {
    return DDLogVerbose(message())
}

public func LogE(_ message: @autoclosure () -> String) {
    return DDLogError(message())
}

public func LogW(_ message: @autoclosure () -> String) {
    return DDLogWarn(message())
}

public func LogI(_ message: @autoclosure () -> String) {
    return DDLogInfo(message())
}

public func addDDLoggers() {
#if DEBUG
    DDLog.add(DDOSLogger.sharedInstance)            // console logger
#else
    let fileLogger: DDFileLogger = DDFileLogger()   // File Logger
    fileLogger.rollingFrequency = 0
    fileLogger.maximumFileSize = 1 * 1024 * 1024
    fileLogger.logFileManager.maximumNumberOfLogFiles = 2
    DDLog.add(fileLogger)
#endif
}

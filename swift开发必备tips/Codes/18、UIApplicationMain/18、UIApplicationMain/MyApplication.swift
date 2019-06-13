//
//  MyApplication.swift
//  18、UIApplicationMain
//
//  Created by hs on 2019/6/12.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit

class MyApplication: UIApplication {
    
    override func sendEvent(_ event: UIEvent) {
        
        print("Event sent: \(event)")
        guard event.type == .touches else {
            return
        }
        super.sendEvent(event)
    }
}

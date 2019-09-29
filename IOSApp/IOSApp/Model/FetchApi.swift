//
//  FetchApi.swift
//  IOSApp
//
//  Created by Luc Brulet on 28/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation
import Nikka

class MyProvider:HTTPProvider {
    var baseURL = URL(string:"https://wger.de/api/v2")!
}

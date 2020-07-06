//
//  String+Utils.swift
//  RyanAirTest
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation

extension String {
    var lastPathComponent: String {
        return URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent
    }
}

public func safeprint(_ entry: Any) {
	#if DEBUG
	print("DEBUG: \(Date()) ** \(entry)")
	#endif
}

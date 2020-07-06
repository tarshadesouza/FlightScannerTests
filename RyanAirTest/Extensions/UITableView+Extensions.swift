//
//  UITableView+Extensions.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
	
	func registerNib<T: UITableViewCell>(_ type: T.Type) {
		register(T.nib, forCellReuseIdentifier: T.nibName)
	}
	
	func registerNibWithBundle<T: UITableViewCell>(_ type: T.Type) {
		register(T.nibWithBundle, forCellReuseIdentifier: T.nibName)
	}
	
	func registerClass<T: UITableViewCell>(_ type: T.Type) {
		register(T.self, forCellReuseIdentifier: T.nibName)
	}
	
	func dequeueReusableCell<T: UITableViewCell>(cellType: T.Type = T.self) -> T? {
		return self.dequeueReusableCell(withIdentifier: cellType.nibName) as? T
	}
	
	func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath, cellType: T.Type = T.self) -> T? {
		return self.dequeueReusableCell(withIdentifier: cellType.nibName, for: indexPath) as? T
	}
	
}

public extension UITableViewCell {
	static var nibName: String {
		return NSStringFromClass(self).components(separatedBy: ".").last!
	}
	
	static var nib: UINib {
		return UINib(nibName: nibName, bundle: nil)
	}
	
	static var nibWithBundle: UINib {
		return UINib(nibName: nibName, bundle: Bundle(for: self))
	}
}

protocol ReusableViewProtocol: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableViewProtocol where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIView: ReusableViewProtocol { }

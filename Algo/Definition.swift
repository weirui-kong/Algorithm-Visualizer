//
//  Definition.swift
//  Algorithm Visualizer (iOS)
//
//  Created by 孔维锐 on 2021/12/12.
//

import Foundation

enum MajorView{
    case home
    case tree
    case sort
}

enum TreeType {
    case BT //Binary tree
    case BST //Binary search tree
    case BBST //Balanced binary search tree
}
enum Lang{
    case English
    case Chinese
    case German
}

enum Sorting {
    case bubble, selection, quick, merge, cocktail
    var sortingSpeed: TimeInterval {
        switch self {
        case .bubble:       return 0.6
        case .selection:   return 1.0
        case .quick:        return 1.3
        case .merge:        return 1.3
        case .cocktail:     return 0.8
        }
    }
}


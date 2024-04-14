//MARK: - Return the converted value to radians/degrees

extension Double {
    
    var radians: Double {
        return self * .pi / 180
    }
    
    var degrees: Double {
        return self * 180 / .pi
    }
}

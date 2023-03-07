//
//  SPLabel.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import Foundation
import UIKit

// SP stands for Sepia Pets
class SPLabel: UILabel {

    var size: CGFloat = FontSizes.body.rawValue
    var color: UIColor = .black
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // This will call `awakeFromNib` in your code
        setup()
    }
    
    func configure(type: FontSizes, _ color: UIColor = .black) {
        self.size = type.rawValue
        self.color = color
        setup()
    }
    
    private func setup() {
        self.textColor = color
        self.font = SPFonts.KohinoorDevanagari.Regular.size(size)
    }
}

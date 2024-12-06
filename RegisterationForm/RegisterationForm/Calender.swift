//
//  PopUpTimeZone.swift
//  Sales C2
//
//  Created by Aneesha on 10/10/23.
//  Copyright © 2023 Apple. All rights reserved.

import UIKit

class Calender: UIView {
  
    @IBOutlet weak var popupView: UIView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetuP(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    }
    
    func loadXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "Calender", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view!
    }
    
    func xibSetuP(frame: CGRect) {
        let view = loadXib()
        view.frame = frame
        addSubview(view)
    }
}

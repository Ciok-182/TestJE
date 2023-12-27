//
//  ProductTableViewCell.swift
//  TestJE
//
//  Created by Jorge Encinas on 27/12/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        name.text = nil
        price.text = nil
    }
    
    func configureView(data: Product) {
        name.text = data.name
        price.text = "$ \(data.price)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

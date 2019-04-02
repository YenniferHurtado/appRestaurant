

import UIKit

class CustomDatosPlatosTableViewCell: UITableViewCell {
    
    var imagenesPlatos = [String:String]()

    @IBOutlet weak var imagePlato: UIImageView!
    
    @IBOutlet weak var tituloPlato: UILabel!
    
    @IBOutlet weak var subtituloPlato: UILabel!
    
    @IBOutlet weak var precioPlato: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imagenesPlatos = ["":""]
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

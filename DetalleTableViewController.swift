
import UIKit

class DetalleTableViewController: UITableViewController {

    var parametro2 = [String:String]()
    
    @IBOutlet weak var imagenP: UIImageView!
    @IBOutlet weak var nombreP: UILabel!
    @IBOutlet weak var precioP: UILabel!
    @IBOutlet weak var descripcionP: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "v2_logo")
        self.navigationItem.titleView = UIImageView(image: logo)
        
        //valores iniciales
        nombreP.text = parametro2["nombre_plato"]
        if let nombreImg = parametro2["archivo_plato"] {
        imagenP.image = UIImage(named: nombreImg)
        }
        precioP.text = parametro2["precio_plato"]
        descripcionP.text = parametro2["descripcion_plato"]
    }

    @IBAction func agregandoPreferido(_ sender: Any) {
    }
    @IBAction func agregarOrden(_ sender: Any) {
    }
    
    
}

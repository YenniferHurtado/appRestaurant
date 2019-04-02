
import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayCategoria = [[String:String]]()
    var objDAO = DataBase()

    @IBOutlet weak var tablaCategoria: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCategoria.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaCategoria", for: indexPath) as! CategoriaTableViewCell
        
        let nombreCategoria = arrayCategoria[indexPath.row]["nombre_categoria"]
        
        celda.nombreCatCelda.text = nombreCategoria
        return celda
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categoria2platos" {
            
            if let indexPath = self.tablaCategoria.indexPathForSelectedRow {
            let categoriaSelected = arrayCategoria[indexPath.row]
            let objDestino = segue.destination as! PlatosTableViewController
            objDestino.parametro1 = categoriaSelected
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayCategoria = objDAO.ejecutarSelect("SELECT * FROM categoria_platos") as! [[String:String]]
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }

  

}

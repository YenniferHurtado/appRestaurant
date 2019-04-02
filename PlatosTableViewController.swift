import UIKit

class PlatosTableViewController: UITableViewController {
   
    var arrayPlatos = [[String:String]]()
    var parametro1 = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confNavBar()
        //leer la tabla de platos
        if let idCategoria = parametro1["id_categoria"] {
        let query = "SELECT * FROM platos_comidas WHERE id_categoria = \(idCategoria)"
        print(query)
        arrayPlatos = DataBase().ejecutarSelect(query) as! [[String : String]]
        }
    }
    
    //colocar imagen background

    func confNavBar(){
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "v2_barra_titulo"), for: .default)
        
//colocar titulo de fondo como imagen
        
        let logo = UIImage(named: "v2_logo")
        self.navigationItem.titleView = UIImageView(image: logo)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.tabBarController?.tabBar.barTintColor = UIColor(patternImage: UIImage(named: "patronColor")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return arrayPlatos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CeldaPlato", for: indexPath) as! CustomDatosPlatosTableViewCell
        let index = arrayPlatos[indexPath.row]
        //declarar objeto desde el array
        let nombreP = index["nombre_plato"]
        let descrip = index["descripcion_plato"]
        let precioP = index["precio_plato"]
        if let archivoP = index["archivo_plato"] {
        cell.imagePlato.image = UIImage(named: archivoP)
        }
        cell.tituloPlato.text = nombreP
        cell.subtituloPlato.text = descrip
        cell.precioPlato.text = precioP
    
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "platos2detalle" {
            if var indexPath = tableView.indexPathForSelectedRow{
                let objPlato = self.arrayPlatos[indexPath.row]
                
                let objVDestinoDetalle = segue.destination as! DetalleTableViewController
                objVDestinoDetalle.parametro2 = objPlato
            }
        }
    }
    

}

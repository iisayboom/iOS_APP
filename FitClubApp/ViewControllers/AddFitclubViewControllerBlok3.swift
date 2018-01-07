import UIKit
import RealmSwift

class AddFitclubViewControllerBlok3: UIViewController, UIPickerViewDelegate,UINavigationControllerDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    
    @IBOutlet weak var pickerview1: UIPickerView!
    @IBOutlet weak var pickerview2: UIPickerView!
    @IBOutlet weak var pickerview3: UIPickerView!
    
    let realm = try! Realm()
    
    var exercise1: Oefening?
    var exercise2: Oefening?
    var exercise3: Oefening?
    var fitclub : Fitclub?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exercise1 = realm.objects(Spiergroep.self)[0].oefeningen[0]
        exercise2 = realm.objects(Spiergroep.self)[1].oefeningen[0]
        exercise3 = realm.objects(Spiergroep.self)[2].oefeningen[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var rowCount : Int = (realm.objects(Spiergroep.self)[0].oefeningen.count)
        
        if pickerView == pickerview2 {
            rowCount = (realm.objects(Spiergroep.self)[1].oefeningen.count)
        } else if pickerView == pickerview3 {
            rowCount = (realm.objects(Spiergroep.self)[2].oefeningen.count)
        }
        return rowCount;
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerview1 {
            return realm.objects(Spiergroep.self)[0].oefeningen[row].naam
        } else if pickerView == pickerview2 {
            return realm.objects(Spiergroep.self)[1].oefeningen[row].naam
        } else if pickerView == pickerview3 {
            return realm.objects(Spiergroep.self)[2].oefeningen[row].naam
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerview1 {
            exercise1 = realm.objects(Spiergroep.self)[0].oefeningen[row]
        } else if pickerView == pickerview2 {
            exercise2 = realm.objects(Spiergroep.self)[1].oefeningen[row]
        } else if pickerView == pickerview3 {
            exercise3 = realm.objects(Spiergroep.self)[2].oefeningen[row]
        }
    }
    
    
    @IBAction func goToOverviewFitclubs() {
        if fitclub?.naam != "" && fitclub?.blokken.count == 3 {
            performSegue(withIdentifier: "showAllFitclubs", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAllFitclubs" {
            self.fitclub?.blokken.append(Blok(id: "3"))
            self.fitclub?.blokken[2].oefeningen.append(exercise1!)
            self.fitclub?.blokken[2].oefeningen.append(exercise2!)
            self.fitclub?.blokken[2].oefeningen.append(exercise3!)
        }
    }
    
}

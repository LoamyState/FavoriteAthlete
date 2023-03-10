import UIKit

/* App Outline:
 “What model object(s) will you need for this app?
 Athlete
 
 What properties will the model object(s) need?
 Name, Picture, Team, stats
 
 In addition to the view controller provided in the starter project, what other controllers will you need?
 other view controllers, athlete controller?
 
 What properties and functions will the controllers need?”
 update ui, update list of athletes, sort?
 */

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
    }

    var athletes: [Athlete] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = athlete.name
        content.secondaryText = athlete.description
        cell.contentConfiguration = content
        
        return cell
    }
    
    @IBSegueAction func addAthlete(_ coder: NSCoder) -> AthleteFormViewController? {
        return AthleteFormViewController(coder: coder)
    }
    
    @IBSegueAction func editAthlete(_ coder: NSCoder, sender: Any?) -> AthleteFormViewController? {
        let athleteToEdit: Athlete?
        if let cellTapped = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cellTapped) {
            athleteToEdit = athletes[indexPath.row]
        } else {
            athleteToEdit = nil
        }
        return AthleteFormViewController(coder: coder, athlete: athleteToEdit)
    }
    
    @IBAction func addAthleteToTable(segue: UIStoryboardSegue) {
        guard let viewController = segue.source as? AthleteFormViewController,
              let athlete = viewController.athlete else {return}
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            athletes[selectedIndexPath.row] = athlete
        } else {
            athletes.append(athlete)
        }
        
    }
    
    
}

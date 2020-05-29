import Cocoa

class DataViewController: NSViewController{
    
    @IBOutlet var codeforcesLabel: NSTextField!
    @IBOutlet var codechefLCLabel: NSTextField!
    @IBOutlet var codechefLTLabel: NSTextField!
    @IBOutlet var spojLabel: NSTextField!
    @IBOutlet var interviewbitLabel: NSTextField!
    @IBOutlet var codechefCOLabel: NSTextField!
    @IBOutlet var interviewbitStreakLabel: NSTextField!
    
    // SET your usernames here.
    var codeForcesUserName: String = "abhijeet_ar"
    var codeChefUserName: String = "abhijeet_ar"
    var spojUserName: String = "abhijeet_ar"
    var interviewBitUserName: String = "abhijeet_ar"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    
    override func viewWillAppear() {
        super.viewWillAppear()
        view.window?.styleMask.remove(.resizable)
        updateData()
        
    }
    

    @objc override func mouseMoved(with theEvent: NSEvent) {
        NSCursor.pointingHand.set()
    }
    @IBAction func quit(_ sender: NSButton) {
       
        NSApplication.shared.terminate(self)
        
    }
    
    func updateData() -> Void {
    
            let cc_url = "https://competitive-coding-api.herokuapp.com/api/codechef/\(codeChefUserName)"
            let ib_url = "https://competitive-coding-api.herokuapp.com/api/interviewbit/\(interviewBitUserName)"
            let cf_url = "https://competitive-coding-api.herokuapp.com/api/codeforces/\(codeForcesUserName)"
            let s_url = "https://competitive-coding-api.herokuapp.com/api/spoj/\(spojUserName)"
    
            codeforcesDataRequest(url: cf_url).getCodeforcesData { results in
                           switch results {
                               case .success(let results):
                                let respondeData = results
                                
//                                print("""
//
//                                        ---CodeForces---
//
//                                    rating: \(respondeData.rating)
//
//                                    """)
                                DispatchQueue.main.async {
                                    self.codeforcesLabel.stringValue = String(describing: respondeData.rating)
                                }
                           case .failure( _):
                                     codeforcesDataRequest(url: cf_url).getCodeforcesData { results in
                                                               switch results {
                                                                   case .success(let results):
                                                                    let respondeData = results
                                                        
                                                                    DispatchQueue.main.async {
                                                                        self.codeforcesLabel.stringValue = String(describing: respondeData.rating)
                                                                    }
                                                                   case .failure(let error):
                                                                        print(error)
                                                                   }
                                                           }
                               }
                       }
            interviewbitDataRequest(url: ib_url).getinterviewbitData { results in
                    switch results {
                    case .success(let results):
//                        print("""
//                                ---InterviewBit---
//
//                            rank: \(results.rank)
//                            score: \(results.score)
//                            streak: \(results.streak)
//
//                            """)
                        DispatchQueue.main.async {
                            self.interviewbitLabel.stringValue = String(describing: results.rank)
                        }
                        let streak = results.streak + " streak"
                        DispatchQueue.main.async {
                            self.interviewbitStreakLabel.stringValue = String(describing: streak)
                        }
                    case .failure( _):
                          interviewbitDataRequest(url: ib_url).getinterviewbitData { results in
                                            switch results {
                                            case .success(let results):
                                                DispatchQueue.main.async {
                                                    self.interviewbitLabel.stringValue = String(describing: results.rank)
                                                }
                                                let streak = results.streak + " streak"
                                                DispatchQueue.main.async {
                                                    self.interviewbitStreakLabel.stringValue = String(describing: streak)
                                                }
                                            case .failure(let error):
                                                print(error)
                                            }
                                        }
                    }
                }
    
            codechefDataRequest(url: cc_url).getinterviewbitData { results in
                    switch results {
                    case .success(let results):
                        let contests = results.contests
                        let longChallenge = contests[0]
                        let cookOff = contests[1]
                        let lunchTime = contests[2]
//                        print("""
//                                ---codechef---
//
//                            Long Challenge rating: \(longChallenge.rating)
//                            Cook-off rating: \(cookOff.rating)
//                            Lunch Time rating: \(lunchTime.rating)
//
//                            """)
                        let strLC = "LC " + String(longChallenge.rating)
                        let strCO = "CO " + String(cookOff.rating)
                        let strLT = "LT " + String(lunchTime.rating)
                        DispatchQueue.main.async {
                            self.codechefCOLabel.stringValue = String(describing: strCO)
                        }
                        DispatchQueue.main.async {
                            self.codechefLCLabel.stringValue = String(describing: strLC)
                        }
                        DispatchQueue.main.async {
                            self.codechefLTLabel.stringValue = String(describing: strLT)
                        }
                    case .failure( _):
                       codechefDataRequest(url: cc_url).getinterviewbitData { results in
                                            switch results {
                                            case .success(let results):
                                                let contests = results.contests
                                                let longChallenge = contests[0]
                                                let cookOff = contests[1]
                                                let lunchTime = contests[2]
                                                let strLC = "LC " + String(longChallenge.rating)
                                                let strCO = "CO " + String(cookOff.rating)
                                                let strLT = "LT " + String(lunchTime.rating)
                                                DispatchQueue.main.async {
                                                    self.codechefCOLabel.stringValue = String(describing: strCO)
                                                }
                                                DispatchQueue.main.async {
                                                    self.codechefLCLabel.stringValue = String(describing: strLC)
                                                }
                                                DispatchQueue.main.async {
                                                    self.codechefLTLabel.stringValue = String(describing: strLT)
                                                }
                                            case .failure(let error):
                                                print(error)
                                            }
                                        }
                    }
                }
    
            spojDataRequest(url: s_url).getspojData { results in
    
                    switch results {
                    case .success(let results):
//                        print("""
//
//                                ---SPOJ---
//
//                            rank: \(results.rank)
//                            points: \(results.points)
//
//                            """)
                        DispatchQueue.main.async {
                            self.spojLabel.stringValue = String(describing: results.points)
                        }
                    case .failure( _):
                         spojDataRequest(url: s_url).getspojData { results in
                            
                                            switch results {
                                            case .success(let results):
                                                DispatchQueue.main.async {
                                                    self.spojLabel.stringValue = String(describing: results.points)
                                                }
                                            case .failure(let error):
                                                print(error)
                                            }
                            
                                        }
                    }
    
                }
            
            }
    
}

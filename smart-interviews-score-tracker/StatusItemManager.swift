import Cocoa

class StatusItemManager: NSObject {
    
    var statusItem: NSStatusItem?
    var popover: NSPopover?
    var dataVC: DataViewController?
    
    override init() {
        super.init()
        
        initStatusItem()
        initPopover()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        initStatusItem()
        initPopover()
    }
    
    fileprivate func initStatusItem() {
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        let itemImage = NSImage(named: "icon")
        itemImage?.isTemplate = true
        statusItem?.button?.image = itemImage
        
        statusItem?.button?.target = self
        statusItem?.button?.action = #selector(showDataVC)
    }
    @objc func showDataVC() {
        guard let popover = popover, let button = statusItem?.button else { return }
        if dataVC == nil {
            let storyboard = NSStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateController(withIdentifier: .init(stringLiteral: "dataID")) as? DataViewController else { return }
            dataVC = vc
        }
        popover.contentViewController = dataVC
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
    }

    fileprivate func initPopover() {
        popover = NSPopover()
        popover?.behavior = .transient
    }
 
}

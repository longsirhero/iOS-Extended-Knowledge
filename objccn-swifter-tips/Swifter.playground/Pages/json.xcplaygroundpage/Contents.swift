
import Foundation

let jsonString = "{\"menu\": {" +
                 "\"id\": \"file\"," +
                 "\"value\": \"File\"," +
                 "\"popup\": {" +
                    "\"menuitem\": [" +
                        "{\"value\": \"New\", \"onclick\": \"CreateNewDoc()\"}," +
                        "{\"value\": \"Open\", \"onclick\": \"OpenDoc()\"}," +
                        "{\"value\": \"Close\", \"onclick\": \"CloseDoc()\"}" +
                    "]" +
                "}" +
            "}}"

let json: Any = try! JSONSerialization.jsonObject(
    with: jsonString.data(using: .utf8, allowLossyConversion: true)!,
    options: [])

if let jsonDic = json as? NSDictionary {
    if let menu = jsonDic["menu"] as? [String: AnyObject] {
        if let popup: AnyObject = menu["popup"] {
            if let popupDic = popup as? [String: AnyObject] {
                if let menuItems: AnyObject = popupDic["menuitem"] {
                    if let menuItemsArr = menuItems as? [AnyObject] {
                        if let item0 = menuItemsArr[0]
                            as? [String: AnyObject] {
                                if let value: AnyObject = item0["value"] {
                                    print(value)
                                }
                        }
                    }
                }
            }
        }
    }
}

if let jsonDic = json as? NSDictionary,
   let menu = jsonDic["menu"] as? [String: AnyObject],
   let popup = menu["popup"],
   let popupDic = popup as? [String: AnyObject],
   let menuItems = popupDic["menuitem"],
   let menuItemsArr = menuItems as? [AnyObject],
   let item0 = menuItemsArr[0] as? [String: AnyObject],
      let value = item0["value"]
{
    print(value)
}

struct Obj: Codable {
    let menu: Menu
    struct Menu: Codable {
        let id: String
        let value: String
        let popup: Popup
    }
    
    struct Popup: Codable {
        let menuItem: [MenuItem]
        enum CodingKeys: String, CodingKey {
            case menuItem = "menuitem"
        }
    }
    
    struct MenuItem: Codable {
        let value: String
        let onClick: String
        
        enum CodingKeys: String, CodingKey {
            case value
            case onClick = "onclick"
        }
    }
}

let data = jsonString.data(using: .utf8)!
do {
    let obj = try JSONDecoder().decode(Obj.self, from: data)
    let value = obj.menu.popup.menuItem[0].value
    print(value)
} catch {
    print(error)
}


#UIKit Fundamentals
* Course: https://www.udacity.com/course/uikit-fundamentals--ud788

# Course Map
* 1. Outlet and Action
* 2. Presenting View Controllers
* 3. The Delegate Pattern
* 4. Tables
* 5. Navigation
* 6. MemeMe Techniques


# 1. Outlet and Action
### 1.1. Control view components programmatically
- Create UI view instances and attach to the screen programmatically
- Add actions for UIControlEvents programmatically<br>

~~~swift
// label
let label = UILabel()
label.frame = CGRect(x: 150, y: 150, width: 60, height: 60)
label.text = "0"
view.addSubview(label)
self.label = label

// button
let button = UIButton()
button.frame = CGRect(x: 150, y: 250, width: 60, height: 60)
button.setTitle("Click", for: .normal)
button.setTitleColor(UIColor.blue, for: .normal)
button.addTarget(self, action: #selector(ViewController.incrementCount), for: UIControlEvents.touchUpInside)
view.addSubview(button)

// button2
let button2 = UIButton()
button2.frame = CGRect(x: 250, y: 250, width: 60, height: 60)
button2.setTitle("Click", for: .normal)
button2.setTitleColor(UIColor.blue, for: .normal)
button2.addTarget(self, action: #selector(ViewController.decrementCount), for: UIControlEvents.touchUpInside)
view.addSubview(button2)
~~~

### 1.2. Using Storyboard
- Create UI views in Storyboard
- Add @IBOutnet annotations and make links as variables to the views in Storyboard
- Add @IBAction annotations and make links as event actions from the views in Storyboard


# 2. Presenting View Controllers
### 2.1. Add Scenes in Storyboard
- Add a new scene in Storyboard by dragging "View Controller" from the object library
- Create new Controller that extending UIViewController
- Make a link between the scene and controller by setting the controller name as custom class in the identity inspector

### 2.2. Open next scene
1. @IBAction + programmatically
    * Add an IBAction function and link to the view
    * Define the function and set variables of the next controller
    ~~~swift
    var controller: NextViewController
    controller = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
    controller.value = 1

    present(controller, animated: true, completion: nil)
    ~~~

2. Using "Present Modally" segue + @IBAction + performSegue() + prepare()
    * Link "Present Modally" segue from the current controller to next controller
    * Set [segue name(id)] as the segue's identifier
    ~~~
    "selected"  // [segue name(id)]
    ~~~
    * Add an IBAction function and link to the view
    * Define the function and just call performSegue()
    ~~~swift
    performSegue(withIdentifier: "selected", sender: sender)
    ~~~
    * Override prepare() function and set variables of the next controller
    ~~~swift
    if segue.identifier == "selected" {
        let controller = segue.destination as! RoshamboResultViewController
        controller.userChoice = getRoshambo(button: (sender as! UIButton))
    }
    ~~~

3. Using "Present Modally" segue + UIButton trigger + prepare()
    * Link "Present Modally" segue from the current controller to next controller
    * Set [segue name(id)] as the segue's identifier
    ~~~
    "selected"  // [segue name(id)]
    ~~~
    * Link "selected" segue as Triggered segue action
    * Override prepare() function and set variables of the next controller
    ~~~swift
    if segue.identifier == "selected" {
        let controller = segue.destination as! RoshamboResultViewController
        controller.userChoice = getRoshambo(button: (sender as! UIButton))
    }
    ~~~

# 3. The Delegate Pattern
1. Delegate pattern is similar to Java Interface pattern.
    * But don't need to override unused functions.

2. UITextFieldDelegate
    * Before typing - textFieldShouldBeginEditing()
        - https://developer.apple.com/documentation/uikit/uitextfielddelegate/1619601-textfieldshouldbeginediting
    * Typing - textFieldDidBeginEditing()
        - https://developer.apple.com/documentation/uikit/uitextfielddelegate/1619590-textfielddidbeginediting
    * Focus to be changed during typing - textFieldShouldEndEditing()
        - https://developer.apple.com/documentation/uikit/uitextfielddelegate/1619592-textfieldshouldendediting
    * End typing - textFieldDidEndEditing()
        - https://developer.apple.com/documentation/uikit/uitextfielddelegate/1619591-textfielddidendediting
    * Control Text - textField(textField, shouldChangeCharactersIn, replacementString)
        - https://developer.apple.com/documentation/uikit/uitextfielddelegate/1619599-textfield
    * Show "X" clear button in Editor box - textFieldShouldClear()
        - https://developer.apple.com/documentation/uikit/uitextfielddelegate/1619594-textfieldshouldclear
    * Define a process return key
        - https://developer.apple.com/documentation/uikit/uitextfielddelegate/1619603-textfieldshouldreturn

# 4. Tables
# 5. Navigation
# 6. MemeMe Techniques

//
//  ViewController.swift
//  Veerabathini_SearchApp
//
//  Created by Veerabathini,Saitej on 2/27/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        seacrhButtonOutlet.isEnabled = false
        nextButtonOutlet.isHidden = true
        previousButtonOutlet.isHidden = true
        resetButtonOutlet.isHidden = true
        resultImage.image = UIImage(named: "hello")
        
    }
    @IBOutlet weak var seacrhButtonOutlet: UIButton!
    
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet weak var previousButtonOutlet: UIButton!
    @IBOutlet weak var resetButtonOutlet: UIButton!
    @IBAction func resetButtonClick(_ sender: Any) {
        nextButtonOutlet.isHidden = true
        previousButtonOutlet.isHidden = true
        resetButtonOutlet.isHidden = true
        topicInfoText.text = nil
        seacrhTextField.text = nil
        resultImage.image = UIImage(named: "hello")
        img = 0
        titleOutlet.text = nil
    }
    @IBOutlet weak var titleOutlet: UILabel!
    
    var actor_title = ["Iron Man","Captain America","Thor","Wonder Woman","Captain Marvel","Doctor Strange"]
    var car_title = ["Lamborghini","Ferrari","Audi","Rolls Royce","Mustang","BMW"]
    var food_title = ["Biryani","Sambar","Shawarma","Panner Butter Masala","Thali","Ice Cream"]
    
    var arr_img = [["iron-man","captain-america","thor","wonder-woman","captain-marvel","doctor-strange"],["lamborghini","ferrari","audi","rolls-royce","mustang","bmw"],["biryani","sambar","shawarma","paneer","thali","ice-cream"]]
    
    var arr_topics = ["actors","cars","meals"]
    
    var actor_keywords = ["actor","actors","hero","protagonist","celebrities"]
    var car_keywords = ["car","cars","motor","four wheeler","automobile","vehicle"]
    var food_keywords = ["food","meal","cuisine","bread","brunch","edibles"]
    
    var actor = ["A wealthy American business magnate, playboy, philanthropist, inventor and ingenious scientist, Anthony Edward Stark suffers a severe chest injury during a kidnapping. When his captors attempt to force him to build a weapon of mass destruction, he instead creates a mechanized suit of armor to save his life and escape captivity. Later, Stark develops his suit, adding weapons and other technological devices he designed through his company, Stark Industries. He uses the suit and successive versions to protect the world as Iron Man. Although at first concealing his true identity, Stark eventually publicly reveals himself to be Iron Man.","The character wears a costume bearing an American flag motif, and he utilizes a nearly-indestructible shield that he throws as a projectile. Captain America is the alter ego of Steve Rogers, a frail young artist enhanced to the peak of human perfection by an experimental super-soldier serum after joining the military to aid the United States government's efforts in World War II. Near the end of the war, he was trapped in ice and survived in suspended animation until he was revived in modern times. Although Captain America often struggles to maintain his ideals as a man out of his time, he remains a highly respected figure both with the American public and in the superhero community, which includes becoming the long-time leader of the Avengers.","Thor is a prominently mentioned god throughout the recorded history of the Germanic peoples, from the Roman occupation of regions of Germania, to the Germanic expansions of the Migration Period, to his high popularity during the Viking Age, when, in the face of the process of the Christianization of Scandinavia, emblems of his hammer, Mjölnir, were worn and Norse pagan personal names containing the name of the god bear witness to his popularity.","Wonder Woman's Bronze Age origin story relates that she was sculpted from clay by her mother Queen Hippolyta and was given a life as an Amazon, along with superhuman powers as gifts by the Greek gods. In 2011, DC changed her background with the retcon that she is the biological daughter of Zeus and Hippolyta, jointly raised by her mother and her aunts Antiope and Menalippe. The character has changed in depiction over the decades, including briefly losing her powers entirely in the late 1960s; by the 1980s, artist George Perez gave her an athletic look and emphasized her Amazonian heritage.[12][13] She possesses an arsenal of magical items, including the Lasso of Truth, a pair of indestructible bracelets, a tiara which serves as a projectile, and, in older stories, a range of devices based on Amazon technology.","Captain Marvel is a 2019 American superhero film based on Marvel Comics featuring the character Carol Danvers / Captain Marvel. Produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures, it is the 21st film in the Marvel Cinematic Universe (MCU). The film was written and directed by Anna Boden and Ryan Fleck, with Geneva Robertson-Dworet also contributing to the screenplay. Brie Larson stars as Carol Danvers, alongside Samuel L. Jackson, Ben Mendelsohn, Djimon Hounsou, Lee Pace, Lashana Lynch, Gemma Chan, Annette Bening, Clark Gregg, and Jude Law. Set in 1995, the story follows Danvers as she becomes Captain Marvel after Earth is caught in the center of a galactic conflict between two alien civilizations.","The character begins as an extremely talented but egotistical surgeon who loses the ability to operate after a car crash severely damages his hands beyond repair. Searching the globe for healing, he encounters the Ancient One, the Sorcerer Supreme. Strange becomes his student, and learns to be a master of both the mystical and the martial arts. He acquires an assortment of mystical objects, including the powerful Eye of Agamotto and Cloak of Levitation, and takes up residence in a mansion referred to as the Sanctum Sanctorum, located in 177A Bleecker Street, Greenwich Village, New York City. Strange assumes the title of Sorcerer Supreme and, with his friend and valet Wong, defends the world from mystical threats."]
    
    var car = ["Ferruccio Lamborghini, an Italian manufacturing magnate, founded Automobili Ferruccio Lamborghini S.p.A. in 1963 to compete with Ferrari. The company was noted for using a rear mid-engine, rear-wheel drive layout. Lamborghini grew rapidly during its first decade, but sales plunged in the wake of the 1973 worldwide financial downturn and the oil crisis. The firm's ownership changed three times after 1973, including a bankruptcy in 1978. American Chrysler Corporation took control of Lamborghini in 1987 and sold it to Malaysian investment group Mycom Setdco and Indonesian group V'Power Corporation in 1994. In 1998, Mycom Setdco and V'Power sold Lamborghini to the Volkswagen Group where it was placed under the control of the group's Audi division.","Ferrari S.p.A. (/fəˈrɑːri/; Italian: [ferˈraːri]) is an Italian luxury sports car manufacturer based in Maranello, Italy. Founded by Enzo Ferrari in 1939 from the Alfa Romeo racing division as Auto Avio Costruzioni, the company built its first car in 1940, and produced its first Ferrari-badged car in 1947.","The origins of the company are complex, going back to the early 20th century and the initial enterprises (Horch and the Audiwerke) founded by engineer August Horch; and two other manufacturers (DKW and Wanderer), leading to the foundation of Auto Union in 1932. The modern Audi era began in the 1960s, when Auto Union was acquired by Volkswagen from Daimler-Benz.[10] After relaunching the Audi brand with the 1965 introduction of the Audi F103 series, Volkswagen merged Auto Union with NSU Motorenwerke in 1969, thus creating the present-day form of the company.","Rolls-Royce was a British luxury car and later an aero-engine manufacturing business established in 1904 in Manchester, United Kingdom by the partnership of Charles Rolls and Henry Royce. Building on Royce's reputation established with his cranes they quickly developed a reputation for superior engineering by manufacturing the best car in the world. The First World War brought them into manufacturing aero-engines. Joint development of jet engines began in 1940 and they entered production. Rolls-Royce has built an enduring reputation for development and manufacture of engines for defence and civil aircraft.","The Ford Mustang is a series of American automobiles manufactured by Ford. In continuous production since 1964, the Mustang is currently the longest-produced Ford car nameplate. Currently in its sixth generation, it is the fifth-best selling Ford car nameplate. The namesake of the pony car automobile segment, the Mustang was developed as a highly styled line of sporty coupes and convertibles derived from existing model lines, initially distinguished by long hood, short deck proportions.","Automobiles are marketed under the brands BMW, Mini and Rolls-Royce, and motorcycles are marketed under the brand BMW Motorrad. In 2017, BMW was the world's fourteenth-largest producer of motor vehicles, with 2,279,503 vehicles produced. The company has significant motorsport history, especially in touring cars, Formula 1, sports cars and the Isle of Man TT."]
    
    var meal = ["Biryani is one of the most popular dishes in South Asia, as well as among the diaspora from the region. It has gained popularity in South India, and is also prepared in other parts of the world such as Iraqi Kurdistan. Biryani is the single most-ordered dish on Indian online food ordering and delivery services","Sambar  is a lentil-based vegetable stew, cooked with pigeon pea and tamarind broth. It is popular in South Indian and Sri Lankan cuisines. The stew has been adapted into Burmese cuisine as a popular accompaniment to Burmese curries.","Shawarma  is a popular Middle Eastern dish consisting of meat cut into thin slices, stacked in a cone-like shape, and roasted on a slowly-turning vertical rotisserie or spit. Originally made with lamb or mutton, it is now also made of chicken, turkey, beef, or veal. Thin slices are shaved off the cooked surface as it continuously rotates. Shawarma is one of the world's most popular street foods, especially in Egypt, the countries of the Levant, the Arabian Peninsula, and the rest of the Middle East.","Paneer , also known as ponir  or Indian cottage cheese, is a fresh acid-set cheese common in the Indian subcontinent (Bangladesh, Bhutan, India, Maldives, Nepal, Pakistan and Sri Lanka) made from cow or buffalo milk. It is a non-aged, non-melting soft cheese made by curdling milk with a fruit- or vegetable-derived acid, such as lemon juice. Its acid-set form (curd) before pressing is called chhena.","Thali (meaning plate) or Bhojanam (meaning full meal) is a round platter used to serve food in South Asia, Southeast Asia and the Caribbean. Thali is also used to refer to an Indian-style meal made up of a selection of various dishes which are served on a platter.","Ice cream is a sweetened frozen food typically eaten as a snack or dessert. It may be made from milk or cream and is flavoured with a sweetener, either sugar or an alternative, and a spice, such as cocoa or vanilla, or with fruit such as strawberries or peaches. It can also be made by whisking a flavored cream base and liquid nitrogen together. Food coloring is sometimes added, in addition to stabilizers. The mixture is cooled below the freezing point of water and stirred to incorporate air spaces and to prevent detectable ice crystals from forming. The result is a smooth, semi-solid foam that is solid at very low temperatures (below 2 °C or 35 °F). It becomes more malleable as its temperature increases."]
    
    var topic:Int!
    var img = 0

    
    @IBOutlet weak var seacrhTextField: UITextField!

    @IBAction func searchTextFieldAction(_ sender: Any) {
        if(!seacrhTextField.hasText){
            seacrhButtonOutlet.isEnabled = false
        }
        else{
            seacrhButtonOutlet.isEnabled = true
        }
    }
    
    
    @IBAction func searchButton(_ sender: Any) {
        nextButtonOutlet.isHidden = false
//        if(img == )
//        nextButtonOutlet.isEnabled = true
        previousButtonOutlet.isHidden = false
        if(img == 0){
        previousButtonOutlet.isEnabled = false
        nextButtonOutlet.isEnabled = true
        }
        else{
            previousButtonOutlet.isEnabled = true
        }
        resetButtonOutlet.isHidden = false
        resetButtonOutlet.isEnabled = true
        if(actor_keywords.contains(seacrhTextField.text!)){
            topic = 0
            update(image: img, topicNumber: topic)
        }
        else if(car_keywords.contains(seacrhTextField.text!)){
            topic = 1
            update(image: img, topicNumber: topic)
        }
        else if(food_keywords.contains(seacrhTextField.text!)){
            topic = 2
            update(image: img, topicNumber: topic)
        }
        else{
            resultImage.image = UIImage(named: "error")
            topicInfoText.text! = "Enter any other topic"
            nextButtonOutlet.isHidden = true
            previousButtonOutlet.isHidden = true
            resetButtonOutlet.isHidden = true
        }
        
    }
    
    func update(image: Int, topicNumber: Int){
        resultImage.image = UIImage(named: arr_img[topic][img])
        if(topicNumber == 0){
            topicInfoText.text = actor[image]
            titleOutlet.text = actor_title[image]
        }
        else if(topicNumber == 1){
            topicInfoText.text = car[image]
            titleOutlet.text = car_title[image]
        }
        else if(topicNumber == 2){
            topicInfoText.text = meal[image]
            titleOutlet.text = food_title[image]
        }
    }
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBAction func showNextImgBtn(_ sender: Any) {
        img += 1
        update(image: img, topicNumber: topic)
        if(topic == 0 && img == actor.count-1){
            nextButtonOutlet.isEnabled = false
        }
        else if(topic == 1 && img == car.count-1){
            nextButtonOutlet.isEnabled = false
        }
        else if(topic == 2 && img == meal.count-1){
            nextButtonOutlet.isEnabled = false
        }
        previousButtonOutlet.isEnabled = true
        resetButtonOutlet.isHidden = false
        resetButtonOutlet.isEnabled = true
    }
    @IBAction func showPrevImgBtn(_ sender: Any) {
        img -= 1
        update(image: img, topicNumber: topic)
        if(topic == 0 && img == 0){
            previousButtonOutlet.isEnabled = false
        }
        else if(topic == 1 && img == 0){
            previousButtonOutlet.isEnabled = false
        }
        else if(topic == 2 && img == 0){
            previousButtonOutlet.isEnabled = false
        }
        nextButtonOutlet.isEnabled = true
    }
    @IBOutlet weak var topicInfoText: UITextView!
}


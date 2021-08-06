//
//  Constants.swift
//  prototypeGV
//
//  Created by Max Polinkovsky on 28.05.2019.
//  Copyright © 2019 Max Polinkovsky. All rights reserved.
//

import UIKit

let defaults = UserDefaults.standard

enum ControllerButtonsStatus {
    case normal
    case buttonPressed
}

var title = "New Theme"
var cellIdentifier: String { return "cell" }

let increase: Float = 0.2
let decrease: Float = 0.4

let countTestWords = 20
let secondsForAnswer = 10

let bold = "TeXGyreAdventor-Bold"
let regular = "TeXGyreAdventor-Regular"

protocol IntegerEnum {
    init?(rawValue: Int)
    var description: String { get }
}

protocol IntEnum {
    init?(rawValue: Int)
    var description: Int { get }
}

extension IntegerEnum {
    
    static var casesDescription: [String] {
        var caseIndex = 0
        let interator: AnyIterator<Self> = AnyIterator {
            let result = Self(rawValue: caseIndex)
            caseIndex += 1
            return result
        }
        return interator.map { $0.description }
    }
}

enum Week: Int, IntEnum {
    case current, one, two, three
    var description: Int {
        switch self {
        case .current: return 0
        case .one: return 7
        case .two: return 14
        case .three: return 21
        }
    }
}

enum Level: Int {
    case base = 0, intermediate = 1, advanced = 2
}

enum LearnTime: Int {
    case quarter = 0, half = 1, hour = 2
}


enum Casus: Int, IntegerEnum {
    case empty, akkusativ, dativ
    
    var key: String { return String(describing: self) }
    
    var description: String {
        switch self {
        case .empty: return ""
        case .akkusativ: return "akk"
        case .dativ: return "dat"
        }
    }
}

enum Article: Int, IntegerEnum {
    case die, der, das
    
    var key: String { return String(describing: self) }
    
    var description: String {
        switch self {
        case  .die: return "die"
        case  .der: return "der"
        case  .das: return "das"
        }
    }
}

enum Definition: Int, IntegerEnum {
    
    case adverb, none, verb, adjective, noun
    
    var key: String { return String(describing: self) }
    
    var description: String {
        switch self {
        case .noun: return "noun"
        case  .verb: return "verb"
        case  .adverb: return "adverb"
        case .adjective: return "adjective"
        case  .none: return "none"
        }
    }
}

enum Ending: Int, IntegerEnum {
    
    case hyphenEn, hyphenUng, hyphenE, hyphenOn, hyphenN, hyphenEr, hyphenEs, hyphenS, hyphenSe, noneEnding, umlautEn, umlautE, umlautN, umlautEr, umlautEs, umlautS, minusUmlaut, minus
    //    _ = ["-en","¨-en", "-ung","-on","-e","¨-e", "-n","¨-n", "-er","¨-er", "-es", "¨-es","-s","¨-s","-se","¨-", "-"]
    
    var key: String { return String(describing: self) }
    
    
    var description: String {
        switch self {
        
        case .noneEnding: return "-"
        case .hyphenEn: return "-en"
        case .hyphenUng: return "-ung"
        case .hyphenE: return "-e"
        case .hyphenOn: return "-on"
        case .hyphenN: return "-n"
        case .hyphenEr: return "-er"
        case .hyphenEs: return "-es"
        case .hyphenS: return "-s"
        case .hyphenSe: return "-se"
        case .umlautEn: return "¨-en"
        case .umlautE: return "¨-e"
        case .umlautN: return "¨-n"
        case .umlautEr: return "¨-er"
        case .umlautEs: return "¨-es"
        case .umlautS: return "¨-s"
        case .minusUmlaut: return "¨-"
        case .minus: return "-"
        }
    }
}
enum HilfsVerb: Int, IntegerEnum {
    case hat, ist
    
    var key: String { return String(describing: self) }
    
    var description: String {
        switch self {
        case .hat: return "hat"
        case .ist: return "ist"
        }
    }
}

enum Preposition: Int, IntegerEnum {
    case empty, an, auf, aus, hinter, neben, über, unter, zwischen, mit, gegen, vor, für, zu, bei, in_, um, als, von, nach
    
    var key: String { return String(describing: self) }
    
    var description: String {
        switch self {
        case .empty: return " "
        case .an: return "an"
        case .auf: return "auf"
        case .aus: return "aus"
        case .als: return "als"
        case .bei: return "bei"
        case .für: return "für"
        case .gegen: return "gegen"
        case .hinter: return "hinter"
        case .neben: return "neben"
        case .über: return "über"
        case .unter: return "unter"
        case .zwischen: return "zwischen"
        case .mit: return "mit"
        case .vor: return "vor"
        case .in_: return "in"
        case .um: return "um"
        case .zu: return "zu"
        case .von: return "von"
        case .nach: return "nach"
        }
    }
}

enum TestType: Int, IntegerEnum {
    case option, translate, keys, brainstorm
    
    var key: String { return String(describing: self) }
    
    var description: String {
        switch self {
        case .option: return "Test"
        case .translate: return "Translate"
        case .keys: return "Keys"
        case .brainstorm: return "Brainstorm"
        }
    }
}

enum Sorting: Int, IntegerEnum {
    case infinitiv, translate
    
    var key: String { return String(describing: self) }
    
    var description: String {
        switch self {
        case .translate: return "translate"
        case .infinitiv: return "infinitiv"
        }
    }
}

//MARK: Privacy
let privacy = """

easy!-Datenschutzrichtlinie

Diese Datenschutzrichtlinie erläutert, welche personenbezogenen Daten (wie nachstehend definiert) wir über unsere Dienste erfassen, wie wir diese Daten verwenden und weitergeben sowie Ihre Optionen bzgl. unserer Datenschutzpraktiken.

Mit der Bereitstellung personenbezogener Daten bei der Nutzung der Dienste, stimmen Sie der Verarbeitung Ihrer personenbezogenen Daten wie in dieser Datenschutzrichtlinie erläutert zu. Wenn Sie mit dieser Datenschutzrichtlinie nicht einverstanden sind, stellen Sie bitte unverzüglich den Zugriff auf die bzw. die Nutzung der Dienste ein.

1. Personenbezogene Daten, die wir erfassen

Wenn Sie mit unseren App interagieren, erfassen wir Informationen, die allein oder zusammen mit anderen Informationen dazu verwendet werden könnten, Sie zu identifizieren („Personenbezogene Daten”).

Personenbezogene Daten, die Sie uns zur Verfügung stellen. Wenn Sie sich für unsere Dienste registrieren oder diese nutzen, stellen Sie uns freiwillig bestimmte personenbezogene Daten zur Verfügung, wie Ihre E-Mail-Adresse und Ihr Profilbild.

Wir können auch nicht personenbezogene Daten erfassen, etwa Ihre Zeitzone oder Sprache.

2. Wie wir Daten verwenden

Wir verwenden die oben erläuterten erfassten Daten:

Um Nutzer zu authentifizieren, die Dienste zur Verfügung zu stellen, Transaktionen abzuwickeln und auf Ihre Anfragen zu antworten. Für Nutzer, die in der EU ansässig sind, ist die Verwendung erforderlich, um den Vertrag mit Ihnen zu erfüllen.

Soweit für bestimmte legitime Geschäftsinteressen erforderlich, unter anderem Folgende:

Um die Lernerfahrung und den Schwierigkeitsgrad an das Niveau und die Bedürfnisse unserer Nutzer anzupassen.

Wenn Sie uns beauftragen, Ihre Daten zu löschen oder Sie von unseren Marketing-Listen zu entfernen, und wir zu der Durchführung dieses Auftrags verpflichtet sind, werden wir wesentliche Daten beibehalten, um Sie zu identifizieren und weitere unerwünschte Verarbeitungen zu verhindern.

Weitere Informationen zu Ihren Rechten im Rahmen der Gesetzgebung der Europäischen Union („EU“) finden Sie im Abschnitt „Rechte im Rahmen der EU-Gesetzgebung“ unten.

3. Weitergabe und Offenlegung

Betriebsübertragung: Wenn wir an einer Fusion, Übernahme, Finanzierung, Due Diligence, Reorganisation, Insolvenz, Zwangsverwaltung, Verkauf des gesamten oder Teilen des Unternehmensvermögen oder Übergang einer Dienstleistung zu einem anderen Anbieter beteiligt sind, können Ihre personenbezogenen Daten und weitere Informationen im Rahmen einer solchen Transaktion auf einen Nachfolger oder ein verbundenes Unternehmen übertragen werden.

Gesetzliche Anforderungen: Sofern gesetzlich oder durch maßgebliche Regelung vorgeschrieben oder wenn wir in dem guten Glauben sind, dass diese Maßnahme notwendig ist, um (i) eine gesetzliche Verpflichtung einzuhalten, (ii) unsere Rechte oder unser Eigentum zu schützen oder zu verteidigen und (iii) in dringenden Fällen zu handeln, um die persönliche Sicherheit der Nutzer oder des App oder der Öffentlichkeit zu schützen oder (iv) uns vor gesetzlicher Haftung zu schützen.

4. Datenspeicherung

Wir bewahren Ihre personenbezogenen Daten solange auf, wie es in angemessener Weise für die in dieser Datenschutzrichtlinie erläuterten Zwecke erforderlich ist und eine legitime geschäftliche Notwendigkeit dafür vorliegt oder sofern gesetzlich vorgeschrieben (z. B. für steuerliche, juristische, buchhalterische oder andere Zwecke), je nachdem, welcher Zeitraum länger ist.

5. Aktualisieren Sie Ihre Angaben

Die Änderung, Korrektur und das Löschen Ihrer Daten von unseren Systemen können Sie in Ihren Benutzereinstellungen selbst verwalten.

6. Rechte im Rahmen der EU-Gesetzgebung

Umfang. Dieser Abschnitt liefert Informationen über Ihre Rechte im Rahmen der EU-Gesetzgebung (für diese Zwecke umfasst die Bezugnahme auf die EU auch die Länder des Europäischen Wirtschaftsraums Island, Liechtenstein und Norwegen).

Berechtigtes Interesse. „Berechtigtes Interesse“ bedeutet unsere Interessen für die Ausübung unserer Geschäftstätigkeit, die Verwaltung und die Bereitstellung optimaler Dienste für Sie. Die Datenschutzrichtlinie erläutert, wann wir Ihre personenbezogenen Daten für unsere berechtigten Interessen verarbeiten, welche diese Interessen sind, sowie Ihre Rechte. Wir werden Ihre personenbezogenen Daten nicht für Aktivitäten verwenden, bei denen die Auswirkungen auf Sie unsere Interessen überwiegen, es sei denn, wir haben Ihre Zustimmung oder diese Aktivitäten sind anderweitig gesetzlich vorgeschrieben oder zulässig.

Recht auf Löschung: Unter bestimmten Umständen (z. B. wenn wir sie nicht mehr benötigen oder wenn Sie Ihre Zustimmung ggf. widerrufen) können Sie uns darum bitten, Ihre personenbezogenen Daten zu löschen. Sie können dies in Ihren Benutzereinstellungen auch selbst vornehmen. Falls wir Ihre Daten an Andere weitergegeben haben, werden wir diese, sofern möglich, auf die Notwendigkeit einer Löschung hinweisen. Wenn Sie uns darum bitten, und sofern möglich und gesetzlich zulässig, werden wir Ihnen auch mitteilen, an wen wir Ihre personenbezogenen Daten weitergegeben haben, damit Sie direkt Kontakt mit ihnen aufnehmen können.

Recht auf Einschränkung der Verarbeitung: Unter bestimmten Umständen (z. B. wenn Sie die Richtigkeit der Daten bestreiten oder Sie Widerspruch gegen die Verarbeitung durch uns eingelegt haben (Informationen zu Ihrem Widerspruchsrechts finden Sie nachstehend)) können Sie auch verlangen, die Verarbeitung Ihrer personenbezogenen Daten einzuschränken oder zu „blockieren“. Wir werden Sie darüber unterrichten, bevor die Einschränkung aufgehoben wird. Falls wir Ihre personenbezogenen Daten an andere weitergegeben haben, werden wir diese, sofern möglich, über die Einschränkung informieren. Wenn Sie uns darum bitten, und sofern möglich und gesetzlich zulässig, werden wir Ihnen auch mitteilen, an wen wir Ihre personenbezogenen Daten weitergegeben haben, damit Sie direkt Kontakt mit ihnen aufnehmen können.

Recht auf Datenübertragbarkeit: Sie haben das Recht, Ihre personenbezogenen Daten, die Sie uns übermittelt haben oder die uns im Zuge unseres Vertrags mit Ihnen notwendigerweise zur Verfügung gestellt wurden, zu erhalten. Wir übermitteln Ihnen Ihre personenbezogenen Daten in einem strukturierten, gängigen und maschinenlesbaren Format. Sie können diese an anderer Stelle wiederverwenden. Widerspruchsrecht: Sie können jederzeit von uns verlangen, die Verarbeitung Ihrer personenbezogenen Daten einzustellen, und wir werden dem Folge leisten: Wenn wir Ihre personenbezogenen Daten aufgrund eines berechtigten Interesses (im Abschnitt „Wie wir Daten verwenden“) verarbeiten – es sei denn, wir können zwingende schutzwürdige Gründe für die weitere Verarbeitung dieser personenbezogenen Daten nachweisen oder Wenn wir Ihre personenbezogenen Daten für Direktmarketing verwenden.

Rechte in Bezug auf automatisierte Entscheidungen einschließlich Profiling: Sie haben das Recht, nicht einer ausschließlich auf einer automatisierten Verarbeitung Ihrer personenbezogenen Daten – einschließlich Profiling – beruhenden Entscheidung unterworfen zu werden, es sei denn, dies ist in Bezug auf einen Vertrag zwischen Ihnen und uns erforderlich oder Sie geben Ihre ausdrückliche Zustimmung zu dieser Verwendung.

Recht, Ihre Zustimmung zu widerrufen: Wenn die Verarbeitung Ihrer personenbezogene Daten auf Ihrer Zustimmung beruht, haben Sie das Recht diese Zustimmung jederzeit zu widerrufen. Dieser Widerruf betrifft jedoch nicht die bereits erfolgte Verarbeitung Ihrer Daten.

Recht auf Einreichung einer Beschwerde bei der zuständigen Datenschutzaufsichtsbehörde: Haben Sie Bedenken in Bezug auf unsere Datenschutzpraktiken, einschließlich der Art und Weise, in der wir Ihre personenbezogenen Daten behandelt haben, können Sie dies der Datenschutzaufsichtsbehörde melden, die befugt ist, derartige Anliegen zu hören.

Sie können uns zur Ausübung Ihrer Rechte kontaktieren.

Änderungen. Wir werden Sie über Änderungen der in dieser Datenschutzrichtlinie beschriebenen Datenverarbeitungsaktivitäten unterrichten, indem wir einen gut sichtbaren Hinweis auf unserer Website oder in den Apps platzieren bzw. sowie anderweitig gesetzlich vorgeschrieben.

7. Öffentlich gemachte Informationen

Diese Datenschutzrichtlinie gilt nicht für Informationen, die Sie in öffentlichen Bereichen unserer Dienste geben. Hierzu zählen unter anderem Kommentare im Memrise-Blog oder in öffentlichen Foren. In öffentlichen Bereichen abgegebene Kommentare können von Dritten gemäß deren Datenschutzpraktiken und -richtlinien angezeigt, aufgerufen und verwendet werden.

8. Sicherheit

Wir ergreifen angemessene administrative und technische Maßnahmen, um die personenbezogenen Daten vor Verlust, Missbrauch und unbefugtem Zugriff sowie unbefugter Offenlegung, Änderung oder Vernichtung zu schützen. Keine Internetübertragungsmethode ist jedoch vollkommen sicher. Daher können wir bei allem Bemühen um den Schutz Ihrer Daten deren Sicherheit nicht vollumfänglich gewährleisten.

9. Änderungen unserer Datenschutzrichtlinie

Wir können diese Datenschutzrichtlinie jederzeit ändern. Dazu veröffentlichen wir eine aktualisierte Version auf dieser Seite. Indem Sie die Website und die Apps weiterhin verwenden oder uns nach Veröffentlichung der aktualisierten Datenschutzrichtlinie Informationen zur Verfügung stellen, stimmen Sie der überarbeiteten Datenschutzrichtlinie und den darin beschriebenen Praktiken zu.

10. Kontaktieren Sie uns

Wenn Sie Fragen zu dieser Datenschutzrichtlinie oder unseren Datenschutzpraktiken haben, kontaktieren Sie uns bitte per E-Mail: max.polinkovsky@gmail.com
"""

//MARK: Localizable

let getAllBenefits = "Sign in to get all benefits:\nsave your progress,\nsync over devices & more"
let email = "Email"
let login = "Login"
let password = "Password"
let iForgotPassword = "I forgot password"
let dontHaveID = "Don’t have an ID?"
let register = "Register"
let errorWithLogin = "Email address is badly formatted or password is invalid"
let cancel = "Cancel"
let alredyRegistredMessage = "User is already registered or password is short"
let alredyRegistred = "Already registered?"
let passToEmailMessage = "An email with password has been sent to your address"
let checkEmail = "Check email"
let addTranslate = "add translate"
let monthPeriod = "month"
let yearPeriod = "year"
let reachYourGoal = "Reach your goal!"
let confirmation = "Continue"
//let cancelAnytime = "Secured with iTunes.\nCancel anytime".localized()
let terms = "Terms & Privacy"
let subscriptionsDone = "Subscription's done"
let monthsPeriod = "months"
//let threeDayTrial = "After 3 day trial".localized()
//let freeTrial = "Free trial".localized()
let testTimer = "Test timer"
let wordTranslation = "Word translation"
let darkTheme = "Dark Theme"
let addPurchase = "Subscribe to Easy+"
let restorePurchase = "Restore Purchase"
let purchaseIsRestored = "Purchase is restored"
let subscriptionCouldtBeRestored = "Subscription could not be restored"
let words = "Words"
let internet = "Internet"
let noInternetConnection = "No internet connection"
let newTheme = "New Theme"
let save = "Save"
let edit = "Edit"
let update = "Update"
let purchasesArentAvailable  = "Purchases are not available, check your internet connection"
let delete = "Delete"
let thereAreNotWords = "There are no words here yet"
let addOne = " Add one"
let infinitiv = "Infinitiv"
let translate = "Translate"
let progress = "Progress"
let option = "Option"
let keys = "Keys"
let brainstorm = "Brainstorm"
let search = "Search"
let lessThen4Words = "The theme has less than 4 words, add up to the required number to run the tests"
let perfect = "Perfect"
let preterite = "Preterite"
let casusName = "Casus"
let example = "Example"
let translates = "Translates:"
let goodJob = "Good job!"
let repeatWords = "Repeat Words"
let close = "Close"
let next = "Next!"
let goNext = "Go Next "
let iForgotAnswer = "I forgot answer"
let duplicatesInTranslations = "There are duplicates in translations"
let addNewWord = "Add new word"
let fillTranslate = "Fill translate in the empty fields"
let fillWord = "Fill word in the empty field"
let fillEmpty = "Fill the empty field"
let wordAlreadyExists = "That word already exists"
let fillEmptyFields = "Fill in the empty fields"

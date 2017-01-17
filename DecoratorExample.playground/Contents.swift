//: Playground - noun: a place where people can play

import UIKit

protocol DialerInterface{
    func contactAction()
}

struct DefaultDialer: DialerInterface{
    func contactAction() {
        print("-----------Begin-------------------")
        print("Default Dialing Action completed")
    }
}

let dialer = DefaultDialer()
dialer.contactAction()


struct FollowupCallDialerDecorator: DialerInterface{
    let dialer: DialerInterface
    
    init(dialer: DialerInterface){
        self.dialer = dialer
    }
    
    func contactAction() {
        dialer.contactAction()
        print("-------- Follow-up Call ----------------")
        print("Follow-up Dialing Action completed")
    }
}



let followupCallDialerDecorator = FollowupCallDialerDecorator(dialer: dialer)
followupCallDialerDecorator.contactAction()


struct CellPhoneDialerDecorator: DialerInterface{
    let dialer: DialerInterface
    
    init(dialer: DialerInterface){
        self.dialer = dialer
    }
    
    func contactAction() {
        dialer.contactAction()
        print("---------Cell Phone ----------------")
        print("Cell Phone Dialing Action completed")
    }
}

let cellPhoneDialer = CellPhoneDialerDecorator(dialer: followupCallDialerDecorator)

struct TextMeDecorator: DialerInterface {
    let dialer: DialerInterface
    
    init(dialer: DialerInterface){
        self.dialer = dialer
    }
    
    func contactAction() {
        dialer.contactAction()
        print("------- Text -----------")
        print("Text Me Action completed")
    }
}

let textMe = TextMeDecorator(dialer: cellPhoneDialer)
textMe.contactAction()


let callAndTextMe = TextMeDecorator(dialer: FollowupCallDialerDecorator(dialer: DefaultDialer()))

callAndTextMe.contactAction()
cellPhoneDialer.contactAction()
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

struct HomePhoneDialerDecorator: DialerInterface{
    let dialer: DialerInterface
    
    init(dialer: DialerInterface){
        self.dialer = dialer
    }
    
    func contactAction() {
        dialer.contactAction()
        print("-------- Home Phone ----------------")
        print("Home Phone Dialing Action completed")
    }
}


let dialer = DefaultDialer()
let homePhoneDialer = HomePhoneDialerDecorator(dialer: dialer)
homePhoneDialer.contactAction()


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

let cellPhoneDialer = CellPhoneDialerDecorator(dialer: homePhoneDialer)
cellPhoneDialer.contactAction()


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


let callAndTextMe = TextMeDecorator(dialer: HomePhoneDialerDecorator(dialer: DefaultDialer()))

callAndTextMe.contactAction()

//
//  main.swift
//  BumpLive
//
//  Created by Yuto Mizutani on 2016/11/01.
//  Copyright © 2016年 Yuto Mizutani. All rights reserved.
//

import Foundation

protocol BumpDelegate{
    var song : String {get}
    func hello()
    func goodbye()
    func sing(_: String)
}

protocol FunDelegate{
    var favoriteSong : String { get}
    func singWith()
    func cheer()
}

class Bump: BumpDelegate {
    var song : String
    var end : AnyObject? = nil
    init(themeSong :String){
        self.song = themeSong
    }
    func hello() {
        print( "藤くん「こんばんは,Bump Of Chickenです」")
    }
    func goodbye() {
        print( "藤くん「ほんとありがとう.おやすみ」" )
    }
    func sing(song : String){
        self.song = song
    }
}

class Fun : FunDelegate {
    let favoriteSong : String
    let favoriteLyrics : String
    init(favoriteSong : String,favoriteLyrics : String){
        self.favoriteSong = favoriteSong
        self.favoriteLyrics = favoriteLyrics
    }
    func cheer()  {
        print( "最高!")
    }
    func singWith()  {
        print(favoriteLyrics)
    }
}

class Live {
    var bumpDelegate : BumpDelegate?
    var funDelegate : FunDelegate?
    let numberOfSongs : Int
    init(numberOfSongs : Int){
        self.numberOfSongs = numberOfSongs
    }
    func liveStart(){
        print(bumpDelegate!.song)
        bumpDelegate?.hello()
        funDelegate?.cheer()
        for i in 0 ..< self.numberOfSongs{
            print("---input song ", terminator: "-> ")
            let inputLine : String? = readLine()
            //            bumpDelegate?.sing(inputLine!)
            bumpDelegate?.sing(inputLine!)
            print(bumpDelegate!.song)
            if bumpDelegate?.song == funDelegate?.favoriteSong{
                funDelegate?.singWith()
            } else {
                print("ふぅー！")
            }
            if i == self.numberOfSongs - 2{
                print("藤くん「次が最後の曲になります」")
                print("はやいよー！")
            }
        }
        bumpDelegate!.goodbye()
        funDelegate!.cheer()
        
    }
    
}

let bump = Bump(themeSong: "A Quick One")
let Yuto = Fun(favoriteSong: "天体観測", favoriteLyrics: "おーいえー,あはーん")
let nissanStadium = Live(numberOfSongs: 3)
nissanStadium.bumpDelegate = bump
nissanStadium.funDelegate = Yuto

nissanStadium.liveStart()





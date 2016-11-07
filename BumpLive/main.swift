//
//  main.swift
//  BumpLive
//
//  Created by Yuto Mizutani on 2016/11/01.
//  Copyright © 2016年 Yuto Mizutani. All rights reserved.
//

import Foundation

protocol ArtistDelegate{
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

class Artist: ArtistDelegate {
    var song : String = "君が代"
    var themeSong : String = "君が代"
    var inputHello : String = "どうも,はじめまして"
    var inputGoodbye : String = "今日はありがとうございました"
    init(){
        self.inputHello = thinkHello()
        self.inputGoodbye = thinkGoodbye()
        self.themeSong = thinkThemeSong()
        self.song = self.themeSong
    }
    
    func thinkHello() ->String {
        let inputHello : String?
        print("登場のあいさつを考える... : ", terminator :"")
        inputHello = readLine()
        return inputHello!
    }
    func thinkGoodbye() ->String {
        let inputGoodbye : String?
        print("さよならの挨拶を考える... : ", terminator :"")
        inputGoodbye = readLine()
        return inputGoodbye!
    }
    
    func thinkThemeSong() -> String {
        let themeSong : String?
        print("入場曲はどうしようかな...? : ", terminator : "")
        themeSong = readLine()
        return themeSong!
    }
    
    
    func hello() {
        print(self.inputHello)
    }
    func goodbye() {
        print(self.inputGoodbye)
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
    var artistDelegate : ArtistDelegate?
    var funDelegate : FunDelegate?
    let numberOfSongs : Int
    init(numberOfSongs : Int){
        self.numberOfSongs = numberOfSongs
    }
    func liveStart(){
        print(artistDelegate!.song)
        artistDelegate?.hello()
        funDelegate?.cheer()
        for i in 0 ..< self.numberOfSongs{
            print("---input song ", terminator: "-> ")
            let inputLine : String? = readLine()
            //            bumpDelegate?.sing(inputLine!)
            artistDelegate?.sing(inputLine!)
            print(artistDelegate!.song)
            if artistDelegate?.song == funDelegate?.favoriteSong{
                funDelegate?.singWith()
            } else {
                print("ふぅー！")
            }
            if i == self.numberOfSongs - 2{
                print("次が最後の曲になります」")
                print("はやいよー！")
            }
        }
        artistDelegate!.goodbye()
        funDelegate!.cheer()
        
    }
    
}

let bump = Artist()
let rad = Artist()

let Yuto = Fun(favoriteSong: "天体観測", favoriteLyrics: "おーいえー,あはーん")
let butterfliesAtNissanStadium = Live(numberOfSongs: 3)
butterfliesAtNissanStadium.artistDelegate = bump
butterfliesAtNissanStadium.funDelegate = Yuto

butterfliesAtNissanStadium.liveStart()





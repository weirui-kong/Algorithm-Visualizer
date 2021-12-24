//
//  Lang.swift
//  Algo
//
//  Created by 孔维锐 on 2021/12/24.
//  Copyright © 2021 Marshall Lee. All rights reserved.
//

import Foundation
let EnglishType = [
    //Basic view lang
    "start": "start",
    "stop": "stop",
    "pause": "pause",
    "resume": "resume",
    "choose a function": "choose a function",
    "tree visualization":"tree map visualization",
    "sort visualization":"sort visualization",
    "tree visualization_newline":"tree map\nvisualization",
    "sort visualization_newline":"sort\nvisualization",
    "sort":"sort",
    "tree":"tree map",
    "panel":"panel",
    "document":"document",
    //Sort view
    "bubble":"bubble",
    "selection":"selection",
    "quick":"quick",
    "merge":"merge",
    "cocktail":"cocktail",
    
    "shuffle":"shuffle",
    "information":"information",
    "reset":"reset",
    //Tree view
    "binary tree":"binary tree",
    "binary search tree":"binary search tree",
    "balanced search binary tree":"balanced search binary tree",
    "back":"back",
    "👉mode👇":"👉mode👇",
    "alert":"alert",
    "nah":"nah",
    "remove":"remove",
    "Previous data removed":"Previous data removed",
    "Okay":"Okay",
    "Select trees":"Select trees",
    "Reset":"Reset",
    "Conformation":"Conformation",
    "This action will remove all registered data!":"This action will remove all registered data!",
    
]

let ChineseSPType = [
    //Basic view lang
    "start": "开始",
    "stop": "停止",
    "pause": "暂停",
    "resume": "恢复",
    "choose a function": "轻按以开始",
    "tree visualization":"树可视化",
    "sort visualization":"排序可视化",
    "tree visualization_newline":"树\n可视化",
    "sort visualization_newline":"排序\n可视化",
    "sort":"排序",
    "tree":"树",
    "panel":"面板",
    "document":"文档",
    //Sort view
    "bubble":"冒泡",
    "selection":"选择",
    "quick":"快速",
    "merge":"归并",
    "cocktail":"鸡尾酒",
    "shuffle":"随机",
    
    "information":"信息",
    "reset":"重置",
    //Tree view
    "binary tree":"二叉树",
    "binary search tree":"二叉搜索树",
    "balanced search binary tree":"二叉平衡树",
    "back":"返回",
    "👉mode👇":"👉模式👇",
    "alert":"警告",
    "nah":"暂不",
    "remove":"移除",
    "Previous data removed":"未保存的数据已清除",
    "Okay":"好",
    "Select trees":"选择树的类型",
    "Reset":"重置",
    "Conformation":"确认",
    "This action will remove all registered data!":"这会清除所有的数据！",
    
    
    
]
let ChineseTRType = [
    //Basic view lang
    "start": "開始",
    "stop": "停止",
    "pause": "暫停",
    "resume": "恢復",
    "choose a function": "輕按以開始",
    "tree visualization":"樹可視化",
    "sort visualization":"排序可視化",
    "tree visualization_newline":"樹\n可視化",
    "sort visualization_newline":"排序\n可視化",
    "sort":"排序",
    "tree":"樹",
    "panel":"面板",
    "document":"文檔",
    //Sort view
    "bubble":"冒泡",
    "selection":"選擇",
    "quick":"快速",
    "merge":"歸並",
    "cocktail":"雞尾酒",
    
    "shuffle":"隨機",
    "information":"文檔",
    "reset":"再次",
    //Tree view
    "binary tree":"二叉樹",
    "binary search tree":"二叉搜索樹",
    "balanced search binary tree":"二叉平衡樹",
    "back":"返回",
    "👉mode👇":"👉模式👇",
    "alert":"告警",
    "nah":"不",
    "remove":"移除",
    "Previous data removed":"未保存的數據已清除",
    "Okay":"好",
    "Select trees":"選擇樹的類型",
    "Reset":"重置",
    "Conformation":"確認",
    "This action will remove all registered data!":"這會清除所有的數據！",
    
]
let GermanType = [
    //Basic view lang
    "start":"starten",
    "stop":"aufhören",
    "pause":"pause",
    "resume":"Lebenslauf",
    "choose a function": "funktion wähle",
    "tree visualization":"tree map visualisierung",
    "sort visualization":"sortieralgorithmus visualization",
    "tree visualization_newline":"tree map\nvisualisierung",
    "sort visualization_newline":"sortieralgorithmus\nnvisualisierung",
    "sort":"sortieralgorithmus",
    "tree":"tree map",
    "panel":"panel",
    "document":"dokument",
    //Sort view
    "bubble":"bubble",
    "selection":"selection",
    "quick":"quick",
    "merge":"merge",
    "cocktail":"cocktail",
    
    "shuffle":"mischen",
    "information":"information",
    "reset":"setzen",
    //Tree view
    "binary tree":"binary tree",
    "binary search tree":"binary search tree",
    "balanced search binary tree":"balanced search binary tree",
    "back":"zurück",
    "👉mode👇":"👉Modus👇",
    "alert":"warnung",
    "nah":"nee",
    "remove":"entfernen",
    "Previous data removed":"Vorherige Daten entfernt",
    "Okay":"Okay",
    "Select trees":"Tree map wählen",
    "Reset":"Setzen",
    "Conformation":"Konformation",
    "This action will remove all registered data!":"Diese Aktion entfernt alle registrierten Daten!",
    
]

enum LangType : String{
    case English = "English"
    case ChineseSP = "简体中文"
    case ChineseTR = "正體字"
    case German = "Deutsch"
}

func getLocalizedText (ms: String) -> String{
    switch (appLangType){
    case .English:
        return EnglishType[ms] ?? "MS NOT FOUND"
    case .ChineseSP:
        return ChineseSPType[ms] ?? "MS NOT FOUND"
    case .ChineseTR:
        return ChineseTRType[ms] ?? "MS NOT FOUND"
    case .German:
        return GermanType[ms] ?? "MS NOT FOUND"
        
    }
}
func getLocalizedTextCapitalized(key:String) -> String{
    return getLocalizedText(ms: key).capitalized
}
func setLang(langType :  LangType){
    appLangType = langType;
}

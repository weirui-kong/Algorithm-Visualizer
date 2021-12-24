//
//  SortView.swift
//  Algorithm Visualizer
//
//  Created by 孔维锐 on 2021/12/11.
//

import SwiftUI


let BarWidth: CGFloat = 20
let BarMaxHeight: CGFloat = 200
let BarUnit: CGFloat = 20
let BarColor_Default: Color = .white
let BarColr_Selected: Color = .purple

var timer: Timer?
var generalCounter: Int = 0
var cockTailShaker: Bool = false // this allows to visualize 'cocktail shaker' which takes turns on each end

enum Sorting {
    case bubble, selection, quick, merge, cocktail
    
    var sortingSpeed: TimeInterval {
        switch self {
        case .bubble:       return 0.6
        case .selection:   return 1.0
        case .quick:        return 1.3
        case .merge:        return 1.3
        case .cocktail:     return 0.8
        }
    }
}

//========================= INIT =========================
/*
 This returns bars list to be rendered based on the screen width
 */
func _initializeBarList() -> [Bar] {
    var out: [Bar] = []
    // starting from 1 to multiply
    let num = 10
    //simply use 10 bars
    //let num = Int((UIScreen.main.bounds.width - 10) / (BarWidth + 10))
    for n in 1...num {
        let input: CGFloat = (CGFloat(n) * BarUnit)
        out.append(Bar(value: input, selected: false))
        if input >= BarMaxHeight { // shouldn't exceed the max height. stop adding
            break
        }
    }
    return out
}

struct SortView: View {
    @Binding var majorView: MajorView
    @State var showSortView = true
    @State var seletedTab: Int = 0
    var body: some View{
        ZStack{
            NavigationView{
                TabView(selection: $seletedTab){
                    SortPanel()
                        .tabItem{
                            VStack{
                                Image(systemName: "rectangle.3.group.bubble.left")
                                Button(getLocalizedTextCapitalized(key: "sort"), action: {})
                            }
                        }
                    //                    DataCollectView()
                    //                        .tabItem{
                    //                            VStack{
                    //                                Image(systemName: "list.number")
                    //                                Button("Daten", action: {})
                    //                            }
                    //                        }
                    SortInfoView()
                        .tabItem{
                            VStack{
                                Image(systemName: "doc.fill")
                                Button(getLocalizedTextCapitalized(key: "information"), action: {})
                            }
                        }
                }
                .navigationTitle(getLocalizedTextCapitalized(key: "sort"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack{
                            Button(action: {
                                withAnimation {
                                    majorView = .home
                                    showSortView.toggle()
                                }
                            }) {
                                Label("Back", systemImage: "arrow.left.circle.fill")
                            }
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack{
                            Button(action: {
                                withAnimation {
                                    majorView = .home
                                    showSortView.toggle()
                                }
                            }) {
                                Label("Info", systemImage: "info.circle.fill")
                            }
                        }
                    }
                }
            }
            
        }
        .scaleEffect(showSortView ? 1 : 0)
        .animation(.easeInOut)
        
    }
}


struct SortPanel: View{
    @State var isRunning = false
    @State var isPaused = false
    @State var pickerSelected = 0
    @State var barList: [Bar] = _initializeBarList().shuffled()
    @State var backLog: [Bar]?
    @State var executing = "to compare..."
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0, green: 1, blue: 0.895160675, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(getLocalizedTextCapitalized(key: "sort visualization"))
                    .font(.system(size: 32))
                    .foregroundColor(Color.black)
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelected, label: Text("")) {
                    Text(getLocalizedTextCapitalized(key: "bubble")).tag(0)
                    Text(getLocalizedTextCapitalized(key: "selection")).tag(1)
                    Text(getLocalizedTextCapitalized(key: "quick")).tag(2)
                    Text(getLocalizedTextCapitalized(key: "merge")).tag(3)
                    Text(getLocalizedTextCapitalized(key: "cocktail")).tag(4)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
                    .disabled(self.isRunning)
                HStack(spacing: 8) {
                    ForEach(self.barList, id: \.self) { bar in
                        bar
                    }
                }.padding(.top, 28).padding(.bottom, 28)
                    .animation(.default)
                
                
                HStack(spacing: 30) {
                    Button(action: {
                        if self._isSorted() {
                            self._shuffleList()
                        }
                        
                        if !self.isRunning {
                            self._startSorting()
                        } else if self.isRunning && !self.isPaused{
                            self._pauseResume()
                        } else if self.isRunning && self.isPaused {
                            self.isPaused = false
                            self._startSorting()
                        }
                    }) {
                        if !self.isRunning {
                            HStack{
                                Text(getLocalizedTextCapitalized(key: "start"))//start
                                    .fontWeight(.heavy)
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.black)
                                Image(systemName: "restart.circle.fill")
                            }
                            
                        } else if self.isRunning && !self.isPaused {
                            HStack{
                                Text(getLocalizedTextCapitalized(key: "pause"))//pause
                                    .fontWeight(.heavy)
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.black)
                                Image(systemName: "pause.circle")
                            }
                            
                        } else if self.isRunning && self.isPaused {
                            HStack{
                                Text(getLocalizedTextCapitalized(key: "resume"))//resume
                                    .fontWeight(.heavy)
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.black)
                                Image(systemName: "restart.circle")
                            }
                        }
                    }
                    
                    Button(action: {
                        // list shoudn't be shuffled while soring
                        if !self.isRunning {
                            self._shuffleList()
                        } else if self.isRunning {
                            timer?.invalidate()
                            self.isRunning = false
                            self.isPaused = false
                            self.barList = self.backLog ?? _initializeBarList()
                            self.backLog = nil
                        }
                    }) {
                        if !isRunning {
                            HStack{
                                Image(systemName: "shuffle.circle.fill")
                                Text(getLocalizedTextCapitalized(key: "shuffle"))//shuffle
                                    .fontWeight(.heavy)
                                    .font(.system(size: 30))
                                    .foregroundColor(!isRunning ? Color.black: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                            }
                        } else if isRunning {
                            // reset button should always be available
                            // this stop any activity, and reload the bar list
                            HStack{
                                Image(systemName: "arrow.clockwise")
                                Text(getLocalizedTextCapitalized(key: "reset"))//reset
                                    .fontWeight(.heavy)
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.black)
                            }
                            
                        }
                    }
                    
                }
                if(pickerSelected == 0){
                    Text(executing)
                }
            }
        }
    }
    
    
    //====================== BUTTONS ACTIONS =====================
    // This performs sorting algorithms, and adjust bar's value to be rendered
    public func _startSorting() -> Void {
        if backLog == nil {
            self.backLog = self.barList
        }
        switch pickerSelected {
        case 0: _performSorting(kind: .bubble)
        case 1: _performSorting(kind: .selection)
        case 2: _performSorting(kind: .quick)
        case 3: _performSorting(kind: .merge)
        case 4: _performSorting(kind: .cocktail)
        default:
            print("invalid picker input!")
            self._shuffleList()
        }
    }
    
    // This randomizes the bar arrays
    private func _shuffleList() -> Void {
        self.barList = _initializeBarList().shuffled()
    }
    
    private func _pauseResume() {
        timer?.invalidate()
        self.isPaused = true
    }
    //============================================================
    
    
    //========================= SORTINGS =========================
    public func _performSorting(kind: Sorting) {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: kind.sortingSpeed, repeats: true) { timer in
            switch kind {
            case .bubble: self._bubbleSort()
            case .selection: self._selectionSort()
            case .quick: self._quickSort(start: 0, end: self.barList.count - 1); if self._isSorted() { self.endOperation() }
            case .merge: self._mergeSort(start: 0, end: self.barList.count - 1); if self._isSorted() { self.endOperation() }
            case .cocktail: self._cocktailSort()
            }
        }
    }
    
    
    // perform bubble sort
    public func _bubbleSort() -> Void {
        let length: Int = self.barList.count
        for i in 0..<length - 1 {
            for j in 0..<length - i - 1 {
                self.barList[j].selected = true
                //divide by BarUnit
                executing = String(format: "%d > %d ? ", Int(self.barList[j].value/BarUnit), Int(self.barList[j+1].value/BarUnit))
                if Int(self.barList[j].value) > Int(self.barList[j+1].value) {
                    executing.append("YES")
                }else {
                    executing.append("No")
                }
                if self.barList[j].value > self.barList[j + 1].value {
                    self._swap(this: j, that: j + 1);
                    return; // timer loop goes on as long as it's valid
                }
            }
        }
        endOperation()
    }
    
    // perform selection sort
    public func _selectionSort() -> Void {
        let length: Int = self.barList.count
        
        for i in generalCounter..<length - 1 {
            generalCounter += 1
            var minIndex: Int = i
            
            for j in i + 1..<length {
                if barList[j].value < barList[minIndex].value {
                    minIndex = j
                }
            }
            self.barList[i].selected = true
            self.barList[minIndex].selected = true
            self._swap(this: i, that: minIndex)
            return;
        }
        endOperation()
    }
    
    // perform quick sort
    public func _quickSort(start: Int, end: Int) -> Void {
        if start < end { // comparing INDEXES
            let pivot: Int = self._makePartition(low: start, high: end)
            self.barList[pivot].selected = true
            
            self._quickSort(start: start, end: pivot - 1)
            self._quickSort(start: pivot + 1, end: end)
        }
    }
    
    // perform merge sort
    public func _mergeSort(start: Int, end: Int) -> Void {
        if start < end {
            let midPoint: Int = (start + end) / 2
            self.barList[midPoint].selected = true
            
            self._mergeSort(start: start, end: midPoint)
            self._mergeSort(start: midPoint + 1, end: end)
            
            self._merge(left: start, mid: midPoint, right: end)
        }
        endOperation()
    }
    
    // perform cocktail sort
    public func _cocktailSort() -> Void {
        cockTailShaker = !cockTailShaker
        var swapped: Bool = true
        var start: Int = 0
        var end: Int = self.barList.count
        
        while swapped == true {
            swapped = false;
            
            for i in start..<end - 1 {
                if (self.barList[i].value > self.barList[i + 1].value) {
                    self.barList[i].selected = true
                    self._swap(this: i, that: i + 1)
                    swapped = true
                    if cockTailShaker { return; }
                }
            }
            if swapped == false {
                break
            }
            
            swapped = false
            end = self.barList.count - 1;
            
            for i in stride(from: end - 1, through: start, by: -1) {
                if (self.barList[i].value > self.barList[i + 1].value) {
                    self.barList[i].selected = true
                    self._swap(this: i, that: i + 1)
                    swapped = true
                    if !cockTailShaker { return; }
                }
            }
            start = start + 1;
        }
        
        endOperation()
    }
    //============================================================
    
    
    //====================== UTILS + HELPERS =====================
    
    // this swaps two bars based on the given indexes
    func _swap(this: Int, that: Int) -> Void {
        let temp = self.barList[this]
        self.barList[this] = self.barList[that]
        self.barList[that] = temp
    }
    
    // this ends sorting operation, and reset states
    func endOperation() -> Void {
        timer?.invalidate() // invalidate timer loop
        isRunning = false // update running status once sorting is finished
        isPaused = false
        backLog = nil
        generalCounter = 0
    }
    
    // validate if barList is sorted properly
    func _isSorted() -> Bool {
        for i in 0..<self.barList.count - 1 {
            if self.barList[i].value > self.barList[i + 1].value {
                return false
            }
        }
        return true
    }
    
    // Quick sort helper
    // This returns an index for a partition in barList array (based on the right-most elem) + swaps order
    func _makePartition(low: Int, high: Int) -> Int  {
        let pivot: Bar = self.barList[high]
        var smallestIndex: Int = low
        
        for i in low..<high {
            if (self.barList[i].value < pivot.value) {
                smallestIndex += 1
            }
        }
        
        self._swap(this: smallestIndex, that: high)
        
        return smallestIndex
    }
    
    // Merge sort helper
    // This merges two different subarrays from merge sort
    func _merge(left: Int, mid: Int, right: Int) -> Void {
        var leftIndex: Int = left
        var rightIndex: Int = mid + 1
        var newIndex: Int = 0
        
        var temp: [Bar?] = [Bar?] (repeating: nil, count: right - left + 1)
        
        while leftIndex <= mid && rightIndex <= right {
            if self.barList[leftIndex].value <= self.barList[rightIndex].value {
                temp[newIndex] = self.barList[leftIndex];
                leftIndex += 1
            } else {
                temp[newIndex] = self.barList[rightIndex];
                rightIndex += 1
            }
            newIndex += 1
        }
        
        while leftIndex <= mid {
            temp[newIndex] = self.barList[leftIndex];
            newIndex += 1
            leftIndex += 1
        }
        
        while rightIndex <= right {
            temp[newIndex] = self.barList[rightIndex];
            newIndex += 1
            rightIndex += 1
        }
        
        for m in left...right {
            self.barList[m] = temp[m - left] ?? Bar(value: 10, selected: false)
        }
    }
    
    //============================================================
    
    
}






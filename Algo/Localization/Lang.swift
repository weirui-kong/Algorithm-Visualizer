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
    "minimum value":"minimum value",
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
    "minimum value":"最小值",
    
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
    "minimum value":"極小值",
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
    "minimum value":"Mindestwert",
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

let sort_document:String =
"""
<blockquote>
<ul>
<li>ENGLISH VERSION ONLY</li>
<li>NUR IN ENGLISCHER SPRACHE</li>
<li>仅提供英文版</li>
<li>僅限英文版</li>
</ul>
</blockquote>
<h1 id="bubble-sort">Bubble Sort</h1>
<p>Bubble sort, sometimes referred to as sinking sort, is a simple sorting algorithm that repeatedly steps through the list, compares adjacent elements and swaps them if they are in the wrong order. The pass through the list is repeated until the list is sorted. The algorithm, which is a comparison sort, is named for the way smaller or larger elements &quot;bubble&quot; to the top of the list.</p>
<p>This simple algorithm performs poorly in real world use and is used primarily as an educational tool. More efficient algorithms such as quicksort, timsort, or merge sort are used by the sorting libraries built into popular programming languages such as Python and Java.</p>
<h2 id="performance">Performance</h2>
<p>Bubble sort has a worst-case and average complexity of <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6cd9594a16cb898b8f2a2dff9227a385ec183392" alt="img">, where n is the number of items being sorted. Most practical sorting algorithms have substantially better worst-case or average complexity, often <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/8b5ea2d55d8c31feb17ce14f35da4c93f94982b3" alt="img">. Even other <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6cd9594a16cb898b8f2a2dff9227a385ec183392" alt="img"> sorting algorithms, such as insertion sort, generally run faster than bubble sort, and are no more complex. Therefore, bubble sort is not a practical sorting algorithm.</p>
<p>The only significant advantage that bubble sort has over most other algorithms, even quicksort, but not insertion sort, is that the ability to detect that the list is sorted efficiently is built into the algorithm. When the list is already sorted (best-case), the complexity of bubble sort is only O(n). By contrast, most other algorithms, even those with better average-case complexity, perform their entire sorting process on the set and thus are more complex. However, not only does insertion sort share this advantage, but it also performs better on a list that is substantially sorted (having a small number of inversions). Additionally, if this behavior is desired, it can be trivially added to any other algorithm by checking the list before the algorithm runs.</p>
<h1 id="selection-sort">Selection sort</h1>
<p>In computer science, selection sort is an in-place comparison sorting algorithm. It has an <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6cd9594a16cb898b8f2a2dff9227a385ec183392" alt="img"> time complexity, which makes it inefficient on large lists, and generally performs worse than the similar insertion sort. Selection sort is noted for its simplicity and has performance advantages over more complicated algorithms in certain situations, particularly where auxiliary memory is limited.</p>
<p>The algorithm divides the input list into two parts: a sorted sublist of items which is built up from left to right at the front (left) of the list and a sublist of the remaining unsorted items that occupy the rest of the list. Initially, the sorted sublist is empty and the unsorted sublist is the entire input list. The algorithm proceeds by finding the smallest (or largest, depending on sorting order) element in the unsorted sublist, exchanging (swapping) it with the leftmost unsorted element (putting it in sorted order), and moving the sublist boundaries one element to the right.</p>
<p>The time efficiency of selection sort is quadratic, so there are a number of sorting techniques which have better time complexity than selection sort. One thing which distinguishes selection sort from other sorting algorithms is that it makes the minimum possible number of swaps, n − 1 in the worst case.</p>
<h2 id="complexity">Complexity</h2>
<p>Selection sort is not difficult to analyze compared to other sorting algorithms, since none of the loops depend on the data in the array. Selecting the minimum requires scanning n elements (taking <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/fbd0b0f32b28f51962943ee9ede4fb34198a2521" alt="img"> comparisons) and then swapping it into the first position. Finding the next lowest element requires scanning the remaining <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/fbd0b0f32b28f51962943ee9ede4fb34198a2521" alt="img"> elements and so on. Therefore, the total number of comparisons is </p>
<p><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/022f41f8c29a0da175bc0d4f84c53a8046e6cb8f" alt="img"></p>
<p>By arithmetic progression,</p>
<p><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/5042a309a9d1de0d8c89443c1950dd1e28a802e3" alt="img"></p>
<p>which is of complexity <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6cd9594a16cb898b8f2a2dff9227a385ec183392" alt="img"> in terms of number of comparisons. Each of these scans requires one swap for <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/fbd0b0f32b28f51962943ee9ede4fb34198a2521" alt="img"> elements (the final element is already in place).</p>
<h1 id="quick-sort">Quick Sort</h1>
<p>Quicksort is an in-place sorting algorithm. Developed by British computer scientist Tony Hoare in 1959 and published in 1961, it is still a commonly used algorithm for sorting. When implemented well, it can be somewhat faster than merge sort and about two or three times faster than heapsort.</p>
<p>Quicksort is a divide-and-conquer algorithm. It works by selecting a &#39;pivot&#39; element from the array and partitioning the other elements into two sub-arrays, according to whether they are less than or greater than the pivot. For this reason, it is sometimes called partition-exchange sort. The sub-arrays are then sorted recursively. This can be done in-place, requiring small additional amounts of memory to perform the sorting.</p>
<p>Quicksort is a comparison sort, meaning that it can sort items of any type for which a &quot;less-than&quot; relation (formally, a total order) is defined. Efficient implementations of Quicksort are not a stable sort, meaning that the relative order of equal sort items is not preserved.</p>
<p>Mathematical analysis of quicksort shows that, on average, the algorithm takes <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/8b5ea2d55d8c31feb17ce14f35da4c93f94982b3" alt="img"> comparisons to sort n items. In the worst case, it makes <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6cd9594a16cb898b8f2a2dff9227a385ec183392" alt="img"> comparisons.</p>
<h2 id="algorithm">Algorithm</h2>
<p>Quicksort is a type of divide and conquer algorithm for sorting an array, based on a partitioning routine; the details of this partitioning can vary somewhat, so that quicksort is really a family of closely related algorithms. Applied to a range of at least two elements, partitioning produces a division into two consecutive non empty sub-ranges, in such a way that no element of the first sub-range is greater than any element of the second sub-range. After applying this partition, quicksort then recursively sorts the sub-ranges, possibly after excluding from them an element at the point of division that is at this point known to be already in its final location. Due to its recursive nature, quicksort (like the partition routine) has to be formulated so as to be callable for a range within a larger array, even if the ultimate goal is to sort a complete array. The steps for in-place quicksort are:</p>
<ul>
<li>If the range has less than two elements, return immediately as there is nothing to do. Possibly for other very short lengths a special-purpose sorting method is applied and the remainder of these steps skipped.</li>
<li>Otherwise pick a value, called a pivot, that occurs in the range (the precise manner of choosing depends on the partition routine, and can involve randomness).
Partition the range: reorder its elements, while determining a point of division, so that all elements with values less than the pivot come before the division, while all elements with values greater than the pivot come after it; elements that are equal to the pivot can go either way. Since at least one instance of the pivot is present, most partition routines ensure that the value that ends up at the point of division is equal to the pivot, and is now in its final position (but termination of quicksort does not depend on this, as long as sub-ranges strictly smaller than the original are produced).</li>
<li>Recursively apply the quicksort to the sub-range up to the point of division and to the sub-range after it, possibly excluding from both ranges the element equal to the pivot at the point of division. (If the partition produces a possibly larger sub-range near the boundary where all elements are known to be equal to the pivot, these can be excluded as well.)</li>
<li>The choice of partition routine (including the pivot selection) and other details not entirely specified above can affect the algorithm&#39;s performance, possibly to a great extent for specific input arrays. In discussing the efficiency of quicksort, it is therefore necessary to specify these choices first. Here we mention two specific partition methods.</li>
</ul>
<h2 id="formal-analysis">Formal analysis</h2>
<h3 id="worst-case-analysis">Worst-case analysis</h3>
<p>The most unbalanced partition occurs when one of the sublists returned by the partitioning routine is of size n − 1. This may occur if the pivot happens to be the smallest or largest element in the list, or in some implementations (e.g., the Lomuto partition scheme as described above) when all the elements are equal.</p>
<p>If this happens repeatedly in every partition, then each recursive call processes a list of size one less than the previous list. Consequently, we can make n − 1 nested calls before we reach a list of size 1. This means that the call tree is a linear chain of n − 1 nested calls. The ith call does O(n − i) work to do the partition, and <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/8829d4203c5b6319b5752064f10812e9aa8e3b20" alt="img">, so in that case quicksort takes O(n2) time.</p>
<h3 id="best-case-analysis">Best-case analysis</h3>
<p>In the most balanced case, each time we perform a partition we divide the list into two nearly equal pieces. This means each recursive call processes a list of half the size. Consequently, we can make only log2 n nested calls before we reach a list of size 1. This means that the depth of the call tree is log2 n. But no two calls at the same level of the call tree process the same part of the original list; thus, each level of calls needs only O(n) time all together (each call has some constant overhead, but since there are only O(n) calls at each level, this is subsumed in the O(n) factor). The result is that the algorithm uses only O(n log n) time.</p>
<p>Average-case analysis[edit]
To sort an array of n distinct elements, quicksort takes O(n log n) time in expectation, averaged over all n! permutations of n elements with equal probability. We list here three common proofs to this claim providing different insights into quicksort&#39;s workings.</p>
<p>Using percentiles[edit]
If each pivot has rank somewhere in the middle 50 percent, that is, between the 25th percentile and the 75th percentile, then it splits the elements with at least 25% and at most 75% on each side. If we could consistently choose such pivots, we would only have to split the list at most
<img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/472aaeba13d1c610fa5606a60d0f46510934ffe6" alt="img"> times before reaching lists of size 1, yielding an O(n log n) algorithm.</p>
<p>When the input is a random permutation, the pivot has a random rank, and so it is not guaranteed to be in the middle 50 percent. However, when we start from a random permutation, in each recursive call the pivot has a random rank in its list, and so it is in the middle 50 percent about half the time. That is good enough. Imagine that a coin is flipped: heads means that the rank of the pivot is in the middle 50 percent, tail means that it isn&#39;t. Now imagine that the coin is flipped over and over until it gets k heads. Although this could take a long time, on average only 2k flips are required, and the chance that the coin won&#39;t get k heads after 100k flips is highly improbable (this can be made rigorous using Chernoff bounds). By the same argument, Quicksort&#39;s recursion will terminate on average at a call depth of only
<img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/e78465031be8070063f91b1089c08e34f2ad7e7f" alt="img">. But if its average call depth is O(log n), and each level of the call tree processes at most n elements, the total amount of work done on average is the product, O(n log n). The algorithm does not have to verify that the pivot is in the middle half—if we hit it any constant fraction of the times, that is enough for the desired complexity.</p>
<h3 id="using-recurrences">Using recurrences</h3>
<p>An alternative approach is to set up a recurrence relation for the T(n) factor, the time needed to sort a list of size n. In the most unbalanced case, a single quicksort call involves O(n) work plus two recursive calls on lists of size 0 and n−1, so the recurrence relation is <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/b81a41c256cda3a04bf949533833270d7451d8d0" alt="img">.
This is the same relation as for insertion sort and selection sort, and it solves to worst case T(n) = O(n2).</p>
<p>In the most balanced case, a single quicksort call involves O(n) work plus two recursive calls on lists of size n/2, so the recurrence relation is <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/bc4b7a2077256a99347a4b53ff4d22252e1a87a6" alt="img">. The master theorem for divide-and-conquer recurrences tells us that T(n) = O(n log n).</p>
<p>The outline of a formal proof of the O(n log n) expected time complexity follows. Assume that there are no duplicates as duplicates could be handled with linear time pre- and post-processing, or considered cases easier than the analyzed. When the input is a random permutation, the rank of the pivot is uniform random from 0 to n − 1. Then the resulting parts of the partition have sizes i and n − i − 1, and i is uniform random from 0 to n − 1. So, averaging over all possible splits and noting that the number of comparisons for the partition is n − 1, the average number of comparisons over all permutations of the input sequence can be estimated accurately by solving the recurrence relation: <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/3174160e1ef234d8900a269bfc0aef28c7b1633e" alt="img">
Solving the recurrence gives C(n) = 2n ln n ≈ 1.39n log2 n.</p>
<p>This means that, on average, quicksort performs only about 39% worse than in its best case. In this sense, it is closer to the best case than the worst case. A comparison sort cannot use less than log2(n!) comparisons on average to sort n items (as explained in the article Comparison sort) and in case of large n, Stirling&#39;s approximation yields log2(n!) ≈ n(log2 n − log2 e), so quicksort is not much worse than an ideal comparison sort. This fast average runtime is another reason for quicksort&#39;s practical dominance over other sorting algorithms.</p>
<h3 id="using-a-binary-search-tree">Using a binary search tree</h3>
<p>The following binary search tree (BST) corresponds to each execution of quicksort: the initial pivot is the root node; the pivot of the left half is the root of the left subtree, the pivot of the right half is the root of the right subtree, and so on. The number of comparisons of the execution of quicksort equals the number of comparisons during the construction of the BST by a sequence of insertions. So, the average number of comparisons for randomized quicksort equals the average cost of constructing a BST when the values inserted
<img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/47d8b3ec62633086002489cad8df4214e9585880" alt="img"> form a random permutation.</p>
<p>Consider a BST created by insertion of a sequence
<img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/47d8b3ec62633086002489cad8df4214e9585880" alt="img"> of values forming a random permutation. Let C denote the cost of creation of the BST. We have <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/921aa43a360e47b12cf9babd977d24387dd8ad6c" alt="img">
We end with a short calculation:</p>
<p><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/d2dadca7408799f6c84e2f2e80c4099e56cbe970" alt="img"></p>
<h3 id="space-complexity">Space complexity</h3>
<p>The space used by quicksort depends on the version used.</p>
<p>The in-place version of quicksort has a space complexity of O(log n), even in the worst case, when it is carefully implemented using the following strategies.</p>
<p>In-place partitioning is used. This unstable partition requires O(1) space.
After partitioning, the partition with the fewest elements is (recursively) sorted first, requiring at most O(log n) space. Then the other partition is sorted using tail recursion or iteration, which doesn&#39;t add to the call stack. This idea, as discussed above, was described by R. Sedgewick, and keeps the stack depth bounded by O(log n).
Quicksort with in-place and unstable partitioning uses only constant additional space before making any recursive call. Quicksort must store a constant amount of information for each nested recursive call. Since the best case makes at most O(log n) nested recursive calls, it uses O(log n) space. However, without Sedgewick&#39;s trick to limit the recursive calls, in the worst case quicksort could make O(n) nested recursive calls and need O(n) auxiliary space.</p>
<p>From a bit complexity viewpoint, variables such as lo and hi do not use constant space; it takes O(log n) bits to index into a list of n items. Because there are such variables in every stack frame, quicksort using Sedgewick&#39;s trick requires O((log n)2) bits of space. This space requirement isn&#39;t too terrible, though, since if the list contained distinct elements, it would need at least O(n log n) bits of space.</p>
<p>Another, less common, not-in-place, version of quicksort uses O(n) space for working storage and can implement a stable sort. The working storage allows the input array to be easily partitioned in a stable manner and then copied back to the input array for successive recursive calls. Sedgewick&#39;s optimization is still appropriate.</p>
<h3 id="space-complexity">Space complexity</h3>
<p>The space used by quicksort depends on the version used.</p>
<p>The in-place version of quicksort has a space complexity of O(log n), even in the worst case, when it is carefully implemented using the following strategies.</p>
<p>In-place partitioning is used. This unstable partition requires O(1) space.
After partitioning, the partition with the fewest elements is (recursively) sorted first, requiring at most O(log n) space. Then the other partition is sorted using tail recursion or iteration, which doesn&#39;t add to the call stack. This idea, as discussed above, was described by R. Sedgewick, and keeps the stack depth bounded by O(log n).
Quicksort with in-place and unstable partitioning uses only constant additional space before making any recursive call. Quicksort must store a constant amount of information for each nested recursive call. Since the best case makes at most O(log n) nested recursive calls, it uses O(log n) space. However, without Sedgewick&#39;s trick to limit the recursive calls, in the worst case quicksort could make O(n) nested recursive calls and need O(n) auxiliary space.</p>
<p>From a bit complexity viewpoint, variables such as lo and hi do not use constant space; it takes O(log n) bits to index into a list of n items. Because there are such variables in every stack frame, quicksort using Sedgewick&#39;s trick requires O((log n)2) bits of space. This space requirement isn&#39;t too terrible, though, since if the list contained distinct elements, it would need at least O(n log n) bits of space.</p>
<p>Another, less common, not-in-place, version of quicksort uses O(n) space for working storage and can implement a stable sort. The working storage allows the input array to be easily partitioned in a stable manner and then copied back to the input array for successive recursive calls. Sedgewick&#39;s optimization is still appropriate.</p>
<h1 id="merge-sort">Merge Sort</h1>
<p>In computer science, merge sort (also commonly spelled as mergesort) is an efficient, general-purpose, and comparison-based sorting algorithm. Most implementations produce a stable sort, which means that the order of equal elements is the same in the input and output. Merge sort is a divide and conquer algorithm that was invented by John von Neumann in 1945. A detailed description and analysis of bottom-up merge sort appeared in a report by Goldstine and von Neumann as early as 1948.</p>
<h2 id="algorithm">Algorithm</h2>
<p>Conceptually, a merge sort works as follows:</p>
<ul>
<li>Divide the unsorted list into n sublists, each containing one element (a list of one element is considered sorted).</li>
<li>Repeatedly merge sublists to produce new sorted sublists until there is only one sublist remaining. This will be the sorted list.</li>
</ul>
<h2 id="natural-merge-sort">Natural merge sort</h2>
<p>A natural merge sort is similar to a bottom-up merge sort except that any naturally occurring runs (sorted sequences) in the input are exploited. Both monotonic and bitonic (alternating up/down) runs may be exploited, with lists (or equivalently tapes or files) being convenient data structures (used as FIFO queues or LIFO stacks). In the bottom-up merge sort, the starting point assumes each run is one item long. In practice, random input data will have many short runs that just happen to be sorted. In the typical case, the natural merge sort may not need as many passes because there are fewer runs to merge. In the best case, the input is already sorted (i.e., is one run), so the natural merge sort need only make one pass through the data. In many practical cases, long natural runs are present, and for that reason natural merge sort is exploited as the key component of Timsort. </p>
<h2 id="analysis">Analysis</h2>
<p>In sorting n objects, merge sort has an average and worst-case performance of O(n log n). If the running time of merge sort for a list of length n is T(n), then the recurrence relation T(n) = 2T(n/2) + n follows from the definition of the algorithm (apply the algorithm to two lists of half the size of the original list, and add the n steps taken to merge the resulting two lists). The closed form follows from the master theorem for divide-and-conquer recurrences.</p>
<p>The number of comparisons made by merge sort in the worst case is given by the sorting numbers. These numbers are equal to or slightly smaller than (n ⌈lg n⌉ − 2⌈lg n⌉ + 1), which is between (n lg n − n + 1) and (n lg n + n + O(lg n)). Merge sort&#39;s best case takes about half as many iterations as its worst case.</p>
<p>For large n and a randomly ordered input list, merge sort&#39;s expected (average) number of comparisons approaches α·n fewer than the worst case, where
<img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/d26965fea07d841c85071c791f70ba88a721f280" alt="img"></p>
<p>In the worst case, merge sort uses approximately 39% fewer comparisons than quicksort does in its average case, and in terms of moves, merge sort&#39;s worst case complexity is O(n log n) - the same complexity as quicksort&#39;s best case.</p>
<p>Merge sort is more efficient than quicksort for some types of lists if the data to be sorted can only be efficiently accessed sequentially, and is thus popular in languages such as Lisp, where sequentially accessed data structures are very common. Unlike some (efficient) implementations of quicksort, merge sort is a stable sort.</p>
<p>Merge sort&#39;s most common implementation does not sort in place; therefore, the memory size of the input must be allocated for the sorted output to be stored in (see below for variations that need only n/2 extra spaces).</p>
<h1 id="cocktail-shaker-sort">Cocktail shaker sort</h1>
<p>Cocktail shaker sort, also known as bidirectional bubble sort, cocktail sort, shaker sort (which can also refer to a variant of selection sort), ripple sort, shuffle sort, or shuttle sort, is an extension of bubble sort. The algorithm extends bubble sort by operating in two directions. While it improves on bubble sort by more quickly moving items to the beginning of the list, it provides only marginal performance improvements.</p>
<p>Like most variants of bubble sort, cocktail shaker sort is used primarily as an educational tool. More performant algorithms such as timsort, or merge sort are used by the sorting libraries built into popular programming languages such as Python and Java.</p>
<h2 id="differences-from-bubble-sort">Differences from bubble sort</h2>
<p>Cocktail shaker sort is a slight variation of bubble sort. It differs in that instead of repeatedly passing through the list from bottom to top, it passes alternately from bottom to top and then from top to bottom. It can achieve slightly better performance than a standard bubble sort. The reason for this is that bubble sort only passes through the list in one direction and therefore can only move items backward one step each iteration.</p>
<p>An example of a list that proves this point is the list (2,3,4,5,1), which would only need to go through one pass of cocktail sort to become sorted, but if using an ascending bubble sort would take four passes. However one cocktail sort pass should be counted as two bubble sort passes. Typically cocktail sort is less than two times faster than bubble sort.</p>
<p>Another optimization can be that the algorithm remembers where the last actual swap has been done. In the next iteration, there will be no swaps beyond this limit and the algorithm has shorter passes. As the cocktail shaker sort goes bidirectionally, the range of possible swaps, which is the range to be tested, will reduce per pass, thus reducing the overall running time slightly.</p>
<h2 id="complexity">Complexity</h2>
<p>The complexity of the cocktail shaker sort in big O notation is O(n^2) for both the worst case and the average case, but it becomes closer to O(n) if the list is mostly ordered before applying the sorting algorithm. For example, if every element is at a position that differs by at most k (k ≥ 1) from the position it is going to end up in, the complexity of cocktail shaker sort becomes O(kn).</p>
<p>The cocktail shaker sort is also briefly discussed in the book The Art of Computer Programming, along with similar refinements of bubble sort. In conclusion, Knuth states about bubble sort and its improvements:</p>
<p>But none of these refinements leads to an algorithm better than straight insertion [that is, insertion sort]; and we already know that straight insertion isn&#39;t suitable for large N. [...] In short, the bubble sort seems to have nothing to recommend it, except a catchy name and the fact that it leads to some interesting theoretical problems.</p>
<p>— D. E. Knuth</p>
<blockquote>
<p><strong>NOTE: ALL OF DOCUMENTS ARE BASED ON WIKIPEDIA, THIS APP AND PROJECT SHARE NO PART OF COPYRIGHTS</strong></p>
</blockquote>

"""

//
//  GenericsOne.swift
//  FlexMonkeyExamples
//
//  Created by Simon Gladman on 10/05/2015.
//  Copyright (c) 2015 Simon Gladman. All rights reserved.
//


func horizontalJoinCompare_v1(firstArray: [Float], secondArray: [Float]) -> [(Float, Float, Bool)]
{
    var returnArray = [(Float, Float, Bool)]()
    
    let n = min(firstArray.count, secondArray.count)
    
    for var i = 0; i < n; i++
    {
        returnArray.append((firstArray[i], secondArray[i], firstArray[i] == secondArray[i]))
    }
    
    return returnArray
}

let sourceOne = [Float(2.5), Float(3.9), Float(6.25)]
let sourceTwo = [Float(1.5), Float(3.9), Float(6.05), Float(4.75)]

// --------

typealias JoinCompareResult = (Float, Float, Bool)

func horizontalJoinCompare_v2(firstArray: [Float], secondArray: [Float]) -> [JoinCompareResult]
{
    var returnArray = [JoinCompareResult]()
    
    let zippedArrays = zip(firstArray, secondArray)
    
    for zippedItem in zippedArrays
    {
        returnArray.append((zippedItem.0, zippedItem.1, zippedItem.0 == zippedItem.1))
    }
    
    return returnArray
}

// --------

typealias JoinCompareResults = [(Float, Float, Bool)]

func horizontalJoinCompare_v3(firstArray: [Float], secondArray: [Float]) -> JoinCompareResults
{
    return Array(zip(firstArray, secondArray)).map
        {
            (zippedItemOne, zippedItemTwo) in return (zippedItemOne, zippedItemTwo, zippedItemOne == zippedItemTwo)
    }
}

// --------

func horizontalJoinCompare_v4(firstArray: [Float], secondArray: [Float]) -> JoinCompareResults
{
    return Array(zip(firstArray, secondArray)).map { ($0, $1, $0 == $1) }
}

// --------

typealias GenericJoinCompareResults = [(Equatable, Equatable, Bool)]

func horizontalJoinCompare_v5<T:Equatable>(firstArray: [T], secondArray: [T]) -> GenericJoinCompareResults
{
    return Array(zip(firstArray, secondArray)).map { ($0, $1, $0 == $1) }
}

// --------

func horizontalJoinCompare_v6<T:Equatable>(firstArray: [T], secondArray: [T]) -> GenericJoinCompareResults
{
    return map(zip(firstArray, secondArray)){ ($0, $1, $0 == $1) }
}

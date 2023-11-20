//
//  NetworkError.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 11/11/2023.
//

import Foundation

enum NetworkError: String, Error{
    case invalidURL         = "invalid url"
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid data recieved fron the server. Please try again"
    case invalidData        = "The data received from the server was invalid. Please try again."
}

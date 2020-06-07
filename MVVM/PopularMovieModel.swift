//
//	PopularMovieModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct PopularMovieModel{

	var page : Int!
	var results : [PopularMovieResult]!
	var totalPages : Int!
	var totalResults : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		page = dictionary["page"] as? Int
		results = [PopularMovieResult]()
		if let resultsArray = dictionary["results"] as? [[String:Any]]{
			for dic in resultsArray{
				let value = PopularMovieResult(fromDictionary: dic)
				results.append(value)
			}
		}
		totalPages = dictionary["total_pages"] as? Int
		totalResults = dictionary["total_results"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if page != nil{
			dictionary["page"] = page
		}
		if results != nil{
			var dictionaryElements = [[String:Any]]()
			for resultsElement in results {
				dictionaryElements.append(resultsElement.toDictionary())
			}
			dictionary["results"] = dictionaryElements
		}
		if totalPages != nil{
			dictionary["total_pages"] = totalPages
		}
		if totalResults != nil{
			dictionary["total_results"] = totalResults
		}
		return dictionary
	}

}
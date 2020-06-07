//
//	PopularMovieResult.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct PopularMovieResult{

	var adult : Bool!
	var backdropPath : String!
	var genreIds : [Int]!
	var id : Int!
	var originalLanguage : String!
	var originalTitle : String!
	var overview : String!
	var popularity : Float!
	var posterPath : String!
	var releaseDate : String!
	var title : String!
	var video : Bool!
	var voteAverage : Float!
	var voteCount : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		adult = dictionary["adult"] as? Bool
		backdropPath = dictionary["backdrop_path"] as? String
		genreIds = dictionary["genre_ids"] as? [Int]
		id = dictionary["id"] as? Int
		originalLanguage = dictionary["original_language"] as? String
		originalTitle = dictionary["original_title"] as? String
		overview = dictionary["overview"] as? String
		popularity = dictionary["popularity"] as? Float
		posterPath = dictionary["poster_path"] as? String
		releaseDate = dictionary["release_date"] as? String
		title = dictionary["title"] as? String
		video = dictionary["video"] as? Bool
		voteAverage = dictionary["vote_average"] as? Float
		voteCount = dictionary["vote_count"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if adult != nil{
			dictionary["adult"] = adult
		}
		if backdropPath != nil{
			dictionary["backdrop_path"] = backdropPath
		}
		if genreIds != nil{
			dictionary["genre_ids"] = genreIds
		}
		if id != nil{
			dictionary["id"] = id
		}
		if originalLanguage != nil{
			dictionary["original_language"] = originalLanguage
		}
		if originalTitle != nil{
			dictionary["original_title"] = originalTitle
		}
		if overview != nil{
			dictionary["overview"] = overview
		}
		if popularity != nil{
			dictionary["popularity"] = popularity
		}
		if posterPath != nil{
			dictionary["poster_path"] = posterPath
		}
		if releaseDate != nil{
			dictionary["release_date"] = releaseDate
		}
		if title != nil{
			dictionary["title"] = title
		}
		if video != nil{
			dictionary["video"] = video
		}
		if voteAverage != nil{
			dictionary["vote_average"] = voteAverage
		}
		if voteCount != nil{
			dictionary["vote_count"] = voteCount
		}
		return dictionary
	}

}
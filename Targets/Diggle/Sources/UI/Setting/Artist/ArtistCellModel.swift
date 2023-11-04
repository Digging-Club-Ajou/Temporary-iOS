//
//  ArtistCellModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/28.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct ArtistCellModel: Identifiable {
    let id: String = UUID().uuidString
    let imageSource: Image
    let text: String
    var isSelected: Bool = false
    
    var opacity: CGFloat {
        isSelected ? 0.7 : 1
    }
    
    var isOverlayViewPresented: Bool {
        isSelected
    }
    
    static func indyGroupArtists() -> [ArtistCellModel] {
        [
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "새소년"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "DPR"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "wave to earth"),
            
                .init(imageSource: Image.Artist.blackpink.image,
                      text: "잔나비"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "검정치마"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "쏜애플\n(THORNAPPLE)"),
        ]
    }
    
    static func indySoloArtists() -> [ArtistCellModel] {
        [
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "10CM"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "우효"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "최유리"),
            
                .init(imageSource: Image.Artist.blackpink.image,
                      text: "CHEEZE (치즈)"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "Crush"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "기리보이"),
        ]
    }
    
    static func girlGroupArtists() -> [ArtistCellModel] {
        [
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "NewJeans"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "다비치"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "BLACKPINK"),
            
                .init(imageSource: Image.Artist.blackpink.image,
                      text: "STACY\n (스테이씨)"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "프로미스나인"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "Red velvet\n (레드벨벳)"),
        ]
    }
    
    static func girlSoloArtists() -> [ArtistCellModel] {
        [
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "아이유"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "에일리"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "이영지"),
            
                .init(imageSource: Image.Artist.blackpink.image,
                      text: "백예린"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "볼빨간 사춘기"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "태연"),
        ]
    }
    
    static func boyGroupArtists() -> [ArtistCellModel] {
        [
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "NCT 127"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "방탄소년단"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "DAY6"),
            
                .init(imageSource: Image.Artist.blackpink.image,
                      text: "세븐틴"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "몬스타엑스"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "LUCY"),
        ]
    }
    
    static func boySoloArtists() -> [ArtistCellModel] {
        [
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "정국"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "성시경"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "폴킴"),
            
                .init(imageSource: Image.Artist.blackpink.image,
                      text: "박재범"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "쿠기"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "임한별"),
        ]
    }
    
    static func foreginWomanArtists() -> [ArtistCellModel] {
        [
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "Ariana Grande"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "Taylor Swift"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "Kelly Clarkson"),
            
                .init(imageSource: Image.Artist.blackpink.image,
                      text: "Doja Cat"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "Whitney Houston"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "Kehiani"),
        ]
    }
    
    static func foreginManArtists() -> [ArtistCellModel] {
        [
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "Ed Sheeran"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "Mac Miller"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "Coldplay"),
            
                .init(imageSource: Image.Artist.blackpink.image,
                      text: "Micheal Jackson"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "Charlie Puth"),
            .init(imageSource: Image.Artist.blackpink.image,
                  text: "The Weeknd"),
        ]
    }
}

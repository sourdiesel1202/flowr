//
//  PostUtil.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import Foundation
struct PostUtil {
    static func loadPublicFeed() -> [Post]  {
        return Bundle.main.decode([Post].self, from: "feed.json")
        //    return strains.filter({$0.name.lowercased()==name.lowercased()}).first
    }
    static func loadCircleFeed(user: User) -> [Post]{
        return [Post]()
    }
    static func loadPostById(id: String)-> Post{
        var _post = Post.example
        self.loadPublicFeed().forEach(){ post in
            if post.id == id{
                _post = post
            }
            
        }
        return _post
    }
    
    static func loadPublicUserFeed(user: User) -> [Post]{
        return Bundle.main.decode([Post].self, from: "feed.json").filter({$0.review.user==user.id && $0.review.isPublic})
    }
    static func loadPublicStrainFeed(strain: Strain) -> [Post]{
        return Bundle.main.decode([Post].self, from: "feed.json").filter({$0.review.strain==strain.name && $0.review.isPublic})
    }
    static func likePost(post: Post, user: User){
        //ok so this is a hack until we can call lambda
        var feed = [Post]()
        self.loadPublicFeed().forEach(){ p in
            var tmpPost = Post(id: p.id, review: p.review, likes: p.likes, comments: p.comments)
            if p.id==post.id{
                if !p.likes.contains(where: {$0.user == user.id}){
                    print("Liking Post")
                    tmpPost.likes.append(Like(user: user.id))
                }
            }
            feed.append(tmpPost)
            
        }
            let jsonData = try! JSONEncoder().encode(feed)
            let jsonString = String(data: jsonData, encoding: .utf8)!

        Bundle.main.writeJson(filename: "feed.json", jsonData: jsonString)
    }
    
    static func unlikePost(post: Post, user: User){
        //ok so this is a hack until we can call lambda
        var feed = [Post]()
        self.loadPublicFeed().forEach(){ p in
            var tmpPost = Post(id: p.id,review: p.review, likes: p.likes, comments: p.comments)
            if p.review.id==post.review.id && p.review.user == post.review.user{
                print("UnLiking Post")
                if p.likes.contains(where: {$0.user == user.id}){
                    tmpPost.likes.removeAll(where: {$0.user == user.id})
                }
            }
            feed.append(tmpPost)
            
        }
            let jsonData = try! JSONEncoder().encode(feed)
            let jsonString = String(data: jsonData, encoding: .utf8)!

        Bundle.main.writeJson(filename: "feed.json", jsonData: jsonString)
    }
    
//    static func loadPublicPostsByUser(user: User) -> [Post]{
//
//    }
//    static func loadCircle

}

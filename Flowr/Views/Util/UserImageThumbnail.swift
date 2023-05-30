//
//  UserImageThumbnail.swift
//  Flowr
//
//  Created by Andrew on 5/30/23.
//

import SwiftUI

struct UserImageThumbnail: View {
    let user: User
    var body: some View {
        if self.user.image.count > 0{
            URLImage(url: self.user.image, shape: AnyShape(Circle()))
            .aspectRatio(contentMode: .fit)
//            .frame(maxWidth: 90, maxHeight: 40)
    }else{
        Image(systemName: "person.fill").resizable()
            .aspectRatio(contentMode: .fit)
//            .frame(maxWidth: 90, maxHeight: 40)
    }
    }
}

struct UserImageThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        UserImageThumbnail(user: User.example)
    }
}

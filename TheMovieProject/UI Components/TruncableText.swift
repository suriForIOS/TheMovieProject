//
//  TruncableText.swift
//  TheMovieProject
//
//  Created by Surbhi Bagadia on 29/05/23.
//

import SwiftUI

/**
    This view shows text if it is not getting trucated else hides it.
    It also returns closure with a Bool stating whether the text is trucated or not.
 */
struct TruncableText: View {
    let text: Text
    let lineLimit: Int?
    @State private var intrinsicSize: CGSize = .zero
    @State private var truncatedSize: CGSize = .zero
    let isTruncatedUpdate: (_ isTruncated: Bool) -> Void
    @State private var hide: Bool = false
    
    var body: some View {
        text
            .lineLimit(lineLimit)
            .readSize { size in
                truncatedSize = size
                hide = truncatedSize != intrinsicSize
                isTruncatedUpdate(truncatedSize != intrinsicSize)
            }
            .background(
                text
                    .fixedSize(horizontal: false, vertical: true)
                    .hidden()
                    .readSize { size in
                        intrinsicSize = size
                        hide  = truncatedSize != intrinsicSize
                        isTruncatedUpdate(truncatedSize != intrinsicSize)
                    }
            )
            .shouldShow(!hide)
    }
}

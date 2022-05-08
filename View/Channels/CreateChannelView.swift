//
//  CreateChannelView.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/8.
//

import SwiftUI

struct CreateChannelView: View {
    @State private var channelName = ""
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var channelImage: Image?
    @ObservedObject var viewModel: CreateChannelViewModel
    @Binding var show: Bool
    
    init(_ selectableUsers: [SelectableUser], show: Binding<Bool>) {
        self.viewModel = CreateChannelViewModel(selectableUsers)
        self._show = show
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 32) {
                Button {
                    imagePickerPresented.toggle()
                } label: {
                    let image = channelImage == nil ? Image("plus_photo") : channelImage!
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                    
                }
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                    ImagePicker(image: $selectedImage)
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(Color(.separator))
                    
                    TextField("Enter a name for your channel", text: $channelName)
                        .font(.system(size: 15))
                    
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(Color(.separator))
                    
                    Text("Plesae privide a channel name and icon")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }.padding()
            }.padding()
            
            Spacer()
        }
        .onReceive(viewModel.$didCreateChannel, perform: { completed in
            if completed {
                show.toggle()
            }
        })
        .navigationBarItems(trailing: createChannelButton)
    }
    
    var createChannelButton: some View {
        Button {
            viewModel.createChannel(name: channelName, image: selectedImage)
        } label: {
            Text("Create").bold()
                .disabled(channelName.isEmpty)
        }
    }
    
    func loadImage() {
        guard let selectImage = selectedImage else { return }
        channelImage = Image(uiImage: selectImage)
    }
}

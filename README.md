# MVVMArcitechture
A simple app to show a Listview and MapView of cars.

# Content
1. Architecture Overview
2. How to build and run
3. Unit testing
4. Features

# Architecture Overview
MVVM **(Model-View-View Model)** architecture is used to create this application so that view controllers dont become massive and code remains managable. Major components and there responsibilities for MVVM  architecture are as follows

**- Model** 
Model classes are used to store the actual data or information.

**- View Model** 
View Model is used to format and present data on views. It keeps the model layer separate from the view layer.

**- View** 
View in MVVM contains behaviors, events, and data-bindings that ultimately require knowledge of the underlying model and viewmodel.

# How to build and run
Open .xcodeproj and press **Command + R**

# Unit testing and code coverage
Open .xcodeproj and press **Command + U** to run the test cases.

# Features
This app demonstrates the use of MVVM architecture for iOS applications
- Swift 5
- Xcode 11.2.1

# LINK PREVIEW APPLICATION

Link Preview is an application developed in MAUI using MVVM architecture.<br>
Users may enter a URL into the Link Preview Application to get a preview of the link that includes the image, title, description, and URL. To retrieve the preview data, the application makes use of the Link Preview API.

## Usage Instructions
1.	Open the application. Enter the URL in the input field labelled "Enter URL here." wait for a short delay to fetch the link preview.<br>  
2.	The title, description, image, and URL will be displayed in the link preview, which will appear below the input area.<br>

3.	To remove the entered URL and the preview information, click the "X" button next to the input area. <br>

4.	To open the link in the system's default browser, tap the preview panel.<br>

![Screens](/Images/Screens.jpg) 

## Technical Documentation

### System Architecture
![mvvm_pattern](/Images/mvvm_pattern.png)<br>
![view](/Images/view.jpg)
![view_model](/Images/view_model.jpg)
![model](/Images/model.jpg)<br>

| Packages							            | Version           | 
|-----------------------------------------------|-------------------| 
| .NET								            | 8.0.202           | 
| Microsoft.Maui.Controls				    	| 8.0.40            | 
| Microsoft.Maui.Controls.Compatibility	    	| 8.0.40            | 
| RestSharp 							        | 106.13.0          | 
| maui-windows               					| 8.0.7/8.0.100     |          
| maccatalyst               					| 17.2.8004/8.0.100 |  
| ios                       					| 17.2.8004/8.0.100 |     
| android                    					| 34.0.52/8.0.100   |        

### Code Structure
- MainPage.xaml: Defines the application's UI layout. <br>
- LinkPreview_ViewModel.cs: Contains code for managing user input, retrieving link previews, and binding data to the user interface.<br>
- LinkPreview_Model.cs: Contains the link preview's data model definition. <br>



### Methods Used
- GetPreview: to get link preview after the url is entered. <br>
- OnPreviewButtonClicked: to accept the url and provides the preview. <br>
- ClearTextBox: for clearing input and output on the screen. <br>
- OnOpenLink: for opening the Url Preview. <br>

### Commands Used
- ClearTextCommand: calls the method ClearTextBox. <br>
- OpenLinkPreviewCommand: calls the method OnOpenLink.

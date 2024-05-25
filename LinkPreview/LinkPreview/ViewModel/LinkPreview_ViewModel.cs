using LinkPreview.Model;
using RestSharp;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace LinkPreview.ViewModel
{
    public class LinkPreview_ViewModel:INotifyPropertyChanged
    {   
        
        private CancellationTokenSource _searchdelaytimer;
        private const int SearchDelay = 150;

        
        private string _urlEntry;
        public string UrlEntry
        {
            get { return _urlEntry; }
            set { 
                _urlEntry = value; 
                OnPropertyChanged(nameof(UrlEntry));
                GetPreview();
            }
        }

        
        private string _title;
        public string Title
        {
            get { return _title; }
            set {
                _title = value;
                OnPropertyChanged(nameof(Title));
            }
        }

        
        private string _description;
        public string Description
        {
            get { return _description; }
            set {
                _description = value;
                OnPropertyChanged(nameof(Description));
            }
        }

        
        private string _imageurl;
        public string ImageUrl
        {
            get { return _imageurl; }
            set {
                _imageurl = value;
                OnPropertyChanged(nameof(ImageUrl));
            }
        }

       
        private string _url;
        public string Url
        {
            get { return _url; }
            set { 
                _url = value;
                OnPropertyChanged(nameof(Url));
            }
        }

      
        public ICommand ClearTextCommand { get;}

        
        public ICommand OpenLinkPreviewCommand { get; }

        
        public LinkPreview_ViewModel()
        {
            OpenLinkPreviewCommand = new Command(async(url)=>OnOpenLink(Url));       
            ClearTextCommand = new Command(ClearTextBox);
        }

        // method to get link preview after the url is entered
        private void GetPreview()
        {
            _searchdelaytimer?.Cancel();
            _searchdelaytimer = new CancellationTokenSource();

            Task.Delay(SearchDelay, _searchdelaytimer.Token)
                .ContinueWith(async task =>
                {
                    if (!task.IsCanceled)
                    {
                        await OnPreviewButtonClicked();
                    }
                });
        }

        //accept the url and provide the preview
        private async Task OnPreviewButtonClicked()
        {
            try
            {
                string apiKey = "9f7069ffc7b9aca319c4f2cc3f358727";
                string apiurl = $"https://api.linkpreview.net/?key={apiKey}&q={UrlEntry}";

                var client = new RestClient(apiurl);
                var request = new RestRequest(Method.GET);
                var response = await client.ExecuteAsync<LinkPreview_Model>(request);

                if (response.IsSuccessful & response.Data != null)
                {
                    var apiresponse = response.Data;
                    ImageUrl = apiresponse.Image;
                    Title = apiresponse.Title;
                    Description = apiresponse.Description;
                    Url = apiresponse.Url;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error:{ex.Message}");
            }
        }

        //Command for clearing input and outpur on the screen
        private void ClearTextBox()
        {
            UrlEntry = string.Empty;
            Title = string.Empty;
            Description = string.Empty;
            Url = string.Empty;
            ImageUrl = string.Empty;
        }

        // Command for Opening the Url Preview
        public async Task OnOpenLink(string Url)
        {
            if(!string.IsNullOrEmpty(Url)) 
            { 
                await Browser.OpenAsync(Url,BrowserLaunchMode.SystemPreferred);
            }
        }

        
        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}

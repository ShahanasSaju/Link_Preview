using RestSharp;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;
using LinkPreview.Model;

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

        public LinkPreview_Model modelProperty { get; set; }

        public string Title
        {
            get { return modelProperty.Title; }
            set
            {
                modelProperty.Title = value;
                OnPropertyChanged(nameof(Title));
            }
        }

        public string Description
        {
            get { return modelProperty.Description; }
            set
            {
                modelProperty.Description = value;
                OnPropertyChanged(nameof(Description));
            }
        }

        public string ImageUrl
        {
            get { return modelProperty.Image; }
            set
            {
                modelProperty.Image = value;
                OnPropertyChanged(nameof(ImageUrl));
            }
        }

        public string Url
        {
            get { return modelProperty.Url; }
            set
            {
                modelProperty.Url = value;
                OnPropertyChanged(nameof(Url));
            }
        }

        public ICommand ClearTextCommand { get;}

        public ICommand OpenLinkPreviewCommand { get; }
        
        public LinkPreview_ViewModel()
        {
            modelProperty = new LinkPreview_Model();
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

        //accept the url and provides the preview
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

        //Method for clearing input and output on the screen
        private void ClearTextBox()
        {
            UrlEntry = string.Empty;
            Title = string.Empty;
            Description = string.Empty;
            Url = string.Empty;
            ImageUrl = string.Empty;
        }

        // Method for Opening the Url Preview
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

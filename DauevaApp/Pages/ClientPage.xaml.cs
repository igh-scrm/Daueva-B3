using DauevaApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DauevaApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для ClientPage.xaml
    /// </summary>
    public partial class ClientPage : Page
    {
        private Users authData;

        public ClientPage(Users authData)
        {
            InitializeComponent();
            this.authData = authData;
            UserRequestList.ItemsSource = ConnectionDb.autoTransEntities.Requests.Where(x => x.Client_id == authData.id).ToList();


        }

        private void BtnUserEdit_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}

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
    /// Логика взаимодействия для AddPage.xaml
    /// </summary>
    public partial class AddPage : Page
    {
        public AddPage()
        {
            InitializeComponent();
            CmbAutoType.DisplayMemberPath = "Name";
            CmbAutoType.SelectedValuePath = "id";
            CmbAutoType.ItemsSource = ConnectionDb.autoTransEntities.CarType.ToList();

            CmbClient.DisplayMemberPath = "Name";
            CmbClient.SelectedValuePath = "id";
            CmbClient.ItemsSource = ConnectionDb.autoTransEntities.Users.Where(x => x.UserType_id == 4).ToList();


            
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Requests requests = new Requests();
                requests.StartDate= DateTime.Now;
                requests.CarType_id = Convert.ToInt32(CmbAutoType.SelectedValue);
                requests.CarModel = TxbAutoModel.Text;
                requests.Problem = TxbPoblem.Text;
                requests.Client_id = Convert.ToInt32(CmbClient.SelectedValue);
                requests.Status_id = 3;
                ConnectionDb.autoTransEntities.Requests.Add(requests);
                ConnectionDb.autoTransEntities.SaveChanges();
                MessageBox.Show("Заявка добавлена!");
            }
            catch (Exception ex) 
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}

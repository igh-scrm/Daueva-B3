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
    /// Логика взаимодействия для OperatorPage.xaml
    /// </summary>
    public partial class OperatorPage : Page
    {
        public OperatorPage()
        {
            InitializeComponent();

            RequestList.ItemsSource = ConnectionDb.autoTransEntities.Requests.ToList();
        }

        private void RowEdit_Click(object sender, RoutedEventArgs e)
        {
            NavigateClass.frmNav.Navigate(new OperatorEditPage((sender as Button).DataContext as Requests));
        }
    }
}

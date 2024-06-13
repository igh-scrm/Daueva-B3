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
    /// Логика взаимодействия для Auth.xaml
    /// </summary>
    public partial class Auth : Page
    {
        public Auth()
        {
            InitializeComponent();
        }

        private void BtnAuth_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var data = ConnectionDb.autoTransEntities.Users.FirstOrDefault(
                    x => x.Login == TxbLogin.Text && x.Password == PsbPass.Password);

                if (data == null)
                {
                    MessageBox.Show("Такого пользователя нет", "Уведомление", MessageBoxButton.OK);
                }else
                {
                    MessageBox.Show("Успех!", "Уведомление", MessageBoxButton.OK);


                    switch (data.UserType_id)
                    {
                        case 1: NavigateClass.frmNav.Navigate(new OperatorPage());
                            break;
                        case 4: NavigateClass.frmNav.Navigate(new ClientPage(data));
                            break;
                    }


                    }

            }

            catch { }
        }
    }
}

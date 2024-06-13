using DauevaApp.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
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
    /// Логика взаимодействия для OperatorEditPage.xaml
    /// </summary>
    public partial class OperatorEditPage : Page
    {
        public OperatorEditPage(Requests requests )
        {
            InitializeComponent();
            TxbId.Text = requests.id.ToString();
            TxbPoblem.Text = requests.Problem;

            CmbStat.DisplayMemberPath = "Name";
            CmbStat.SelectedValuePath = "id";
            CmbStat.ItemsSource = ConnectionDb.autoTransEntities.Statuses.ToList();
            CmbStat.SelectedItem = requests.Statuses; // Устанавливаем выбранный объект status

            CmbMaster.DisplayMemberPath = "Name";
            CmbMaster.SelectedValuePath = "id";
            CmbMaster.ItemsSource = ConnectionDb.autoTransEntities.Users.ToList();
            CmbMaster.SelectedItem = requests.Master; // Устанавливаем выбранный объект master
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Requests requests = ConnectionDb.autoTransEntities.Requests.Find(Convert.ToInt32(TxbId.Text));

                if (requests == null)
                {
                    MessageBox.Show("Заявка не найдена. Невозможно сохранить изменения.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                requests.Problem = TxbPoblem.Text;
                requests.Master_id = Convert.ToInt32(CmbMaster.SelectedValue);
                requests.Status_id = Convert.ToInt32(CmbStat.SelectedValue);

                // Вместо AddOrUpdate используйте метод SaveChanges для обновления существующей сущности
                ConnectionDb.autoTransEntities.SaveChanges();

                MessageBox.Show("Изменения внесены", "Уведомление", MessageBoxButton.OK);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Критическая обработка");

            }
        }
    }
}

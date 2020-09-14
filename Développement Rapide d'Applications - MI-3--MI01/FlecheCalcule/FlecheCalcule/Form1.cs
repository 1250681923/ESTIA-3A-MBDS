using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows.Forms;

namespace FlecheCalcule
{
    
    public partial class Form1 : Form
    {
        private DataImport dataImport;
        private FlechCalculation calculfleche;
        private DataExport dataExport;
        public Dictionary<string, string> materieuxYoung;
        public Form1()
        {
            InitializeComponent();
            dataImport = new DataImport();
            calculfleche = new FlechCalculation();
            dataExport = new DataExport();
            materieuxYoung = new Dictionary<string, string>();
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void importButton_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
        }

        private void openFileDialog1_FileOk(object sender, CancelEventArgs e)
        {
            materieuxYoung=
            dataImport.ImportMaterieuxFromFile(openFileDialog1.FileName);

            materiauxComboBox.DataSource = new BindingSource(materieuxYoung.Keys,null);
        }

        private void rectangulaireCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if(rectangulaireCheckBox.Checked == true)
            {
                circulaireCheckBox.Checked = false;

                diametreTextBox.Enabled = false;

                largeurTextBox.Enabled = true;
                hauteurTextBox.Enabled = true;

            }
        }

        private void circulaireCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (circulaireCheckBox.Checked == true)
            {
                rectangulaireCheckBox.Checked = false;

                diametreTextBox.Enabled = true;

                largeurTextBox.Enabled = false;
                hauteurTextBox.Enabled = false;

            }
            
        }

        private void calculerButton_Click(object sender, EventArgs e)
        {
            if (materiauxComboBox.Text=="")
            {
                MessageBox.Show("Veuillez vous choisir la fiche de Module d'Young");
                return;
            }
            if(Double.Parse(longueurTextBox.Text) == 0)
            {
                MessageBox.Show("Veuillez vous saisir longueur");
                return;
            }

            if(rectangulaireCheckBox.Checked == true)
            {
                double moment = calculfleche.momentQuadratiqueRectangulaire(double.Parse(largeurTextBox.Text), double.Parse(hauteurTextBox.Text));

                double fleche = calculfleche.flecheRecCalcul(double.Parse(chargeBox.Text), double.Parse(longueurTextBox.Text), Int32.Parse(materieuxYoung[materiauxComboBox.SelectedValue.ToString()]), moment);


                MessageBox.Show("La fleche : " + fleche + " mm." );

                dataExport.Log(DateTime.Now+":"+ "rectangulaire poutre(longueur,largueur,hauteur):"+double.Parse(longueurTextBox.Text)+", "+double.Parse(largeurTextBox.Text) + ", " + double.Parse(hauteurTextBox.Text)+". Charge:"+double.Parse(chargeBox.Text)+". La fleche:"+fleche);


            }else if (circulaireCheckBox.Checked == true)
            {
                double moment = calculfleche.momentQuadratiqueCirculaire(double.Parse(diametreTextBox.Text));

                double fleche = calculfleche.flecheCirCalcul(double.Parse(longueurTextBox.Text), double.Parse(chargeBox.Text), double.Parse(diametreTextBox.Text), moment);

                MessageBox.Show("La fleche : " + fleche + " mm.");

                dataExport.Log(DateTime.Now + ":" + "circulaire poutre(longueur,diametre):" + double.Parse(longueurTextBox.Text) + ", " + double.Parse(diametreTextBox.Text) + ". Charge:" + double.Parse(chargeBox.Text)+". La fleche:" + fleche);


            }


        }

        private void effacerButton_Click(object sender, EventArgs e)
        {
            rectangulaireCheckBox.Checked = false;
            circulaireCheckBox.Checked = false;
            longueurTextBox.Text = "0";
            largeurTextBox.Text = "0";
            hauteurTextBox.Text = "0";
            diametreTextBox.Text = "0";
            chargeBox.Text = "0";

            largeurTextBox.Enabled = true;
            hauteurTextBox.Enabled = true;
            diametreTextBox.Enabled = true;




        }

        private void saveFileDialog1_FileOk(object sender, CancelEventArgs e)
        {
            dataExport.Logfile = saveFileDialog1.FileName;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            saveFileDialog1.ShowDialog();
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static AP_6_Swiss_Visite.BD;

namespace AP_6_Swiss_Visite
{
    public partial class AjoutMedicament : Form
    {
        public AjoutMedicament()
        {
            InitializeComponent();
        }

        private void AjoutMedicament_Load(object sender, EventArgs e)
        {
            //ajout des codes de famille dans la comboBox
            foreach (Famille uneFamille in Famille.LesFamilles.Values)
            {
                comboBox1.Items.Add(uneFamille.getCodeFamille());
            }
            comboBox1.SelectedIndex = 0;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (tbNomCommercial.Text != string.Empty && tbDepotLegal.Text != string.Empty && tbPrix.Text != string.Empty && rtbComposition.Text != string.Empty && rtbContreIndication.Text != string.Empty && rtbEffets.Text != string.Empty)
            {

                //essayer de convertir le prix sinon afficher une erreur 
                float prixUnitaire;
                try
                {
                    prixUnitaire = float.Parse(tbPrix.Text);//convertir en float le prix
                }
                catch
                {
                    MessageBox.Show("Le prix est incorect");
                    return;
                }

                if (Medicament.lesMedicaments.ContainsKey(tbDepotLegal.Text.ToString()))
                {
                    MessageBox.Show("Ce médicament existe déja");
                }
                else
                {
                    bool ajouter = ajouterMedicament(tbDepotLegal.Text.ToString(), tbNomCommercial.Text.ToString(), comboBox1.Text, rtbComposition.Text.ToString(), rtbEffets.Text.ToString(), rtbContreIndication.Text.ToString(), prixUnitaire);

                    //si la requète d'insertion s'est bien effectuée 
                    if (ajouter)
                    {
                        MessageBox.Show("Le médicament a bien été ajouté");

                        getMedicaments();//récupération des medicament pour avoir le nouveau

                        //remise à zero de l'interface
                        comboBox1.SelectedIndex = 0;
                        tbDepotLegal.Text = string.Empty;
                        tbNomCommercial.Text = string.Empty;
                        tbPrix.Text = string.Empty;
                        rtbComposition.Text = string.Empty;
                        rtbContreIndication.Text = string.Empty;
                        rtbEffets.Text = string.Empty;
                    }
                    else
                    {
                        MessageBox.Show("Erreur lors de l'ajout");//Message si l'ajout a échoué
                    }
                }
            }
            else
            {
                MessageBox.Show("Merci de bien remplir toutes les informations");
            }
        }

        private void btRetour_Click(object sender, EventArgs e)
        {
            //retour au menu
            this.Hide();
            Form1 form1 = new Form1();
            form1.Show();
        }
    }
}

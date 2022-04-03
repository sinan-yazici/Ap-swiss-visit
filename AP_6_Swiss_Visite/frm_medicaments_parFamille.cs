using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace AP_6_Swiss_Visite
{
    public partial class frm_medicaments_parFamille : Form
    {
      
        public frm_medicaments_parFamille()
        {
            InitializeComponent();
        }

        private void frm_medicaments_parFamille_Load(object sender, EventArgs e)
        {

          
            //affichage dans la liste view des familles
            foreach (Famille laFamille in Famille.LesFamilles.Values)
            {
                ListViewItem ligne = new ListViewItem();

                ligne.Text = laFamille.getCodeFamille().ToString();
                ligne.SubItems.Add(laFamille.getLibelleFamille());

                int nbMedocs = 0;

                //récupérer procédure des médicaments par famille pour afficher le nombre de medicament par famille
                BD.Connexion.Open();
                SqlCommand maRequete = new SqlCommand("prc_medicament_famille", BD.Connexion);
                maRequete.CommandType = CommandType.StoredProcedure;

                // Ajouter les parameters à la procédure stockée
                SqlParameter paramFamCode = new SqlParameter("@fam_code", SqlDbType.VarChar, 5);
                //valeur de la famille dans le foreach
                paramFamCode.Value = laFamille.getCodeFamille().ToString();

                maRequete.Parameters.Add(paramFamCode);

                SqlDataReader allData = maRequete.ExecuteReader();

                //augmenter compteur
                while (allData.Read())
                {
                    nbMedocs++;
                }
                //afficher compteur
                ligne.SubItems.Add(nbMedocs.ToString());

                BD.Connexion.Close();

                lvMedFam.Items.Add(ligne);
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            //bouton retour
            this.Hide();
            Form1 etape_norme_maj = new Form1();
            etape_norme_maj.Show();
        }

        private void lvMedFam_SelectedIndexChanged(object sender, EventArgs e)
        {
            //récupération de l'id famille 
            lvMedFammm.Items.Clear();
            if (lvMedFam.SelectedIndices.Count <= 0)
            {
                return;
            }
            int idx = lvMedFam.SelectedIndices[0];

            if (idx >= 0)
            {

                string codeFam = lvMedFam.SelectedItems[0].Text.ToString();

                //récupération de la procédure medicament par famille avec l'id famille récupéré
                BD.Connexion.Open();
                SqlCommand maRequete = new SqlCommand("prc_medicament_famille", BD.Connexion);
                maRequete.CommandType = CommandType.StoredProcedure;

                // Ajouter les parameters à la procédure stockée
                SqlParameter paramFamCode = new SqlParameter("@fam_code", SqlDbType.VarChar, 5);
                //
                paramFamCode.Value = codeFam;

                maRequete.Parameters.Add(paramFamCode);

                SqlDataReader allData = maRequete.ExecuteReader();

              //remplissage de la list view
                while (allData.Read())
                {
                    ListViewItem ligne = new ListViewItem();
                

                    ligne.Text = allData.GetValue(0).ToString();
                    ligne.SubItems.Add(allData.GetValue(1).ToString());
                    ligne.SubItems.Add(allData.GetValue(2).ToString());
                    ligne.SubItems.Add(allData.GetValue(3).ToString());
                    ligne.SubItems.Add(allData.GetValue(4).ToString());
                    ligne.SubItems.Add(allData.GetValue(5).ToString());
                    ligne.SubItems.Add(allData.GetValue(6).ToString());
                    ligne.SubItems.Add(allData.GetValue(7).ToString());
                    
                    lvMedFammm.Items.Add(ligne);
                }
                    BD.Connexion.Close();
            }
        }
    }
}

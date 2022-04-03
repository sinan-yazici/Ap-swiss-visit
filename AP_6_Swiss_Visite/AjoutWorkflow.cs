using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AP_6_Swiss_Visite
{
    public partial class AjoutWorkflow : Form
    {
        public AjoutWorkflow()
        {
            InitializeComponent();
        }
        public void RemplirMedicament()
        {
            //le dictionnaire fonctionne avec des clés donc on peut appeler une clés dans un dictionnaire, 
            //une clés qui correspond a une info.les clés donc les informations.
            Dictionary<string, Medicament>.KeyCollection lesCles = Medicament.lesMedicaments.Keys;
            foreach (string code in lesCles)//pour parcourrir le dictionnaire
            {
                Medicament unMedicament = Medicament.lesMedicaments[code]; //pour récupérer l'élément par rapport a la clés

                ListViewItem laLigne = new ListViewItem();
                laLigne.Text = unMedicament.getDepotLegal().ToString();
                laLigne.SubItems.Add(unMedicament.getNomCommercial().ToString());
                laLigne.SubItems.Add(unMedicament.getlaFamille().getCodeFamille().ToString());
                laLigne.SubItems.Add(unMedicament.getComposition().ToString());
                laLigne.SubItems.Add(unMedicament.getEffet().ToString());
                laLigne.SubItems.Add(unMedicament.getContreIndication().ToString());
                laLigne.SubItems.Add(unMedicament.getPrixEchantillon().ToString());
                laLigne.SubItems.Add(unMedicament.getDerniereEtape().ToString());

                lvMedicament.Items.Add(laLigne);//ajout des éléments dans la listView
            }
        }
        public void RemplirWorkflow()
        {
            string num = lvMedicament.SelectedItems[0].Text;
            foreach (Workflow unWorkflow in Medicament.lesMedicaments[num].getLesEtapes())
            {
                ListViewItem ligne = new ListViewItem();
                ListViewItem ligneSuivante = new ListViewItem();

                ligne.Text = unWorkflow.getNumEtapeWorkflow().ToString();

                string norme = "";
                //pour remplir la listView des Etape et Etape_normée
                foreach (Etape uneEtape in Etape.lesEtapes)
                {
                    //pour passer dans l'heritage
                    //si le numero d'etape est pareil que le num dans workflow et que le type de l'objet s'appel bien Etape_norme
                    if (uneEtape.getNum() == unWorkflow.getNumEtapeWorkflow() && uneEtape.GetType().Name == "Etape_norme")//pour aller dans l'heritage recup info
                    {
                        norme = (uneEtape as EtapeNormee).getNorme().ToString(); //recuperer la norme dans etape_normée
                        DateTime dateNorme = (uneEtape as EtapeNormee).getDateNorme();
                        ligne.SubItems.Add(uneEtape.getLibelle());
                        ligne.SubItems.Add(norme);
                        ligne.SubItems.Add(dateNorme.ToString("dd.MM-yyyy"));//pour ne pas afficher les heures à la fin
                    }
                }
                lvWorkflow.Items.Add(ligne);

                string libelleDecision = "";//il peut être vide mais on le remplit après dans le foreach
                DateTime dateDecision = DateTime.Now;
                lvDecision.Items.Clear();
                //pour remplir la listView des Decisions
                foreach (Decision uneDecision in Decision.lesDecisions)
                {
                    //si l'ID dans Workflow et L'id dans décision sont identiques
                    if (unWorkflow.getIdDecisionWorkflow() == uneDecision.getIdDecision())
                    {
                        libelleDecision = uneDecision.getLibelleDecision();
                        dateDecision = unWorkflow.getDateDecisionWorkflow();
                    }
                }
                ligneSuivante.Text = libelleDecision.ToString();
                ligneSuivante.SubItems.Add(dateDecision.ToString("dd.MM-yyyy"));
                lvDecision.Items.Add(ligneSuivante);//ajout dans la listview decision
            }
        }
        private void AjoutWorkflow_Load(object sender, EventArgs e)
        {
            lvMedicament.Items.Clear();
            RemplirMedicament();//ajout des médicaments dans la liste view

        }
        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lvWorkflow.Items.Clear();//vider la listview a chaque fois qu'on re selectionne un nouveau médicament
            if (lvMedicament.SelectedIndices.Count == 0)//si y a pas d'element selectionné donc inférieur à 0 il se passe rien
            {
                return;
            }
            RemplirWorkflow();//pour remplir les deux listView permettant d'affichage les étapes et la décision
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //bouton retour de la page
            this.Hide();
            Form1 Menu = new Form1();
            Menu.Show();
        }

        private void listView1_SelectedIndexChanged_1(object sender, EventArgs e)
        {

        }
    }
}

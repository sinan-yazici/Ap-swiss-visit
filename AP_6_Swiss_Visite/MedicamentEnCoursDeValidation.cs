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
    public partial class MedicamentEnCoursDeValidation : Form
    {
        public MedicamentEnCoursDeValidation()
        {
            InitializeComponent();
        }

        private void MedicamentEnCoursDeValidation_Load(object sender, EventArgs e)
        {
            lvMedicament.Items.Clear();
            foreach (Medicament unMedicament in Medicament.lesMedicaments.Values)
            {
                if (unMedicament.getLesEtapes().Count == 0) continue;
                if (unMedicament.getDerniereEtape() != 8 && unMedicament.getLesEtapes()[unMedicament.getLesEtapes().Count - 1].getIdDecisionWorkflow() == 1)
                {
                    ListViewItem ligne = new ListViewItem();
                    ligne.Text = unMedicament.getDepotLegal().ToString();
                    ligne.SubItems.Add(unMedicament.getNomCommercial().ToString());
                    ligne.SubItems.Add(unMedicament.getlaFamille().getLibelleFamille());
                    lvMedicament.Items.Add(ligne);
                }
            }
        }

        private void lvMedicament_SelectedIndexChanged(object sender, EventArgs e)
        {
            //affichage du workflow pour le medicament selectionné
            lvEtape.Items.Clear();
            lvDecision.Items.Clear();

            if (lvMedicament.SelectedItems.Count == 0)
            {
                return;
            }

            string cle = lvMedicament.SelectedItems[0].Text;

            foreach (Workflow unWorkflow in Medicament.lesMedicaments[cle].getLesEtapes())
            {
                ListViewItem ligne = new ListViewItem();
                ListViewItem ligneSuiv = new ListViewItem();
                ligne.Text = unWorkflow.getNumEtapeWorkflow().ToString();

                string norme = "";
                DateTime dateNorme = DateTime.Now;
                foreach (Etape uneEtape in Etape.lesEtapes)
                {
                    if (uneEtape.getNum() == unWorkflow.getNumEtapeWorkflow() && uneEtape.GetType().Name == "EtapeNormee")
                    {
                        norme = (uneEtape as EtapeNormee).getNorme().ToString();
                        dateNorme = (uneEtape as EtapeNormee).getDateNorme();
                        ligne.SubItems.Add(norme);
                        ligne.SubItems.Add(dateNorme.ToString("dd-MM-yyyy"));
                    }
                }

                lvEtape.Items.Add(ligne);

                string libelleDecision = "";
                DateTime dateDecision = DateTime.Now;

                foreach (Decision uneDecision in Decision.lesDecisions)
                {
                    if (unWorkflow.getIdDecisionWorkflow() == uneDecision.getIdDecision())
                    {
                        libelleDecision = uneDecision.getLibelleDecision();
                        dateDecision = unWorkflow.getDateDecisionWorkflow();
                    }
                }
                ligneSuiv.Text = libelleDecision.ToString();
                ligneSuiv.SubItems.Add(dateDecision.ToString("dd-MM-yyyy"));
                lvDecision.Items.Add(ligneSuiv);
            }
        }

        private void btRetour_Click(object sender, EventArgs e)
        {
            //retour au menu
            this.Hide();
            Form1 form1 = new Form1();
            form1.Show();
        }

        private void lvDecision_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}

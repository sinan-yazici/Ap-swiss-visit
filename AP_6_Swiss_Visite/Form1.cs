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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            getFamilles();
            getMedicaments();
            lireAllFamiles();
            lireLesEtapesNormees();
            getMedicaments();
            getEtapes();
            getDecision();


        }

        private void miseÀJourToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            frm_EtapeNorme_maj etape_norme_maj = new frm_EtapeNorme_maj();
            etape_norme_maj.Show();
        }

        private void parFamilleToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            frm_medicaments_parFamille etape_norme_maj = new frm_medicaments_parFamille();
            etape_norme_maj.Show();
        }

        private void décisionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            frm_Decision_Etape etape = new frm_Decision_Etape();
            etape.Show();
        }

        private void ajoutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            AjoutMedicament ajoutMedicament = new AjoutMedicament();
            ajoutMedicament.Show();
        }

        private void enCoursDeValidationToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            MedicamentEnCoursDeValidation medicamentEnCours = new MedicamentEnCoursDeValidation();
            medicamentEnCours.Show();
        }

        private void afficherToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            AjoutWorkflow ajoutWorkflow = new AjoutWorkflow();
            ajoutWorkflow.Show();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}

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
    public partial class frm_Decision_Etape : Form
    {
        public frm_Decision_Etape()
        {
            InitializeComponent();
        }

        private void frm_Decision_Etape_Load(object sender, EventArgs e)
        {
            foreach (Medicament leMed in Medicament.lesMedicaments.Values)
            {
                ListViewItem ligne = new ListViewItem();

                

                ligne.Text = leMed.getDepotLegal().ToString();
                ligne.SubItems.Add(leMed.getNomCommercial());
                ligne.SubItems.Add(leMed.getlaFamille().getLibelleFamille());
                ligne.SubItems.Add(leMed.getComposition());
                ligne.SubItems.Add(leMed.getEffet());
                ligne.SubItems.Add(leMed.getContreIndication());
                ligne.SubItems.Add(leMed.getPrixEchantillon().ToString());
                ligne.SubItems.Add(leMed.getDerniereEtape().ToString());

                lvDecision.Items.Add(ligne);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form1 etape_norme_maj = new Form1();
            etape_norme_maj.Show();
        }
    }
}

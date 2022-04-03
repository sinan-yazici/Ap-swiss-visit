using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace AP_6_Swiss_Visite
{
    public class Medicament
    {
        public static Dictionary<string, Medicament> lesMedicaments = new Dictionary<string, Medicament>();

        private string depotLegalMed;
        private string nomCommercialMed;
        private Famille laFamille;
        private string compositionMed;
        private string effetMed;
        private string contreIndicationMed;
        private float prixEchantillonMed;
        private int derniereEtape;
        private List<Workflow> lesEtapes = new List<Workflow>();

        public Medicament(string leDepotLegalMed, string nomCommercialMed, string laFamille, string compositionMed, string effetMed, string contreIndicationMed, float prixEchantillonMed, int derniereEtape)
        {
            this.depotLegalMed = leDepotLegalMed;
            this.nomCommercialMed = nomCommercialMed;
            laFamille = laFamille.Trim();
            this.laFamille = Famille.LesFamilles[laFamille];
            this.compositionMed = compositionMed;
            this.effetMed = effetMed;
            this.contreIndicationMed = contreIndicationMed;
            this.prixEchantillonMed = prixEchantillonMed;
            this.derniereEtape = derniereEtape;
            lesMedicaments.Add(depotLegalMed, this);
        }

        public string getDepotLegal() { return this.depotLegalMed; }

        public string getNomCommercial() { return this.nomCommercialMed; }

        public Famille getlaFamille() { return this.laFamille; }

        public string getComposition() { return this.compositionMed; }

        public string getEffet() { return this.effetMed; }

        public string getContreIndication() { return this.contreIndicationMed; }

        public float getPrixEchantillon() { return this.prixEchantillonMed; }

        public int getDerniereEtape() { return this.derniereEtape; }

        public List<Workflow> getLesEtapes()
        {
            return this.lesEtapes;
        }
        public void setLesEtapes(List<Workflow> lesEtapes)
        {
            this.lesEtapes = lesEtapes;
        }
    }
}

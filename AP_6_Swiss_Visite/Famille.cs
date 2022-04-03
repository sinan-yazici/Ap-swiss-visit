using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AP_6_Swiss_Visite
{
    public class Famille
    {
        public static Dictionary<string, Famille> LesFamilles = new Dictionary<string, Famille>();

        private string codeFamille;
        private string libelleFamille;

        public Famille(string codeFamille, string libelleFamille)
        {
            this.codeFamille = codeFamille;
            this.libelleFamille = libelleFamille;
            LesFamilles.Add(codeFamille, this);
        }

        public string getCodeFamille()
        {
            return this.codeFamille;
        }

        public string getLibelleFamille()
        {
            return this.libelleFamille;
        }
    }
}

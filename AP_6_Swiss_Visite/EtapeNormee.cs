using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AP_6_Swiss_Visite
{
    public class EtapeNormee : Etape
    {
       
        private string Norme;
        private DateTime dateNorme;
        public EtapeNormee(int num, string libelle, string norme, DateTime dateNorme) : base(num, libelle)
        {
            this.dateNorme = dateNorme;
            this.Norme = norme;
            Globale.lesEtapesNormee.Add(this);
        }
        public DateTime getDateNorme() { return this.dateNorme; }
        public string getNorme() { return this.Norme; }


    }
}

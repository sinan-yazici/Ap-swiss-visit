using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AP_6_Swiss_Visite
{
    public class Workflow
    {
        public static List<Workflow> lesWorkflow = new List<Workflow>();

        private string depotLegalWorkflow;
        private int numEtapeWorflow;
        private int idDecisionWorkflow;
        private DateTime dateDecisionWorkflow;

        //Constructeur
        public Workflow(string leDepotLegalWorkflow, int leNumEtapeWorkflow, int leIdDecisionWorkflow, DateTime laDateDecisionWorkflow)
        {
            this.depotLegalWorkflow = leDepotLegalWorkflow;
            this.numEtapeWorflow = leNumEtapeWorkflow;
            this.idDecisionWorkflow = leIdDecisionWorkflow;
            this.dateDecisionWorkflow = laDateDecisionWorkflow;
        }


        public string getDepotLegalWorkflow()
        {
            return this.depotLegalWorkflow;
        }
        public int getNumEtapeWorkflow()
        {
            return this.numEtapeWorflow;
        }
        public int getIdDecisionWorkflow()
        {
            return this.idDecisionWorkflow;
        }
        public DateTime getDateDecisionWorkflow()
        {
            return this.dateDecisionWorkflow;
        }


    }
}

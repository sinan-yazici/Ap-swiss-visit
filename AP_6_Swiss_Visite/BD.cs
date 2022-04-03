using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace AP_6_Swiss_Visite
{
    public static class BD
    {
        //connection à la base de données
        private static string Connexionstring = @"Data Source=BTS2020-20\SQLEXPRESS;Initial Catalog=DB_gesAMM;Integrated Security=True";
        public static SqlConnection Connexion = new SqlConnection(Connexionstring);

        
        //Appel de la procedure pour afficher les étapes normées
        public static void lireLesEtapesNormees()
        {
            Globale.lesEtapes.Clear();
            Globale.lesEtapesNormee.Clear();

            Connexion.Open();
            SqlCommand commande = new SqlCommand("prc_listeEtapeNormee", Connexion);
            commande.CommandType = CommandType.StoredProcedure;
            SqlDataReader resultat = commande.ExecuteReader();

            while (resultat.Read())
            {
                int numEtapeNormee = (int)resultat["ETP_NUM"];
                string EtapeLibelle = resultat["ETP_LIBELLE"].ToString();
                string EtapeNormeLibelle = resultat["ETP_NORME"].ToString().Trim(' ');
                DateTime EtapeDateNorme = (DateTime)resultat["ETP_DATE_NORME"];

                new EtapeNormee(numEtapeNormee, EtapeLibelle, EtapeNormeLibelle, EtapeDateNorme);
            }
            Connexion.Close();
        }

        //Appel procédure pour afficher toutes les familles
        public static void lireAllFamiles()
        {
            if(Famille.LesFamilles.Count == 0)
            {
                Connexion.Open();

                SqlCommand commande = new SqlCommand("prc_select_med_fam", Connexion);
                commande.CommandType = CommandType.StoredProcedure;
                SqlDataReader resultat = commande.ExecuteReader();


                while (resultat.Read())
                {
                    string numFamille = (string)resultat["FAM_CODE"];
                    string libelleFamille = resultat["FAM_LIBELLE"].ToString();
                    MessageBox.Show(numFamille);
                    new Famille(numFamille, libelleFamille);
                }
                MessageBox.Show(Famille.LesFamilles.Count.ToString());
                Connexion.Close();
            }
        }

        //Appel procedure pour afficher les médicaments par famille
        public static void medparfam(string fam_code)
        {
            

            Connexion.Open();
            SqlCommand maRequete = new SqlCommand("prc_medicament_famille", Connexion);
            maRequete.CommandType = CommandType.StoredProcedure;

            // Ajouter les parameters à la procédure stockée
            SqlParameter paramFamCode = new SqlParameter("@fam_code", SqlDbType.Int, 5);
            paramFamCode.Value = fam_code;

            maRequete.Parameters.Add(paramFamCode);

            maRequete.ExecuteNonQuery();
            Connexion.Close();

        }

        //Appel procédure pour modifer une étape normée
        public static bool ModifierEtapeNorme(int etp_num, string etp_norme, DateTime etp_date)
        {
            Connexion.Open();
         

            SqlCommand maRequete = new SqlCommand("prc_update_etape_normee", Connexion);
            // Il s’agit d’une procédure stockée:
            maRequete.CommandType = CommandType.StoredProcedure;

            // Ajouter les parameters à la procédure stockée
            SqlParameter paramEtpNum = new SqlParameter("@etp_num", SqlDbType.Int, 5);
            paramEtpNum.Value = etp_num;
            SqlParameter paramEtpNorme = new SqlParameter("@etp_norme", SqlDbType.Char, 30);
            paramEtpNorme.Value = etp_norme;
            SqlParameter paramEtpDate = new SqlParameter("@etp_date", SqlDbType.Date, 30);
            paramEtpDate.Value = etp_date;
            maRequete.Parameters.Add(paramEtpNum);
            maRequete.Parameters.Add(paramEtpNorme);
            maRequete.Parameters.Add(paramEtpDate);
            // exécuter la procedure stockée

            maRequete.ExecuteNonQuery();

            SqlCommand commande = new SqlCommand("prc_listeEtapeNormee", Connexion);
            commande.CommandType = CommandType.StoredProcedure;
            SqlDataReader resultat = commande.ExecuteReader();
            Globale.lesEtapes.Clear();
            Globale.lesEtapesNormee.Clear();
            while (resultat.Read())
            {
                int numEtapeNormee = (int)resultat["ETP_NUM"];
                string EtapeLibelle = resultat["ETP_LIBELLE"].ToString();
                string EtapeNormeLibelle = resultat["ETP_NORME"].ToString();
                DateTime EtapeDateNorme = (DateTime)resultat["ETP_DATE_NORME"];

                new EtapeNormee(numEtapeNormee, EtapeLibelle, EtapeNormeLibelle, EtapeDateNorme);
            }

            Connexion.Close();

            return true;
        }
        public static void getMedicaments()
        {

            Medicament.lesMedicaments.Clear();

            Connexion.Open();

            SqlCommand commande = new SqlCommand("prc_get_medicament", Connexion);
            commande.CommandType = CommandType.StoredProcedure;
            SqlDataReader resultat = commande.ExecuteReader();





            while (resultat.Read())
            {
                string depotLegalMed = resultat["MED_DEPOTLEGAL"].ToString();
                string nomCommercialMed = resultat["MED_NOMCOMMERCIAL"].ToString();
                string familleCode = resultat["FAM_CODE"].ToString();
                string compositionMed = resultat["MED_COMPOSITION"].ToString();
                string effetsMed = resultat["MED_EFFETS"].ToString();
                string contreIndicationMed = resultat["MED_CONTREINDIC"].ToString();




                object prix = resultat["MED_PRIXECHANTILLON"];
                float prixEchantillonMed = 0.0f;
                if (prix.GetType() != typeof(DBNull))
                    prixEchantillonMed = (float)resultat["MED_PRIXECHANTILLON"];



                object derEtape = resultat["Derniere_etape"];
                int derniereEtape = 0;
                if (derEtape.GetType() != typeof(DBNull))
                    derniereEtape = (int)resultat["Derniere_etape"];




                new Medicament(depotLegalMed, nomCommercialMed, familleCode, compositionMed, effetsMed, contreIndicationMed, prixEchantillonMed, derniereEtape);
            }
            Connexion.Close();
            foreach (Medicament unMedicament in Medicament.lesMedicaments.Values)
            {
                getWorkflow(unMedicament);
            }
        }
        public static void getFamilles()
        {
            Famille.LesFamilles.Clear();

            Connexion.Open();
            SqlCommand commande = new SqlCommand("prc_get_familles", Connexion);
            commande.CommandType = CommandType.StoredProcedure;
            SqlDataReader resultat = commande.ExecuteReader();

            while (resultat.Read())
            {
                string codeFamille = resultat["FAM_CODE"].ToString();
                string libelleFamille = resultat["FAM_LIBELLE"].ToString();
                new Famille(codeFamille, libelleFamille);
            }
            Connexion.Close();
        }


        


        public static bool ajouterMedicament(string depotLegal, string nomCommercialMed, string familleCode, string compositionMed, string effetMed, string contreIndicationMed, float prixUnitaire)
        {
            Connexion.Open();

            //appel de la procedure
            SqlCommand maRequete = new SqlCommand("prc_ajouter_medicament", Connexion) { CommandType = CommandType.StoredProcedure };

            //affectation des paramètres pour la procedure stockée
            SqlParameter paramDepotLegal = new SqlParameter("@DepotLegal", System.Data.SqlDbType.NVarChar, 10);
            paramDepotLegal.Value = depotLegal;

            SqlParameter paramNomCommercial = new SqlParameter("@NomCommercial", System.Data.SqlDbType.NVarChar, 25);
            paramNomCommercial.Value = nomCommercialMed;

            SqlParameter paramFamilleCode = new SqlParameter("@FamilleCode", System.Data.SqlDbType.NVarChar, 3);
            paramFamilleCode.Value = familleCode;

            SqlParameter paramComposition = new SqlParameter("@Composition", System.Data.SqlDbType.NVarChar, 255);
            paramComposition.Value = compositionMed;

            SqlParameter paramEffet = new SqlParameter("@Effet", System.Data.SqlDbType.NVarChar, 255);
            paramEffet.Value = effetMed;

            SqlParameter paramContreIndication = new SqlParameter("@ContreIndication", System.Data.SqlDbType.NVarChar, 255);
            paramContreIndication.Value = contreIndicationMed;

            SqlParameter paramPrixUnitaire = new SqlParameter("@PrixUnitaire", System.Data.SqlDbType.Float, 255);
            paramPrixUnitaire.Value = prixUnitaire;

            maRequete.Parameters.Add(paramDepotLegal);
            maRequete.Parameters.Add(paramNomCommercial);
            maRequete.Parameters.Add(paramFamilleCode);
            maRequete.Parameters.Add(paramComposition);
            maRequete.Parameters.Add(paramEffet);
            maRequete.Parameters.Add(paramContreIndication);
            maRequete.Parameters.Add(paramPrixUnitaire);

            //éxécuter la procedure stockée
            try
            {
                maRequete.ExecuteNonQuery();
                Connexion.Close();
                return true;
            }
            catch (Exception E)
            {
                MessageBox.Show(E.ToString());
                Connexion.Close();
                return false;
            }
        }

        public static void getDecision()
        {
            Decision.lesDecisions.Clear();
            Connexion.Open();
            SqlCommand commande = new SqlCommand("prc_get_decision", Connexion);
            commande.CommandType = CommandType.StoredProcedure;
            SqlDataReader resultat = commande.ExecuteReader();

            while (resultat.Read())
            {
                int idDecision = (int)resultat["DCS_ID"];
                string libelleDecision = resultat["DCS_LIBELLE"].ToString();

                Decision.lesDecisions.Add(new Decision(idDecision, libelleDecision));
            }
            Connexion.Close();
        }

        public static void getEtapes()
        {
            Etape.lesEtapes.Clear();

            Connexion.Open();
            SqlCommand commande = new SqlCommand("prc_get_etape", Connexion);
            commande.CommandType = CommandType.StoredProcedure;
            SqlDataReader resultat = commande.ExecuteReader();

            while (resultat.Read())
            {
                int numEtape = (int)resultat["ETP_NUM"];
                string libelleEtape = resultat["ETP_LIBELLE"].ToString();
                string normeEtape = resultat["ETP_NORME"].ToString();
                DateTime dateNormeEtape = (DateTime)resultat["ETP_DATE_NORME"];

                Etape.lesEtapes.Add(new Etape(numEtape, libelleEtape));
                Etape.lesEtapes.Add(new EtapeNormee(numEtape, libelleEtape, normeEtape, dateNormeEtape));
            }
            Connexion.Close();
        }

        public static void getWorkflow(Medicament unMedicament)
        {
            Connexion.Open();
            SqlCommand commande = new SqlCommand("prc_get_workflow", Connexion);
            commande.CommandType = CommandType.StoredProcedure;
            SqlParameter param = new SqlParameter("@depotLegal", SqlDbType.VarChar, 10)
            {
                Value = unMedicament.getDepotLegal()
            };
            commande.Parameters.Add(param);

            SqlDataReader resultat = commande.ExecuteReader();

            List<Workflow> lesEtapes = new List<Workflow>();

            while (resultat.Read())
            {
                string depotLegalMed = resultat["MED_DEPOTLEGAL"].ToString();
                int numEtape = int.Parse(resultat["ETP_NUM"].ToString());
                int idDecision = int.Parse(resultat["DCS_ID"].ToString());
                DateTime dateDecision = DateTime.Parse(resultat["dateDecision"].ToString());

                Workflow unWorkflow = new Workflow(depotLegalMed, numEtape, idDecision, dateDecision);
                lesEtapes.Add(unWorkflow);
            }
            unMedicament.setLesEtapes(lesEtapes);
            Connexion.Close();
        }
        
        //pour lire les médicaments 
        public static void lireMedicament()
        {
            Connexion.Open();

            Medicament.lesMedicaments.Clear();

            SqlCommand commande = new SqlCommand("prc_lireMedicament", Connexion);//nom de la procédure pour récupérer les données de la table
            commande.CommandType = CommandType.StoredProcedure;//le type d'objet donc ici une procédure stocké
            SqlDataReader resultat = commande.ExecuteReader();//excécution de la procédure

            while (resultat.Read())
            {
                string med_depot = resultat["MED_DEPOTLEGAL"].ToString();
                string med_nom = resultat["MED_NOMCOMMERCIAL"].ToString();
                string familleCode = resultat["FAM_CODE"].ToString();
                string med_compo = resultat["MED_COMPOSITION"].ToString();
                string med_effet = resultat["MED_EFFETS"].ToString();
                string med_cont = resultat["MED_CONTREINDIC"].ToString();
                object prix = resultat["MED_PRIXECHANTILLON"];

                float prixEchantillonMed = 0.0f;
                if (prix.GetType() != typeof(DBNull))
                    prixEchantillonMed = (float)resultat["MED_PRIXECHANTILLON"];
                //pour afficher 0 si c'est null et éviter les erreurs possible avec un null dans notre base de donnée
                object derEtape = resultat["Derniere_etape"];
                int derniereEtape = 0;
                if (derEtape.GetType() != typeof(DBNull))
                    derniereEtape = (int)resultat["Derniere_etape"];

                new Medicament(med_depot, med_nom, familleCode, med_compo, med_effet, med_cont, prixEchantillonMed, derniereEtape);
            }
            Connexion.Close();
            foreach (Medicament M in Medicament.lesMedicaments.Values)
            {
                GetWorkflowMedicament(M);
            }

        }
        public static void lireDecision()/*pour récuperer la table decision*/
        {
            Connexion.Open();

            SqlCommand command = new SqlCommand("prc_afficher_decision", Connexion) { CommandType = CommandType.StoredProcedure };
            SqlDataReader result = command.ExecuteReader();

            while (result.Read())
            {
                int id = int.Parse(result["DCS_ID"].ToString());
                string libelle = result["DCS_LIBELLE"].ToString();

                new Decision(id, libelle);

            }
            Connexion.Close();
        }
        public static void lireEtapes()/*pour récuperer la table Etape et Etape normé vu que c'est un héritage*/
        {
            Globale.lesEtapes.Clear();

            Connexion.Open();

            SqlCommand command = new SqlCommand("prc_lire_Etapes", Connexion);
            command.CommandType = CommandType.StoredProcedure;
            SqlDataReader result = command.ExecuteReader();


            while (result.Read())
            {
                int numEtape = int.Parse(result["ETP_NUM"].ToString());
                string etapeLibelle = result["ETP_LIBELLE"].ToString();
                string norme = result["ETP_NORME"].ToString();
                DateTime dateNorme = DateTime.Parse(result["ETP_DATE_NORME"].ToString());

                Etape.lesEtapes.Add(new Etape(numEtape, etapeLibelle));//Ajout dans Etape

                Etape.lesEtapes.Add(new EtapeNormee(numEtape, etapeLibelle, norme, dateNorme));//Ajout dans Etape_Normée
            }
            Connexion.Close();
        }
        public static void GetWorkflowMedicament(Medicament Medic)//lire la table Workflow
        {
            Connexion.Open();

            SqlCommand command = new SqlCommand("prc_afficher_workflow", Connexion) { CommandType = CommandType.StoredProcedure };
            SqlParameter param = new SqlParameter("@depotLegal", SqlDbType.VarChar, 10) { Value = Medic.getDepotLegal() };
            //car il y a un paramètre dans notre procédure donc il indique qu'il y a un paramètre ici depotLegal
            command.Parameters.Add(param);// ajout du paramètre

            SqlDataReader result = command.ExecuteReader();

            List<Workflow> lesEtapes = new List<Workflow>();

            while (result.Read())
            {
                string depotlegal = result["MED_DEPOTLEGAL"].ToString();
                int etapeNum = int.Parse(result["ETP_NUM"].ToString());
                int decisionID = int.Parse(result["DCS_ID"].ToString());
                DateTime dateDecision = DateTime.Parse(result["dateDecision"].ToString());

                Workflow unWorkflow = new Workflow(depotlegal, etapeNum, decisionID, dateDecision);
                lesEtapes.Add(unWorkflow);//ajout
            }
            Medic.setLesEtapes(lesEtapes);//permet de lire Workflow à partir de la classe médicament
            Connexion.Close();
        }
    }
}

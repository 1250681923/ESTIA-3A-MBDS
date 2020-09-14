using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace FlecheCalcule
{
    class DataImport
    {
        public Dictionary<string, string> ImportMaterieuxFromFile(string fileToImport)
        {

            //Dictionnaire qui stockera les données importées
            Dictionary<string, string> ImportDictionary = new Dictionary<string, string>();

            try
            {
                // Create an instance of StreamReader to read from a file.
                // The using statement also closes the StreamReader.
                using (StreamReader sr = new StreamReader(fileToImport))
                {
                    ///Variable temporaire pour stocker chaque ligne lue
                    string line;
                    // Read and display lines from the file until the end of
                    // the file is reached.
                    while ((line = sr.ReadLine()) != null)
                    {
                        //Découpage de la ligne lue selon le séparateur ";"
                        //Le résultat est un tableau de deux strings: [login,password]
                        string[] Materieux = line.Split(':');

                        //On ajoute un nouveau login-password dans le dictionary
                        //le login en key, le password en value, dans le dictionnaire
                        ImportDictionary.Add(Materieux[0], Materieux[1]);

                    }
                    sr.Close();
                }
            }
            catch (Exception e)
            {
                // Let the user know what went wrong.
                Console.WriteLine("The file could not be read:");
                Console.WriteLine(e.Message);
            }
            return ImportDictionary;
        }
    }
}

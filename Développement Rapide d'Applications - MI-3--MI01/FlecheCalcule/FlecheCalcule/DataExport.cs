using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace FlecheCalcule
{
    class DataExport
    {
       
            private string logfile;

            public DataExport()
            {
                logfile = "log.txt";
            }

            public string Logfile
            {
                get { return logfile; }
                set { logfile = value; }
            }

            public void Log(string textToLog)
            {
                using (StreamWriter sw = new StreamWriter(logfile, true))
                {
                    sw.WriteLine(textToLog);
                    sw.Close();
                }
            }
        
    }
}

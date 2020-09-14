using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FlecheCalcule
{
    class FlechCalculation
    {
        public double momentQuadratiqueCirculaire(double diametre)
        {
            return (diametre * Math.PI)/64;
        }

        public double momentQuadratiqueRectangulaire(double largeur, double hauteur)
        {
            return (largeur * Math.Pow(hauteur, 3)) / 12;
        }

        public double flecheRecCalcul(double charge, double longueur, int module, double moment)
        {
            return (charge * Math.Pow(longueur, 3)) / (3 * module * Math.Pow(10, 3) * moment);
        }

        public double flecheCirCalcul(double longueur, double charge, double diametre, double moment)
        {
            return (longueur * charge * diametre) / (2 * moment);
        }
    }
}

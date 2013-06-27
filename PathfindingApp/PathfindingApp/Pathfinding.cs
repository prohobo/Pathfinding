using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PathfindingApp
{
    public partial class Pathfinding : Form
    {
        private Algorithm[] algorithms;         // list of selectable algorithms for the combo box
        private Environment[] environments;     // list of selectable environments

        public Pathfinding()
        {
            InitializeComponent();
            InitializeTools();
        }

        private void InitializeTools()
        {
            algorithms = new Algorithm[1];
            algorithms[0] = new AStar();

            environments = new Environment[1];
            environments[0] = new StaticEnv();
        }
    }
}

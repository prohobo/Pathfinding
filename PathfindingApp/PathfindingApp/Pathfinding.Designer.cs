namespace PathfindingApp
{
    partial class Pathfinding
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.controlPanel = new System.Windows.Forms.Panel();
            this.unitsCountLabel = new System.Windows.Forms.Label();
            this.resetBtn = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.stopBtn = new System.Windows.Forms.Button();
            this.startBtn = new System.Windows.Forms.Button();
            this.environmentBox = new System.Windows.Forms.ComboBox();
            this.unitBar = new System.Windows.Forms.TrackBar();
            this.algorithmBox = new System.Windows.Forms.ComboBox();
            this.dataPanel = new System.Windows.Forms.Panel();
            this.drawPanel = new System.Windows.Forms.Panel();
            this.controlPanel.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.unitBar)).BeginInit();
            this.SuspendLayout();
            // 
            // controlPanel
            // 
            this.controlPanel.Controls.Add(this.unitsCountLabel);
            this.controlPanel.Controls.Add(this.resetBtn);
            this.controlPanel.Controls.Add(this.label3);
            this.controlPanel.Controls.Add(this.label2);
            this.controlPanel.Controls.Add(this.label1);
            this.controlPanel.Controls.Add(this.stopBtn);
            this.controlPanel.Controls.Add(this.startBtn);
            this.controlPanel.Controls.Add(this.environmentBox);
            this.controlPanel.Controls.Add(this.unitBar);
            this.controlPanel.Controls.Add(this.algorithmBox);
            this.controlPanel.Location = new System.Drawing.Point(13, 13);
            this.controlPanel.Name = "controlPanel";
            this.controlPanel.Size = new System.Drawing.Size(200, 457);
            this.controlPanel.TabIndex = 0;
            // 
            // unitsCountLabel
            // 
            this.unitsCountLabel.AutoSize = true;
            this.unitsCountLabel.Location = new System.Drawing.Point(161, 96);
            this.unitsCountLabel.Name = "unitsCountLabel";
            this.unitsCountLabel.Size = new System.Drawing.Size(35, 13);
            this.unitsCountLabel.TabIndex = 9;
            this.unitsCountLabel.Text = "label4";
            // 
            // resetBtn
            // 
            this.resetBtn.Enabled = false;
            this.resetBtn.Location = new System.Drawing.Point(4, 425);
            this.resetBtn.Name = "resetBtn";
            this.resetBtn.Size = new System.Drawing.Size(75, 23);
            this.resetBtn.TabIndex = 8;
            this.resetBtn.Text = "Reset";
            this.resetBtn.UseVisualStyleBackColor = true;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(3, 96);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(34, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "Units:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(3, 51);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(69, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Environment:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(3, 6);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "Algorithm:";
            // 
            // stopBtn
            // 
            this.stopBtn.Enabled = false;
            this.stopBtn.Location = new System.Drawing.Point(4, 395);
            this.stopBtn.Name = "stopBtn";
            this.stopBtn.Size = new System.Drawing.Size(75, 23);
            this.stopBtn.TabIndex = 4;
            this.stopBtn.Text = "Stop";
            this.stopBtn.UseVisualStyleBackColor = true;
            // 
            // startBtn
            // 
            this.startBtn.Enabled = false;
            this.startBtn.Location = new System.Drawing.Point(4, 366);
            this.startBtn.Name = "startBtn";
            this.startBtn.Size = new System.Drawing.Size(75, 23);
            this.startBtn.TabIndex = 3;
            this.startBtn.Text = "Start";
            this.startBtn.UseVisualStyleBackColor = true;
            // 
            // environmentBox
            // 
            this.environmentBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.environmentBox.FormattingEnabled = true;
            this.environmentBox.Location = new System.Drawing.Point(4, 67);
            this.environmentBox.Name = "environmentBox";
            this.environmentBox.Size = new System.Drawing.Size(193, 21);
            this.environmentBox.TabIndex = 2;
            // 
            // unitBar
            // 
            this.unitBar.Location = new System.Drawing.Point(4, 112);
            this.unitBar.Maximum = 100;
            this.unitBar.Minimum = 1;
            this.unitBar.Name = "unitBar";
            this.unitBar.Size = new System.Drawing.Size(192, 45);
            this.unitBar.TabIndex = 1;
            this.unitBar.Value = 1;
            // 
            // algorithmBox
            // 
            this.algorithmBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.algorithmBox.FormattingEnabled = true;
            this.algorithmBox.Location = new System.Drawing.Point(4, 22);
            this.algorithmBox.Name = "algorithmBox";
            this.algorithmBox.Size = new System.Drawing.Size(193, 21);
            this.algorithmBox.TabIndex = 0;
            // 
            // dataPanel
            // 
            this.dataPanel.Location = new System.Drawing.Point(220, 13);
            this.dataPanel.Name = "dataPanel";
            this.dataPanel.Size = new System.Drawing.Size(591, 64);
            this.dataPanel.TabIndex = 1;
            // 
            // drawPanel
            // 
            this.drawPanel.BackColor = System.Drawing.Color.Black;
            this.drawPanel.Location = new System.Drawing.Point(219, 83);
            this.drawPanel.Name = "drawPanel";
            this.drawPanel.Size = new System.Drawing.Size(592, 387);
            this.drawPanel.TabIndex = 2;
            // 
            // Pathfinding
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(823, 482);
            this.Controls.Add(this.drawPanel);
            this.Controls.Add(this.dataPanel);
            this.Controls.Add(this.controlPanel);
            this.Name = "Pathfinding";
            this.Text = "Pathfinding";
            this.controlPanel.ResumeLayout(false);
            this.controlPanel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.unitBar)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel controlPanel;
        private System.Windows.Forms.Panel dataPanel;
        private System.Windows.Forms.Panel drawPanel;
        private System.Windows.Forms.Button resetBtn;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button stopBtn;
        private System.Windows.Forms.Button startBtn;
        private System.Windows.Forms.ComboBox environmentBox;
        private System.Windows.Forms.TrackBar unitBar;
        private System.Windows.Forms.ComboBox algorithmBox;
        private System.Windows.Forms.Label unitsCountLabel;
    }
}


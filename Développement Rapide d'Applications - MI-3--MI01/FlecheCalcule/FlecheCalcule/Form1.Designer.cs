namespace FlecheCalcule
{
    partial class Form1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要修改
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.materiauxComboBox = new System.Windows.Forms.ComboBox();
            this.importButton = new System.Windows.Forms.Button();
            this.rectangulaireCheckBox = new System.Windows.Forms.CheckBox();
            this.circulaireCheckBox = new System.Windows.Forms.CheckBox();
            this.longueurTextBox = new System.Windows.Forms.TextBox();
            this.largeurTextBox = new System.Windows.Forms.TextBox();
            this.hauteurTextBox = new System.Windows.Forms.TextBox();
            this.diametreTextBox = new System.Windows.Forms.TextBox();
            this.chargeBox = new System.Windows.Forms.TextBox();
            this.calculerButton = new System.Windows.Forms.Button();
            this.effacerButton = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(99, 57);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(71, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Materiau :";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(90, 137);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(136, 17);
            this.label2.TabIndex = 1;
            this.label2.Text = "Forme de la poutre :";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(99, 474);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(86, 17);
            this.label3.TabIndex = 2;
            this.label3.Text = "Charge (N) :";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(99, 205);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(113, 17);
            this.label4.TabIndex = 3;
            this.label4.Text = "Longueur (mm) :";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(99, 275);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(102, 17);
            this.label5.TabIndex = 4;
            this.label5.Text = "Largeur (mm) :";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(99, 343);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(99, 17);
            this.label6.TabIndex = 5;
            this.label6.Text = "Hauteur (mm):";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(99, 409);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(109, 17);
            this.label7.TabIndex = 6;
            this.label7.Text = "Diametre (mm) :";
            // 
            // materiauxComboBox
            // 
            this.materiauxComboBox.FormattingEnabled = true;
            this.materiauxComboBox.Location = new System.Drawing.Point(249, 57);
            this.materiauxComboBox.Name = "materiauxComboBox";
            this.materiauxComboBox.Size = new System.Drawing.Size(231, 24);
            this.materiauxComboBox.TabIndex = 7;
            // 
            // importButton
            // 
            this.importButton.Location = new System.Drawing.Point(547, 57);
            this.importButton.Name = "importButton";
            this.importButton.Size = new System.Drawing.Size(162, 23);
            this.importButton.TabIndex = 8;
            this.importButton.Text = "Importer Materiaux";
            this.importButton.UseVisualStyleBackColor = true;
            this.importButton.Click += new System.EventHandler(this.importButton_Click);
            // 
            // rectangulaireCheckBox
            // 
            this.rectangulaireCheckBox.AutoSize = true;
            this.rectangulaireCheckBox.Location = new System.Drawing.Point(249, 136);
            this.rectangulaireCheckBox.Name = "rectangulaireCheckBox";
            this.rectangulaireCheckBox.Size = new System.Drawing.Size(118, 21);
            this.rectangulaireCheckBox.TabIndex = 9;
            this.rectangulaireCheckBox.Text = "Rectangulaire";
            this.rectangulaireCheckBox.UseVisualStyleBackColor = true;
            this.rectangulaireCheckBox.CheckedChanged += new System.EventHandler(this.rectangulaireCheckBox_CheckedChanged);
            // 
            // circulaireCheckBox
            // 
            this.circulaireCheckBox.AutoSize = true;
            this.circulaireCheckBox.Location = new System.Drawing.Point(404, 136);
            this.circulaireCheckBox.Name = "circulaireCheckBox";
            this.circulaireCheckBox.Size = new System.Drawing.Size(89, 21);
            this.circulaireCheckBox.TabIndex = 10;
            this.circulaireCheckBox.Text = "Circulaire";
            this.circulaireCheckBox.UseVisualStyleBackColor = true;
            this.circulaireCheckBox.CheckedChanged += new System.EventHandler(this.circulaireCheckBox_CheckedChanged);
            // 
            // longueurTextBox
            // 
            this.longueurTextBox.Location = new System.Drawing.Point(249, 202);
            this.longueurTextBox.Name = "longueurTextBox";
            this.longueurTextBox.Size = new System.Drawing.Size(231, 22);
            this.longueurTextBox.TabIndex = 11;
            this.longueurTextBox.Text = "0";
            // 
            // largeurTextBox
            // 
            this.largeurTextBox.Location = new System.Drawing.Point(249, 272);
            this.largeurTextBox.Name = "largeurTextBox";
            this.largeurTextBox.Size = new System.Drawing.Size(231, 22);
            this.largeurTextBox.TabIndex = 12;
            this.largeurTextBox.Text = "0";
            // 
            // hauteurTextBox
            // 
            this.hauteurTextBox.Location = new System.Drawing.Point(249, 340);
            this.hauteurTextBox.Name = "hauteurTextBox";
            this.hauteurTextBox.Size = new System.Drawing.Size(231, 22);
            this.hauteurTextBox.TabIndex = 13;
            this.hauteurTextBox.Text = "0";
            // 
            // diametreTextBox
            // 
            this.diametreTextBox.Location = new System.Drawing.Point(249, 406);
            this.diametreTextBox.Name = "diametreTextBox";
            this.diametreTextBox.Size = new System.Drawing.Size(231, 22);
            this.diametreTextBox.TabIndex = 14;
            this.diametreTextBox.Text = "0";
            // 
            // chargeBox
            // 
            this.chargeBox.Location = new System.Drawing.Point(249, 471);
            this.chargeBox.Name = "chargeBox";
            this.chargeBox.Size = new System.Drawing.Size(231, 22);
            this.chargeBox.TabIndex = 15;
            this.chargeBox.Text = "0";
            // 
            // calculerButton
            // 
            this.calculerButton.Location = new System.Drawing.Point(102, 550);
            this.calculerButton.Name = "calculerButton";
            this.calculerButton.Size = new System.Drawing.Size(172, 73);
            this.calculerButton.TabIndex = 17;
            this.calculerButton.Text = "Calculer";
            this.calculerButton.UseVisualStyleBackColor = true;
            this.calculerButton.Click += new System.EventHandler(this.calculerButton_Click);
            // 
            // effacerButton
            // 
            this.effacerButton.Location = new System.Drawing.Point(321, 550);
            this.effacerButton.Name = "effacerButton";
            this.effacerButton.Size = new System.Drawing.Size(172, 73);
            this.effacerButton.TabIndex = 18;
            this.effacerButton.Text = "Effacer";
            this.effacerButton.UseVisualStyleBackColor = true;
            this.effacerButton.Click += new System.EventHandler(this.effacerButton_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(547, 550);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(162, 73);
            this.button4.TabIndex = 19;
            this.button4.Text = "Choisir emplacement de Log";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            this.openFileDialog1.FileOk += new System.ComponentModel.CancelEventHandler(this.openFileDialog1_FileOk);
            // 
            // saveFileDialog1
            // 
            this.saveFileDialog1.DefaultExt = "txt";
            this.saveFileDialog1.Filter = "Text (txt) | *.txt";
            this.saveFileDialog1.FileOk += new System.ComponentModel.CancelEventHandler(this.saveFileDialog1_FileOk);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(909, 714);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.effacerButton);
            this.Controls.Add(this.calculerButton);
            this.Controls.Add(this.chargeBox);
            this.Controls.Add(this.diametreTextBox);
            this.Controls.Add(this.hauteurTextBox);
            this.Controls.Add(this.largeurTextBox);
            this.Controls.Add(this.longueurTextBox);
            this.Controls.Add(this.circulaireCheckBox);
            this.Controls.Add(this.rectangulaireCheckBox);
            this.Controls.Add(this.importButton);
            this.Controls.Add(this.materiauxComboBox);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ComboBox materiauxComboBox;
        private System.Windows.Forms.Button importButton;
        private System.Windows.Forms.CheckBox rectangulaireCheckBox;
        private System.Windows.Forms.CheckBox circulaireCheckBox;
        private System.Windows.Forms.TextBox longueurTextBox;
        private System.Windows.Forms.TextBox largeurTextBox;
        private System.Windows.Forms.TextBox hauteurTextBox;
        private System.Windows.Forms.TextBox diametreTextBox;
        private System.Windows.Forms.TextBox chargeBox;
        private System.Windows.Forms.Button calculerButton;
        private System.Windows.Forms.Button effacerButton;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.SaveFileDialog saveFileDialog1;
    }
}


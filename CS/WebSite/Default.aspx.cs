using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }
    protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e) {
        ASPxGridView1.Selection.UnselectAll();
        string[] parameters = e.Parameters.Split(';');
        Boolean index = Convert.ToBoolean(parameters[0]);
        string text = parameters[1].ToLower();
        string productName;
        for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++) {
            productName = ASPxGridView1.GetRowValues(i, "ProductName").ToString().ToLower();
            if (productName.Contains(text) && index)
                ASPxGridView1.Selection.SelectRow(i);
            if (productName.IndexOf(text) == 0 && !index)
                ASPxGridView1.Selection.SelectRow(i);
        }
    }
}

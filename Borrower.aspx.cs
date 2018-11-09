using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Borrower : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
 
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "We have recieved your information.<br />" +
                              "We are currently building our inventory search.";
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtPhone.Text = "";
        lblMessage.Text = "";
    }
}
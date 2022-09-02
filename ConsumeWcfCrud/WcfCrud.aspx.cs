using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConsumeWcfCrud.WcfCrudRef;
namespace ConsumeWcfCrud
{
    public partial class WcfCrud : System.Web.UI.Page
    {
        WcfCrudRef.Service1Client obj = new WcfCrudRef.Service1Client(); 
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                BindEmpDetails(null);
                ClearControls();
                lblStatus.Text = String.Empty;
            }
        }

        private void SaveEmpDetails()
        {
            EmpDetails eDetails = new EmpDetails();
            eDetails.Name = txtName.Text.Trim();
            eDetails.Salary = txtSalary.Text.Trim();
            eDetails.DeptId = txtDeptId.Text.Trim();
            lblStatus.Text = obj.InsertEmpDetails(eDetails);
            BindEmpDetails(null);
            //ClearControls();
            //BindEmpDetails(null);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (btnSubmit.Text == "Update")
            {
                UpdateEmpDetails();
            }
            else
            {
                SaveEmpDetails();
            }
        }

        private void UpdateEmpDetails()
        {
            EmpDetails eDetails = new EmpDetails();
            //eDetails.Id = Convert.ToInt32(ViewState["Id"].ToString());
            eDetails.DeptId = (ViewState["DeptId"].ToString());
            eDetails.Name = txtName.Text.Trim();
            eDetails.Salary = txtSalary.Text.Trim();
            //eDetails.DeptId = txtDeptId.Text.Trim();
            obj.UpdateEmpDetails(eDetails);
            lblStatus.Text = obj.UpdateEmpDetails(eDetails);
            ClearControls();
            BindEmpDetails(null);
        }
        protected void lnkDelete_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            EmpDetails eDetails = new EmpDetails();
            eDetails.DeptId = (e.CommandArgument.ToString());
            if (obj.DeleteEmpDetails(eDetails) == true)
            {
                lblStatus.Text = "Record deleted Successfully";
            }
            else
            {
                lblStatus.Text = "Record couldn't be deleted";
            }
            BindEmpDetails(null);
        }

    
        protected void lnkEdit_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            EmpDetails eDetails = new EmpDetails();
            eDetails.DeptId = (e.CommandArgument.ToString());
            ViewState["DeptId"] = eDetails.DeptId;
            DataSet ds = new DataSet();
            ds = obj.FetchUpdatedRecords(eDetails);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtSalary.Text = ds.Tables[0].Rows[0]["Salary"].ToString();
                txtDeptId.Text = ds.Tables[0].Rows[0]["DeptId"].ToString();
                btnSubmit.Text = "Update";
            }
        }

        private void BindEmpDetails(int? Id)
        {
            EmpDetails eDetails = new EmpDetails();
            DataSet ds = new DataSet();
            ds = obj.GetEmpDetails(eDetails);
            grdWcfTest.DataSource = ds;
            grdWcfTest.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //ClearControls();
            lblStatus.Text = string.Empty;
            ClearControls();
        }


        private void ClearControls()
        {
            txtName.Text = string.Empty;
            txtSalary.Text = string.Empty;
            txtDeptId.Text = string.Empty;
            btnSubmit.Text = "Submit";
            txtName.Focus();
        }



    }
}

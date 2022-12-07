Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Protected Sub ASPxGridView1_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs)
		ASPxGridView1.Selection.UnselectAll()
		Dim parameters() As String = e.Parameters.Split(";"c)
		Dim index As Boolean = Convert.ToBoolean(parameters(0))
		Dim text As String = parameters(1).ToLower()
		Dim productName As String
		For i As Integer = 0 To ASPxGridView1.VisibleRowCount - 1
			productName = ASPxGridView1.GetRowValues(i, "ProductName").ToString().ToLower()
			If productName.Contains(text) AndAlso index Then
				ASPxGridView1.Selection.SelectRow(i)
			End If
			If productName.IndexOf(text) = 0 AndAlso (Not index) Then
				ASPxGridView1.Selection.SelectRow(i)
			End If
		Next i
	End Sub
End Class

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PawCare._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

 <div class="container py-4">

    <div class="text-center mb-4">
        <h1>🐾 Veterinaria PawCare</h1>
        <p class="lead">Registro de mascotas</p>
    </div>

    <div class="row g-4">

    
        <div class="col-12 col-lg-5">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="card-title">Registrar mascota</h3>

<div class="mb-3">
    <label for="txtNombreMascota" class="form-label">
        Nombre de la mascota
    </label>

    <asp:TextBox 
        ID="txtNombreMascota" 
        runat="server" 
        CssClass="form-control">
    </asp:TextBox>

    <asp:RequiredFieldValidator
        ID="rfvNombreMascota"
        runat="server"
        ControlToValidate="txtNombreMascota"
        ErrorMessage="Ingrese el nombre de la mascota."
        CssClass="text-danger"
        Display="Dynamic">
    </asp:RequiredFieldValidator>
</div>


<div class="mb-3">
    <label for="txtNombreDueno" class="form-label">
        Nombre del dueño
    </label>

    <asp:TextBox
        ID="txtNombreDueno"
        runat="server"
        CssClass="form-control">
    </asp:TextBox>

    <asp:RequiredFieldValidator
        ID="rfvNombreDueno"
        runat="server"
        ControlToValidate="txtNombreDueno"
        ErrorMessage="Ingrese el nombre del dueño."
        CssClass="text-danger"
        Display="Dynamic">
    </asp:RequiredFieldValidator>
</div>

<div class="mb-3">
    <label for="ddlTipo" class="form-label">
        Tipo de mascota
    </label>

    <asp:DropDownList
        ID="ddlTipo"
        runat="server"
        CssClass="form-select">

        <asp:ListItem Text="Seleccione" Value=""></asp:ListItem>
        <asp:ListItem Text="Perro" Value="Perro"></asp:ListItem>
        <asp:ListItem Text="Gato" Value="Gato"></asp:ListItem>
        <asp:ListItem Text="Otro" Value="Otro"></asp:ListItem>

    </asp:DropDownList>

    <asp:RequiredFieldValidator
        ID="rfvTipo"
        runat="server"
        ControlToValidate="ddlTipo"
        InitialValue=""
        ErrorMessage="Seleccione el tipo de mascota."
        CssClass="text-danger"
        Display="Dynamic">
    </asp:RequiredFieldValidator>
</div>

<div class="mb-3">
    <label for="txtEdad" class="form-label">
        Edad
    </label>

    <asp:TextBox
        ID="txtEdad"
        runat="server"
        TextMode="Number"
        CssClass="form-control">
    </asp:TextBox>

    <asp:RangeValidator
        ID="rvEdad"
        runat="server"
        ControlToValidate="txtEdad"
        Type="Integer"
        MinimumValue="0"
        MaximumValue="30"
        ErrorMessage="La edad debe estar entre 0 y 30 años."
        CssClass="text-danger"
        Display="Dynamic">
    </asp:RangeValidator>
</div>

<div class="mb-3">
    <label for="txtTelefono" class="form-label">
        Teléfono
    </label>

    <asp:TextBox
        ID="txtTelefono"
        runat="server"
        CssClass="form-control"
        MaxLength="9">
    </asp:TextBox>

    <asp:RegularExpressionValidator
        ID="revTelefono"
        runat="server"
        ControlToValidate="txtTelefono"
        ValidationExpression="^[0-9]{9}$"
        ErrorMessage="Ingrese un teléfono válido de 9 dígitos."
        CssClass="text-danger"
        Display="Dynamic">
    </asp:RegularExpressionValidator>
</div>

<div class="mb-3">
    <label for="txtObservaciones" class="form-label">
        Observaciones
    </label>

    <asp:TextBox
        ID="txtObservaciones"
        runat="server"
        TextMode="MultiLine"
        Rows="4"
        CssClass="form-control">
    </asp:TextBox>
</div>

<div class="d-grid">
    <asp:Button
        ID="btnGuardar"
        runat="server"
        Text="Guardar mascota"
        CssClass="btn btn-primary"
        OnClick="btnGuardar_Click"
        CausesValidation="true" />
</div>


                </div>
            </div>
        </div>

        <div class="col-12 col-lg-7">
            <div class="card shadow-sm">
<div class="card-body">
    <h5 class="card-title">Mascotas registradas</h5>

    <div class="table-responsive">
        <asp:GridView ID="gvMascotas" runat="server"
            AutoGenerateColumns="False"
            CssClass="table table-striped table-bordered table-hover">
            <Columns>

                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="NombreMascota" HeaderText="Mascota" />
                <asp:BoundField DataField="NombreDueno" HeaderText="Dueño" />
                <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                <asp:BoundField DataField="Edad" HeaderText="Edad" />
                <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" />

            </Columns>
        </asp:GridView>
    </div>
</div>
            </div>
        </div>

    </div>

</div>

</asp:Content>

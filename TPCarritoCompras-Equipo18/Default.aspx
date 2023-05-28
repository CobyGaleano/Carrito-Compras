﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPCarritoCompras_Equipo18.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Listado de productos</h1>

    <div class="container ">
        <div class="row row-cols-1 row-cols-md-3 g-4">
            ">
            <%-- Leo los articulos --%>
            <%foreach (Dominio.Articulo art in listaArticulos)
                {
                    string imagen = "https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg";
                    bool encontro = false;
                    //Leo las imagenes
                    foreach (Dominio.Imagen img in listaImagenes)
                    {
                        if (art.Id == img.IdArticulo && encontro == false)
                        {
                            imagen = img.ImagenUrl;
                            encontro = true;
                        }
                    }

            %>
            <div class="col">
                <%-- Cargo las tarjetas --%>
                <div class="card h-100">
                    <img src="<%:imagen%>" class="card-img-top" alt="Imagen del articulo">
                    <div class="card-body">
                        <h5 class="card-title"><%:art.Nombre %></h5>
                        <p class="card-text"><%: art.Descripcion %></p>
                        <a href="Detalle.aspx?id=<%:art.Id %>" class="btn btn-secondary">Ver detalle </a>
                        <a href="Carrito.aspx" class="btn btn-secondary">Añadir al carrito </a>
                    </div>
                </div>
            </div>
            <%  }%>
        </div>
    </div>
</asp:Content>

﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Negocio
{
    public class AccesoDatos
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;

        public SqlDataReader Lector
        {
            get { return lector; }
        }

        public AccesoDatos()
        {
            //ELIAS:
            //conexion = new SqlConnection("server=.\\SQLEXPRESSLAB3; database=CATALOGO_P3_DB; integrated security=false; user = sa; password = 123456");
            //BRIAN: 
            conexion = new SqlConnection("server=.\\SQLLABO3; database=CATALOGO_P3_DB; integrated security=false; user = sa; password = 123456");
            //JOAQUIN:
            //conexion = new SqlConnection("server=.\\SQLEXPRESS01; database=CATALOGO_P3_DB; integrated security=true ");
            comando = new SqlCommand();
        }

        public void setearConsulta(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }

        public void ejecutarLectura()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
            }
            catch (Exception ex) 
            {
                throw ex;
            }
        }

        public void cerrarConexion()
        {
            if(lector != null) 
            {
                lector.Close();
                conexion.Close();    
            }
        }

        public void setearParametros(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }

        public void ejecutarAccion()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
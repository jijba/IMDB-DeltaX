using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace IMDB.Models
{
    public class MovieDataAccessLayer
    {
     
        string connectionString = "Data Source=USHYDMOHIAGRAW4\\SQLEXPRESS;Initial Catalog=IMDB;Integrated Security=True";

        //To View all movies details    
        public IEnumerable<Movie> GetAllMovies()
        {
            List<Movie> lstmovie = new List<Movie>();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].GetAllMovies", con);
                cmd.CommandType = CommandType.StoredProcedure;
                
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Movie movie = new Movie();

                    movie.Movie_ID = Convert.ToInt32(rdr["Movie_ID"]);
                    movie.Name = rdr["Name"].ToString();
                    movie.Plot = rdr["Plot"].ToString();
                    movie.Poster = rdr["Poster"].ToString();
                    movie.Producer = rdr["Producer"].ToString();
                    movie.Year_Of_Release = Convert.ToInt32(rdr["Year_Of_Release"]);
                    lstmovie.Add(movie);
                }
                rdr.NextResult();
                while (rdr.Read())
                {
                    foreach (var movie in lstmovie)
                    {
                         if (movie.Movie_ID == Convert.ToInt32(rdr["Movie_ID"])){
                           movie.Actors = rdr["Actors"].ToString().Split(',');
                        }
                    }
                }

                foreach (var movie in lstmovie)
                {
                    movie.ActorList = GetAllActors();
                    movie.ProducerList = GetAllProducers();
                }
               
            }

            return lstmovie;
        }

        //To View all Producer details    
        public IEnumerable<Producer> GetAllProducers()
        {
            List<Producer> lstProducer = new List<Producer>();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].GetAllProducers", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Producer producer = new Producer();

                    producer.Producer_ID = Convert.ToInt32(rdr["Producer_ID"]);
                    producer.Name = rdr["Name"].ToString();
                  
                    lstProducer.Add(producer);
                }
                con.Close();
            }
            return lstProducer;
        }

        //To View all Actor details    
        public IEnumerable<Actor> GetAllActors()
        {
            List<Actor> lstActor = new List<Actor>();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].GetAllActors", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Actor actor = new Actor();

                    actor.Actor_ID = Convert.ToInt32(rdr["Actor_ID"]);
                    actor.Name = rdr["Name"].ToString();
                    lstActor.Add(actor);
                }
                con.Close();
            }
            return lstActor;
        }

      

        //To Add new movie record    
        public void AddMovie(Movie movie)
        {
            // DataSet dataSet = movie.ActorList.ToDataSet();
            DataTable dt = new DataTable();

            //Add columns to DataTable.
            dt.Columns.AddRange(new DataColumn[2] { new DataColumn("Actor_ID"), new DataColumn("RowNo") });

            //Set AutoIncrement True for the First Column.
            dt.Columns["RowNo"].AutoIncrement = true;

            //Set the Starting or Seed value.
            dt.Columns["RowNo"].AutoIncrementSeed = 1;

            //Set the Increment value.
            dt.Columns["RowNo"].AutoIncrementStep = 1;

            //Add rows to DataTable.
            foreach(string s in movie.Actors)

            {  
                 dt.Rows.Add(s,null);
            }
          
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("AddnewMovie", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Name", movie.Name);
                cmd.Parameters.AddWithValue("@Plot", movie.Plot);
                cmd.Parameters.AddWithValue("@Poster", movie.Poster);
                cmd.Parameters.AddWithValue("@ProducerID", movie.Producer_ID);
                cmd.Parameters.AddWithValue("@YearOfRelease", movie.Year_Of_Release);
                cmd.Parameters.AddWithValue("@Actors",dt);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        ////To Update the records of a particluar movie  
        public void UpdateMovie(Movie movie)
        {

            // DataSet dataSet = movie.ActorList.ToDataSet();
            DataTable dt = new DataTable();

            //Add columns to DataTable.
            dt.Columns.AddRange(new DataColumn[2] { new DataColumn("Actor_ID"), new DataColumn("RowNo") });

            //Set AutoIncrement True for the First Column.
            dt.Columns["RowNo"].AutoIncrement = true;

            //Set the Starting or Seed value.
            dt.Columns["RowNo"].AutoIncrementSeed = 1;

            //Set the Increment value.
            dt.Columns["RowNo"].AutoIncrementStep = 1;

            //Add rows to DataTable.
            foreach (string s in movie.Actors)

            {
                dt.Rows.Add(s, null);
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("EditMovie", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@MovieID", movie.Movie_ID);
                cmd.Parameters.AddWithValue("@Name", movie.Name);
                cmd.Parameters.AddWithValue("@Plot", movie.Plot);
                cmd.Parameters.AddWithValue("@Poster", movie.Poster);
                cmd.Parameters.AddWithValue("@ProducerID", movie.Producer_ID);
                cmd.Parameters.AddWithValue("@YearOfRelease", movie.Year_Of_Release);
                cmd.Parameters.AddWithValue("@Actors", dt);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        //Get the details of a particular employee  
        public Movie GetMovieData(int? id)
        {
            Movie movie = new Movie();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].GetMovieDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MovieID", id);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();


                while (rdr.Read())
                {
                    movie.Movie_ID = Convert.ToInt32(rdr["Movie_ID"]);
                    movie.Name = rdr["Name"].ToString();
                    movie.Plot = rdr["Plot"].ToString();
                    movie.Poster = rdr["Poster"].ToString();
                    movie.Producer = rdr["Producer"].ToString();
                    movie.Year_Of_Release = Convert.ToInt32(rdr["Year_Of_Release"]);
                    
                }
                rdr.NextResult();
                while (rdr.Read())
                {
                     movie.Actors = rdr["Actors"].ToString().Split(',');

                }

                movie.ActorList = GetAllActors();
                    movie.ProducerList = GetAllProducers();
            }
            return movie;
        }

        //To Add new producer record    
        public void AddProducer(Producer producer)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("AddnewProducer", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Name", producer.Name);
                cmd.Parameters.AddWithValue("@Sex", producer.Sex);
                cmd.Parameters.AddWithValue("@DOB", producer.DOB);
                cmd.Parameters.AddWithValue("@Bio", producer.Bio);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        //To Add new actor record    
        public void AddActor(Actor actor)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("AddnewActor", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Name", actor.Name);
                cmd.Parameters.AddWithValue("@Sex", actor.Sex);
                cmd.Parameters.AddWithValue("@DOB", actor.DOB);
                cmd.Parameters.AddWithValue("@Bio", actor.Bio);
                con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception e)
                {

                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
}
